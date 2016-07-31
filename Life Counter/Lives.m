//
//  Lives.m
//  Life Counter
//
//  Created by Jimmy Lee on 7/29/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "Lives.h"

@implementation Lives

- (id)init {
    self = [super init];
    
    self.p1Life = 20;
    self.p2Life = 20;
    
    return self;
}


- (void)changeP1by:(NSInteger)delta {
    self.p1Life += delta;
    if (self.p1Life < 0) {
        self.p1Life = 0;
    }
}

- (void)changeP2by:(NSInteger)delta {
    self.p2Life += delta;
    if (self.p2Life < 0) {
        self.p2Life = 0;
    }
}

- (void)resetLives {
    self.p1Life = 20;
    self.p2Life = 20;
}

@end
