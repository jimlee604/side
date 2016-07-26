//
//  Consumable.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/26/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "Consumable.h"

/** Consumables are items that directly modify stats. */
@implementation Consumable

-(void)useOnCharacter:(Character *)character {
    Stat *charStat = character.stats;
    if (self.modifyType == add) {
        [charStat modifyAdditive:self.statType By:[self.modifyValue intValue]];
    } else if (self.modifyType == mult) {
        [charStat modifyMultiplicative:self.statType By:self.modifyValue];
    }
}

@end

@implementation HealthPotion

-(id)init {
    self = [super init];
    self.statType = HP;
    self.modifyType = add;
    self.modifyValue = [NSNumber numberWithInt:10];
    return self;
}

@end