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
    
}

@property (nonatomic, retain) NSString *pert_id;
@property (nonatomic, retain) NSString *pert_desc;

-(id) initWithPertId:(NSString *)pid pert_desc:(NSString *) desc;

@end
