//
//  ForestView.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "ForestView.h"
#import "Utils.h"

@implementation ForestView {
    GameButton *trainButton;
    GameButton *fightButton;
}

- (id)initWithTransitionDelegate:(id<TransitioningViewController>) tvc {
    self = [super initWithTransitionDelegate:tvc Title:@"FOREST"];
    UIColor *forestGreenColor = [UIColor colorWithRed:0.1 green:0.3 blue:0.1 alpha:1.0];
    [self setBackgroundColor: forestGreenColor];
    
    trainButton = [[GameButton alloc]initWithTitle:@"TRAIN"];
    [self addSubview:trainButton];
    
    fightButton = [[GameButton alloc]initWithTitle:@"FIGHT"];
    [self addSubview:fightButton];
    
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    [Utils horizontallyCenterView:trainButton within:self AtY:300];
    [Utils horizontallyCenterView:fightButton within:self AtY:350];
}

@end
