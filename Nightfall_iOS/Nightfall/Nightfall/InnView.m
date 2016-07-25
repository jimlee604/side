//
//  InnView.m
//  Nightfall
//
//  Created by Jimmy Lee on 6/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "InnView.h"
#import "Utils.h"
#import "GameButton.h"
#import "BackButton.h"

@implementation InnView

- (id)initWithTransitionDelegate:(id<TransitioningViewController>) tvc {
    self = [super initWithTransitionDelegate:tvc Title:@"INN"];
    [self setBackgroundColor:[UIColor brownColor]];
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
}

@end
