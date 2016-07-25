//
//  Data.h
//  Nightfall
//
//  Created by Jimmy Lee on 7/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface Data : NSObject

+ (void)initializeCharacter;

+ (Player *)mainCharacter;

@end
