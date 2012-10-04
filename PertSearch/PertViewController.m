//
//  PertViewController.m
//  PertSearch
//
//  Created by Corey Flynn on 9/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "PertViewController.h"
#import "SCCell.h"


@implementation PertViewController

@synthesize pertIdentifier, pertDescription, pertImage, pertType, pertCells, pertPlates;
@synthesize pertCCLabel, pertSSLabel, pertCCProgress, pertSSProgress;
@synthesize cell_array,cellTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIScrollView *tempScrollView=(UIScrollView *)self.view;
    tempScrollView.contentSize=CGSizeMake(320,500);
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
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
//    PertSearchAppDelegate *appDelegate = (PertSearchAppDelegate *) [[UIApplication sharedApplication] delegate];
//    return appDelegate.perts.count;
    return [self.cell_array count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"SCCell";
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    static NSString *SCCellIdentifier = @"SCCell";

    SCCell *cell = (SCCell *)[tableView dequeueReusableCellWithIdentifier:SCCellIdentifier];
    if (cell == nil) 
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SCCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    } 

    // Configure the cell.
    double ss = 3;
    double cc = 0.1;
    [cell.cell_name setText:[self.cell_array objectAtIndex:indexPath.row]];
    [cell.cell_cc setText:@"0.20"];
    [cell.cell_cc setTextColor:[UIColor colorWithRed:1-((cc+.2)/1.0) green:(cc+.2)/1.0 blue:0 alpha:1]];
    [cell.cell_ss setText:@"5.21"];
    [cell.cell_ss setTextColor:[UIColor colorWithRed:1-((ss+6)/20) green:(ss+6)/20.0 blue:0 alpha:1]];
//    [cell.textLabel setText:[self.cell_array objectAtIndex:indexPath.row]];
//    [cell.detailTextLabel setText:[self.cell_array objectAtIndex:indexPath.row]];

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
//    //navigation logic create and push a new view controller
//    PertSearchAppDelegate *appDelegate = (PertSearchAppDelegate *)[[UIApplication sharedApplication] delegate];
//    Pert *pert = (Pert *)[appDelegate.perts objectAtIndex:indexPath.row];
//    
//    if (self.pertView == nil) {
//      PertViewController *viewController = [[PertViewController alloc] initWithNibName:@"PertViewController" bundle:nil];
//      self.pertView = viewController;
//      [viewController release];
//    }
//    
//    //setup the animation
//    [self.navigationController pushViewController:self.pertView animated:YES];
//    //set title of the view to the pert_id
//    self.pertView.title = [pert pert_id];
//
//    //set the pertIdentifier field
//    [self.pertView.pertIdentifier setText:[pert pert_id]];
//
//    //set the pertImage image
//    [self.pertView.pertImage setImage:[pert type_image]];
//
//    //set the pertDescription field
//    [self.pertView.pertDescription setText:[pert pert_desc]];
//
//    //set the strength idicators
//    [self.pertView.pertSSLabel setText:[NSString stringWithFormat:@"%.2f",[pert.pert_ss floatValue]]];
//    [self.pertView.pertSSProgress setProgress:[pert.pert_ss floatValue]/10];
//    
//    //set the reliability idicators
//    [self.pertView.pertCCLabel setText:[NSString stringWithFormat:@"%.2f",[pert.pert_cc floatValue]]];
//    [self.pertView.pertCCProgress setProgress:[pert.pert_cc floatValue]];
//        
//    //set the pertType field
//    [self.pertView.pertType setText:[pert pert_type]];
//
//    //set the pertCells field
//    [self.pertView.pertCells setText:[pert pert_cells]];
//
//    //set the pertPlates field
//    [self.pertView.pertPlates setText:[pert pert_plates]];

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}

@end
