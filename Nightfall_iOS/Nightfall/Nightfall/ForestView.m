//
//  ForestView.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "ForestView.h"

@implementation ForestView

- (id)initWithTransitionDelegate:(id<TransitioningViewController>) tvc {
    self = [super initWithTransitionDelegate:tvc Title:@"FOREST"];
    UIColor *forestGreenColor = [UIColor colorWithRed:0.1 green:0.3 blue:0.1 alpha:1.0];
    [self setBackgroundColor: forestGreenColor];
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
}

@end
