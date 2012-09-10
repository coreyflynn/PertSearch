//
//  RootViewController.h
//  PertSearch
//
//  Created by Corey Flynn on 9/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PertViewController.h"

@interface RootViewController : UITableViewController {
    PertViewController *pertView;
    NSMutableArray *filteredPerts;
    BOOL searching;
    BOOL letUserSelectRow;

}

@property(nonatomic,retain) PertViewController *pertView;

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar;
- (void) searchTableView:(UISearchBar *)searchBar;
- (void) doneSearching_Clicked:(id)sender;

@end
