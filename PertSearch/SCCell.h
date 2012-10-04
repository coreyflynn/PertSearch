//
//  SCCell.h
//  PertSearch
//
//  Created by Corey Flynn on 10/3/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SCCell : UITableViewCell {
    IBOutlet UILabel *cell_name;
    IBOutlet UILabel *cell_ss;
    IBOutlet UILabel *cell_cc;
    
}

@property (nonatomic, retain) IBOutlet UILabel *cell_name;
@property (nonatomic, retain) IBOutlet UILabel *cell_ss;
@property (nonatomic, retain) IBOutlet UILabel *cell_cc;

@end
