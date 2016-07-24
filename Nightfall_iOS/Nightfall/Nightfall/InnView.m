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

@implementation InnView {
    UILabel *titleLabel;
    GameButton *backButton;
}

- (id)initWithTransitionDelegate:(id<TransitioningViewController>) tvc {
    self = [super init];
    self.transitionController = tvc;
    //    self.autoresizingMask = HORIZONTAL_CENTER_MASK;
    [self setBackgroundColor:[UIColor brownColor]];
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [titleLabel setText:@"INN"];
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
    frame.origin = CGPointMake(20,20);
    backButton.frame = frame;
//    [backButton setContentEdgeInsets:UIEdgeInsetsZero];
//    [backButton sizeToFit];
}

@end
