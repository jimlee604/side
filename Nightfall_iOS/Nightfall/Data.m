//
//  Data.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "Data.h"
#import "Player.h"

@implementation Data

static Player *mainCharacter;

+ (void)initializeCharacter {
    mainCharacter = [Player new];
}

+ (Player *)mainCharacter {
    return mainCharacter;
}

@end
