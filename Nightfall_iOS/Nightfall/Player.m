//
//  Player.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "Player.h"

@implementation Player

- (void) adjustGold:(NSInteger)amount {
    NSInteger newGold = [self gold] + amount;
    [self setGold:newGold];
}

@end
