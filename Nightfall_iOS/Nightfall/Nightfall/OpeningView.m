//
//  OpeningView.m
//  Nightfall
//
//  Created by Jimmy Lee on 1/6/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "OpeningView.h"
#import "StartButton.h"
#import "Utils.h"
#import "ViewControllerProtocols.h"

@implementation OpeningView {
    UILabel *titleLabel;
    StartButton *startButton;
}

- (id)initWithTransitionDelegate:(id<TransitioningViewController>) tvc {
    self = [super init];
    self.transitionController = tvc;
    self.autoresizingMask = HORIZONTAL_CENTER_MASK;
    [self setBackgroundColor:[UIColor blackColor]];

    titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [titleLabel setText:@"Nightfall"];
    [titleLabel setTextColor:[UIColor whiteColor]];
    titleLabel.autoresizingMask = HORIZONTAL_CENTER_MASK;
    [self addSubview:titleLabel];
    
    startButton = [[StartButton alloc] initWithFrame:CGRectZero];
    startButton.autoresizingMask = HORIZONTAL_CENTER_MASK;
    [startButton addTarget:tvc action:@selector(switchViewControllers) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:startButton];
    
    return self;
}

- (void) layoutSubviews {
    [titleLabel sizeToFit];
    titleLabel.center = CGPointMake(self.center.x, 100);
    
    [startButton sizeToFit];
    startButton.center = CGPointMake(self.center.x, 400);
}

@end
