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
static NSInteger defaultStat = 4;

static NSInteger STAT_MAX = 99;

- (id)init {
    self = [super init];

    self.HP_MAX = defaultHPMP;
    self.HP = self.HP_MAX;
    self.MP_MAX = defaultHPMP;
    self.MP = self.MP_MAX;

    self.atk = defaultStat;
    self.def = defaultStat;
    self.agi = defaultStat;
    self.luk = defaultStat;
    
    return self;
}

// TODO: handle temp until battle over. Copies current stats to revert after effects wear off. still has holes.
- (void)modifyAdditive:(StatType)type By:(NSInteger)delta {
    [self modify:type By:[NSNumber numberWithLong:delta] Adding:YES];
}

// TODO: test 0.5 reduction
- (void)modifyMultiplicative:(StatType)type By:(NSNumber *)delta {
    [self modify:type By:delta Adding:NO];
}

- (void)modify:(StatType)type By:(NSNumber *)delta Adding:(BOOL)add {
    switch (type) {
        case HP:
            self.HP = [Stat ceilingFloorAggregate:self.HP And:delta Adding:add Min:0 Max:self.HP_MAX];
            break;
        case MP:
            self.MP = [Stat ceilingFloorAggregate:self.MP And:delta Adding:add Min:0 Max:self.MP_MAX];
            break;
        case HP_MAX:
            self.HP_MAX = [Stat ceilingFloorAggregate:self.HP_MAX And:delta Adding:add Min:1 Max:STAT_MAX];
            break;
        case MP_MAX:
            self.MP_MAX = [Stat ceilingFloorAggregate:self.MP_MAX And:delta Adding:add Min:1 Max:STAT_MAX];
            break;
        case atk:
            self.atk = [Stat ceilingFloorAggregate:self.atk And:delta Adding:add Min:1 Max:STAT_MAX];
            break;
        case def:
            self.def = [Stat ceilingFloorAggregate:self.def And:delta Adding:add Min:1 Max:STAT_MAX];
            break;
        case agi:
            self.agi = [Stat ceilingFloorAggregate:self.agi And:delta Adding:add Min:1 Max:STAT_MAX];
            break;
        case luk:
            self.luk = [Stat ceilingFloorAggregate:self.luk And:delta Adding:add Min:1 Max:STAT_MAX];
            break;
        default:
            break;
    }
}

+ (NSInteger)ceilingFloorAggregate:(NSInteger)x And:(NSNumber *)y Adding:(BOOL)add Min: (NSInteger) min Max:(NSInteger)max {
    float result = min;
    if (add) {
        result = x + [y floatValue];
    } else {
        result = x * [y floatValue];
    }
    if (result < min) {
        result = min;
    } else if (result > max) {
        result = max;
    } else if (result > STAT_MAX) {
        result = STAT_MAX;
    }
    return (NSInteger)result;
}


@end
