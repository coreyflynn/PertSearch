//
//  Pert.h
//  PertSearch
//
//  Created by Corey Flynn on 9/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Pert : NSObject {
    NSString *pert_id;
    NSString *pert_desc;
    NSString *pert_type;
    NSString *pert_cells;
    NSString *pert_plates;
    NSString *pert_ss;
    NSString *pert_cc;
    UIImage *type_image;
    NSMutableArray *cell_array;
    
}

@property (nonatomic, retain) NSString *pert_id;
@property (nonatomic, retain) NSString *pert_desc;
@property (nonatomic, retain) NSString *pert_type;
@property (nonatomic, retain) NSString *pert_cells;
@property (nonatomic, retain) NSString *pert_plates;
@property (nonatomic, retain) NSString *pert_ss;
@property (nonatomic, retain) NSString *pert_cc;
@property (nonatomic, retain) UIImage *type_image;
@property (nonatomic, retain) NSMutableArray *cell_array;

-(id) initWithPertId:(NSString *)pid pert_desc:(NSString *)desc pert_type:(NSString *)type pert_cells:(NSString *)cells pert_plates:(NSString *)plates pert_ss:(NSString *)ss pert_cc:(NSString *)cc;

@end
