//
//  PertViewController.h
//  PertSearch
//
//  Created by Corey Flynn on 9/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PertViewController : UIViewController {
    IBOutlet UITextView *pertIdentifier;
    IBOutlet UITextView *pertDescription;
    IBOutlet UITextView *pertType;
    IBOutlet UITextView *pertCells;
    IBOutlet UITextView *pertPlates;
    
}

@property (nonatomic, retain) IBOutlet UITextView *pertIdentifier;
@property (nonatomic, retain) IBOutlet UITextView *pertDescription;
@property (nonatomic, retain) IBOutlet UITextView *pertType;
@property (nonatomic, retain) IBOutlet UITextView *pertCells;
@property (nonatomic, retain) IBOutlet UITextView *pertPlates;

@end
