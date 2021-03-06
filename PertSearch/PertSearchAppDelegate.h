//
//  PertSearchAppDelegate.h
//  PertSearch
//
//  Created by Corey Flynn on 9/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface PertSearchAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UINavigationController *navigationController;
    
    //database variables
    NSString *databaseName;
    NSString *databasePath;
    
    //Array to store the Pert objects
    NSMutableArray *perts;
    NSMutableArray *originalPerts;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) NSMutableArray *perts;
@property (nonatomic, retain) NSMutableArray *originalPerts;

-(void)readPertsFromDatabase;
-(void)checkAndCreateDatabase;

@end
