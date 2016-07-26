//
//  Character.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/25/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "Character.h"
//#import "Stat.h"

@implementation Character {
    
    // equipment
    
    // stats
    NSInteger level;
    NSInteger exp; // need formula for level up
    
}

- (id)init {
    self = [super init];
    
    level = 1;
    self.gold = 0;
    self.stats = [Stat new];
    
    return self;
}

@end
