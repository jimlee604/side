//
//  Lives.h
//  Life Counter
//
//  Created by Jimmy Lee on 7/29/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lives : NSObject

@property NSInteger p1Life;
@property NSInteger p2Life;

- (void)changeP1by:(NSInteger)delta;
- (void)changeP2by:(NSInteger)delta;
- (void)resetLives;


@end
