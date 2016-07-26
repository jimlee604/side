//
//  Character.h
//  Nightfall
//
//  Created by Jimmy Lee on 7/25/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stat.h"

@interface Character : NSObject

@property NSString *name;
@property NSInteger gold;
@property Stat *stats;
@property NSMutableArray *items;
//@property NSMutableArray<Item *> *items;

@end
