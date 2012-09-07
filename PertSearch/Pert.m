//
//  Pert.m
//  PertSearch
//
//  Created by Corey Flynn on 9/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Pert.h"


@implementation Pert
@synthesize pert_id,pert_desc;

-(id)initWithPertId:(NSString *)pid pert_desc:(NSString *)desc{
    self.pert_id = pid;
    self.pert_desc = desc;
    
    return self;
}

@end
