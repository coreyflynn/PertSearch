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
    
}

@property (nonatomic, retain) IBOutlet UITextView *pertIdentifier;
@property (nonatomic, retain) IBOutlet UITextView *pertDescription;

@end
