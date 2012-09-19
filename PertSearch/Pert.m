//
//  Pert.m
//  PertSearch
//
//  Created by Corey Flynn on 9/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Pert.h"


@implementation Pert
@synthesize pert_id,pert_desc,pert_type,pert_cells,pert_plates,type_image,pert_ss,pert_cc;


-(id) initWithPertId:(NSString *)pid pert_desc:(NSString *)desc pert_type:(NSString *)type pert_cells:(NSString *)cells pert_plates:(NSString *)plates pert_ss:(NSString *)ss pert_cc:(NSString *)cc{
    self.pert_id = pid;
    self.pert_desc = desc;
    self.pert_type = type;
    self.pert_cells = cells;
    self.pert_plates = plates;
    self.pert_ss = ss;
    self.pert_cc = cc;
    
    if ([self.pert_type isEqualToString:@"trt_cp"]) {
        UIImage *cellImage = [UIImage imageNamed:@"CP.png"];
        self.type_image =  cellImage;
    }else if ([self.pert_type isEqualToString:@"trt_sh"]) {
        UIImage *cellImage = [UIImage imageNamed:@"KD.png"];
        self.type_image =  cellImage;
    }else if ([self.pert_type isEqualToString:@"trt_oe"]) {
        UIImage *cellImage = [UIImage imageNamed:@"OE.png"];
        self.type_image =  cellImage;
    }else if ([self.pert_type isEqualToString:@"ctl_vehicle"]) {
        UIImage *cellImage = [UIImage imageNamed:@"CTL.png"];
        self.type_image =  cellImage;
    }else {
        UIImage *cellImage = [UIImage imageNamed:@"Null.png"];
        self.type_image =  cellImage;
}
    
    return self;
}

@end
