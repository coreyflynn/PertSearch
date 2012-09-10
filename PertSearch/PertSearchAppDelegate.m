//
//  PertSearchAppDelegate.m
//  PertSearch
//
//  Created by Corey Flynn on 9/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "PertSearchAppDelegate.h"
#import "RootViewController.h"
#import "Pert.h"

@implementation PertSearchAppDelegate


@synthesize window=_window;

@synthesize navigationController=_navigationController;

@synthesize perts,originalPerts;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    
    //setup some globals
    databaseName = @"PertDB.db";
    
    //get the path to the documents directory and append the databaseName
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    databasePath = [documentsDir stringByAppendingPathComponent:databaseName];
    
    //build the database from the application bundle if required 
    [self checkAndCreateDatabase];
    
    //query the database for all pert records and construct the perts array
    [self readPertsFromDatabase];
    
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [super dealloc];
}

-(void)checkAndCreateDatabase{
    //check to see if the sql database has already been saved to teh users phone. if not, bopy it over
    BOOL success;
    
    //Create a FileManager object, we will use this to check the status of the database and to copy it over if required
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //check to see if the database has already been created in the user's file system
    success = [fileManager fileExistsAtPath:databasePath];
    
    // if the file already exists, do nothing
    if (success) {
      return;
    }
    
    //if not, proceed and copy the database from the application to the user's filesystem
    
    //get the path to the database in the application package
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath
    ] stringByAppendingPathComponent:databaseName];
    
    //copy the database from the package to the users filesystem
    [fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];
    
    [fileManager release];
}

-(void)readPertsFromDatabase{
    //setup the database object
    sqlite3 *database;
    
    //init the perts array
    perts = [[NSMutableArray alloc] init];
    originalPerts = [[NSMutableArray alloc] init];
    
    //open the database from the users filesystem
    if (sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
      //setup the sqlite statement and compile if for faster access
      NSLog(@"opened db");
      const char *sqlStatment = "select * from pertdb";
      sqlite3_stmt *compiledStatement;
      if (sqlite3_prepare_v2(database, sqlStatment, -1, &compiledStatement, NULL) == SQLITE_OK) {
          //loop through the results and add them to the feeds array    
          while (sqlite3_step(compiledStatement) == SQLITE_ROW) {
              //read the data from the result row
              NSString *aPertID = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
              NSString *aPertDesc = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
              
              //creata a new Pert object for the row data
              Pert *pert = [[Pert alloc] initWithPertId:aPertID pert_desc:aPertDesc];
              
              //add the pert object to the perts array
              [perts addObject:pert];
              [originalPerts addObject:pert];
              
            }
        }
    //release the compiled statement from memory
    sqlite3_finalize(compiledStatement);
    }
}

@end
