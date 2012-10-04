//
//  PertViewController.h
//  PertSearch
//
//  Created by Corey Flynn on 9/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PertViewController : UIViewController {
    IBOutlet UILabel *pertIdentifier;
    IBOutlet UITextView *pertDescription;
    IBOutlet UIImageView *pertImage;
    IBOutlet UITextView *pertType;
    IBOutlet UITextView *pertCells;
    IBOutlet UITextView *pertPlates;
    IBOutlet UILabel *pertSSLabel;
    IBOutlet UILabel *pertCCLabel;
    IBOutlet UIProgressView *pertSSProgress;
    IBOutlet UIProgressView *pertCCProgress;
    IBOutlet UITableView *cellTable;
    NSArray *cell_array;
    
}

@property (nonatomic, retain) IBOutlet UILabel *pertIdentifier;
@property (nonatomic, retain) IBOutlet UITextView *pertDescription;
@property (nonatomic, retain) IBOutlet UIImageView *pertImage;
@property (nonatomic, retain) IBOutlet UITextView *pertType;
@property (nonatomic, retain) IBOutlet UITextView *pertCells;
@property (nonatomic, retain) IBOutlet UITextView *pertPlates;
@property (nonatomic, retain) IBOutlet UILabel *pertSSLabel;
@property (nonatomic, retain) IBOutlet UILabel *pertCCLabel;
@property (nonatomic, retain) IBOutlet UIProgressView *pertSSProgress;
@property (nonatomic, retain) IBOutlet UIProgressView *pertCCProgress;
@property (nonatomic, retain) IBOutlet UITableView *cellTable;
@property (nonatomic, retain) NSArray *cell_array;

@end
