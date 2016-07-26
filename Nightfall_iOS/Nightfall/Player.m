//
//  Player.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "Player.h"

@implementation Player

- (id)init {
    self = [super init];
    self.name = @"Nameless";
    self.items = [NSMutableArray new];
    return self;
}

- (void)gainGold:(NSInteger)amount {
    self.gold = self.gold + amount;
}

- (void)loseGold:(NSInteger)amount {
    [self gainGold:-amount];
    if (self.gold > 0) {
        self.gold = 0;
    }
}

- (void) adjustGold:(NSInteger)amount {
    NSInteger newGold = [self gold] + amount;
    [self setGold:newGold];
}

@end
