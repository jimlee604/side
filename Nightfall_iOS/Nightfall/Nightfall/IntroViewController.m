//
//  IntroViewController.m
//  Nightfall
//
//  Created by Jimmy Lee on 6/17/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "IntroViewController.h"
#import "Utils.h"

@implementation IntroViewController

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)init {
    self = [super init];
    self.introView = [[IntroView alloc] initWithTransitionDelegate:self];
    self.introView.frame = [Utils wrappingFrame:self.view];
    [self.view addSubview:self.introView];
    return self;
}

- (void)switchViewControllers {
    // NOT IMPLEMENTED
    return;
}

@end
