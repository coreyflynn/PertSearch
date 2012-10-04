//
//  SCCell.m
//  PertSearch
//
//  Created by Corey Flynn on 10/3/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SCCell.h"

@implementation SCCell
@synthesize cell_name,cell_cc,cell_ss;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [super dealloc];
}

@end
