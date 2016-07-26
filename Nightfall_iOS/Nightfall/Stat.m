//
//  Stat.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/26/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "Stat.h"

@implementation Stat


static NSInteger defaultHPMP = 10;
//static NSInteger defaultStat = 4;

- (id)init {
    self = [super init];

    self.HP = defaultHPMP;
    self.MP = defaultHPMP;
    
    return self;
}

- (void)modifyAdditive:(StatType)type By:(NSInteger)delta {
    switch (type) {
        case HP:
            self.HP = [Stat ceilingFloorAdd:self.HP Plus:delta Max: self.HP_MAX];
            break;
        case MP:
            self.HP = [Stat ceilingFloorAdd:self.MP Plus:delta Max: self.MP_MAX];
        default:
            break;
    }
}

+ (NSInteger)ceilingFloorAdd:(NSInteger)x Plus:(NSInteger)y Max:(NSInteger)max {
    NSInteger result = x + y;
    if (result < 0) {
        result = 0;
    } else if (result > max) {
        result = max;
    }
    return result;
}

// TODO: test 0.5 reduction
- (void)modifyMultiplicative:(StatType)type By:(NSNumber*)delta {
    if (type == HP) {
        self.HP *= [delta floatValue];
    }
}

@end
