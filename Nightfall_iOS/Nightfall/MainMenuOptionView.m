//
//  MainMenuOptionView.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "MainMenuOptionView.h"
#import "BackButton.h"
#import "Utils.h"

@implementation MainMenuOptionView {
    UILabel *titleLabel;
    GameButton *backButton;
}

- (id)initWithTransitionDelegate:(id<TransitioningViewController>) tvc Title:(NSString*)title {
    self = [super init];
    self.transitionController = tvc;
    //    self.autoresizingMask = HORIZONTAL_CENTER_MASK;
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [titleLabel setText:title];
    [titleLabel setTextColor:[UIColor whiteColor]];
    titleLabel.autoresizingMask = HORIZONTAL_CENTER_MASK;
    [self addSubview:titleLabel];
    
    backButton = [BackButton new];
    [backButton setTransitionToVC:tvc withSelector:@selector(switchViewControllers:)];
    [self addSubview:backButton];
    
    return self;
}

- (void) layoutSubviews {
    [titleLabel sizeToFit];
    titleLabel.center = CGPointMake(self.center.x, 100);
    
    CGRect frame = backButton.frame;
    frame.origin = CGPointMake(20,25);
    backButton.frame = frame;
}

@end
