//
//  RootViewController.m
//  PertSearch
//
//  Created by Corey Flynn on 9/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "PertSearchAppDelegate.h"
#import "Pert.h"

@implementation RootViewController

@synthesize pertView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    PertSearchAppDelegate *appDelegate = (PertSearchAppDelegate *) [[UIApplication sharedApplication] delegate];
    NSString *num_perts = [NSString stringWithFormat:@"%d ", appDelegate.perts.count];
    self.title = [num_perts stringByAppendingString:@"Perturbagens"];
    
    //searching variables
    letUserSelectRow = YES;
    searching = NO;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
    if (interfaceOrientation == UIInterfaceOrientationPortrait) {
        return YES;
    } else if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        return YES;
    } else if (interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        return YES;
    } else if (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        return YES;
    } else {
        return NO;
    }
}


// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    PertSearchAppDelegate *appDelegate = (PertSearchAppDelegate *) [[UIApplication sharedApplication] delegate];
    return appDelegate.perts.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell.
    PertSearchAppDelegate *appDelegate = (PertSearchAppDelegate *) [[UIApplication sharedApplication] delegate];
    Pert *pert = (Pert *)[appDelegate.perts objectAtIndex:indexPath.row];
    [cell.imageView setImage:pert.type_image];
    [cell.textLabel setText:pert.pert_id];
    [cell.detailTextLabel setText:pert.pert_desc];

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //navigation logic create and push a new view controller
    PertSearchAppDelegate *appDelegate = (PertSearchAppDelegate *)[[UIApplication sharedApplication] delegate];
    Pert *pert = (Pert *)[appDelegate.perts objectAtIndex:indexPath.row];
    
    if (self.pertView == nil) {
      PertViewController *viewController = [[PertViewController alloc] initWithNibName:@"PertViewController" bundle:nil];
      self.pertView = viewController;
      [viewController release];
    }
    
    //setup the animation
    [self.navigationController pushViewController:self.pertView animated:YES];
    //set title of the view to the pert_id
    self.pertView.title = [pert pert_id];
    
    //set the pert array for the pertView
    
    NSArray *cell_array = [pert.pert_cells componentsSeparatedByString:@","];
    self.pertView.cell_array = [[NSArray alloc] initWithArray:cell_array];

    //set the pertIdentifier field
    [self.pertView.pertIdentifier setText:[pert pert_id]];

    //set the pertImage image
    [self.pertView.pertImage setImage:[pert type_image]];

    //set the pertDescription field
    [self.pertView.pertDescription setText:[pert pert_desc]];

    //set the strength idicators
    [self.pertView.pertSSLabel setText:[NSString stringWithFormat:@"%.2f",[pert.pert_ss floatValue]]];
    [self.pertView.pertSSProgress setProgress:[pert.pert_ss floatValue]/10];
    
    //set the reliability idicators
    [self.pertView.pertCCLabel setText:[NSString stringWithFormat:@"%.2f",[pert.pert_cc floatValue]]];
    [self.pertView.pertCCProgress setProgress:[pert.pert_cc floatValue]];
        
    //set the pertType field
    [self.pertView.pertType setText:[pert pert_type]];

    //set the pertCells field
    [self.pertView.pertCells setText:[pert pert_cells]];

    //set the pertPlates field
    [self.pertView.pertPlates setText:[pert pert_plates]];

}


- (void)searchBarSearchButtonClicked:(UISearchBar *)theSearchBar{
    [self searchTableView:searchBar];
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)theSearchBar{
    [searchBar resignFirstResponder];
}

- (void) searchBarTextDidBeginEditing:(UISearchBar *)theSearchBar {
 
    searching = YES;
    letUserSelectRow = NO;
    self.tableView.scrollEnabled = NO;
    
    //Add the done button.
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]
    initWithBarButtonSystemItem:UIBarButtonSystemItemDone
    target:self action:@selector(doneSearching_Clicked:)] autorelease];

}

- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText{
    PertSearchAppDelegate *appDelegate = (PertSearchAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //if the search box has text, filter the data by calling searchTableView, otherwise show the full list
    if ([searchText length] > 0) {
       searching = YES;
       letUserSelectRow = YES;
       self.tableView.scrollEnabled = YES;
       [self searchTableView:theSearchBar];
    }else{
       searching = NO;
       letUserSelectRow = NO;
       self.tableView.scrollEnabled = NO;
       [appDelegate.perts removeAllObjects];
       [appDelegate.perts addObjectsFromArray:appDelegate.originalPerts];
       NSString *num_perts = [NSString stringWithFormat:@"%d ", appDelegate.perts.count];
       self.title = [num_perts stringByAppendingString:@"Perturbagens"];
    }
    
    //reload the tableView data
    [self.tableView reloadData];
    
}

- (NSIndexPath *)tableView :(UITableView *)theTableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
if(letUserSelectRow){
    return indexPath;
}else{
    return nil;
}

}

- (void) searchTableView :(UISearchBar *)theSearchBar{
    //remove objects from orignialPerts
    PertSearchAppDelegate *appDelegate = (PertSearchAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.perts removeAllObjects];
    
    NSString *searchText = searchBar.text;
    NSMutableArray *searchArray = [[NSMutableArray alloc] init];
    
    [searchArray addObjectsFromArray:appDelegate.originalPerts];
    
    for (Pert *p in searchArray) {
        NSRange idResultRange = [p.pert_id rangeOfString:searchText options:NSCaseInsensitiveSearch];
        NSRange descResultRange = [p.pert_desc rangeOfString:searchText options:NSCaseInsensitiveSearch];
        if (idResultRange.length > 0 || descResultRange.length > 0) {
          [appDelegate.perts addObject:p];
        }
    }
    NSString *num_perts = [NSString stringWithFormat:@"%d ", appDelegate.perts.count];
    self.title = [num_perts stringByAppendingString:@"Perturbagens"];
}

- (void) doneSearching_Clicked:(id)sender{
 
    searchBar.text = @"";
    [searchBar resignFirstResponder];
     
    letUserSelectRow = YES;
    searching = NO;
    self.navigationItem.rightBarButtonItem = nil;
    self.tableView.scrollEnabled = YES;
     
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}

@end
