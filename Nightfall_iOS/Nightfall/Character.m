//
//  Character.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/25/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "Character.h"

@implementation Character {
    //name? with cute name generators otherwise default.
    
    // stats
    NSInteger level;
    
    NSInteger HP;
    NSInteger MP;
    NSInteger atk;
    NSInteger def;
    NSInteger agi;
    NSInteger luk;
    
    NSInteger gold;

}

static NSInteger defaultHPMP = 10;
static NSInteger defaultStat = 4;

- (id)init {
    self = [super init];
    
    level = 1;
    
    HP = defaultHPMP;
    MP = defaultHPMP;
    atk = defaultStat;
    def = defaultStat;
    agi = defaultStat;
    luk = defaultStat;
    
    gold = 0;
    
    return self;
}

// have a calculate damage or calculate first move. takes another character as an arg

@end
