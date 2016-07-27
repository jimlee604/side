//
//  Stat.h
//  Nightfall
//
//  Created by Jimmy Lee on 7/26/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stat : NSObject

typedef enum {
    HP,
    MP,
    HP_MAX,
    MP_MAX,
    atk,
    def,
    agi,
    luk
} StatType;

typedef enum {
    add,
    mult,
} ModifyType;

@property NSInteger HP;
@property NSInteger HP_MAX;
@property NSInteger MP;
@property NSInteger MP_MAX;

@property NSInteger atk;
@property NSInteger def;
@property NSInteger agi;
@property NSInteger luk;

- (void)modifyAdditive:(StatType)type By:(NSInteger)delta;

- (void)modifyMultiplicative:(StatType)type By:(NSNumber*)delta;



@end
