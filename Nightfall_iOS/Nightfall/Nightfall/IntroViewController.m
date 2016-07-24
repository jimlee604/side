//
//  IntroViewController.m
//  Nightfall
//
//  Created by Jimmy Lee on 6/17/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "IntroViewController.h"
#import "MainMenuViewController.h"
#import "Utils.h"

@implementation IntroViewController {
    IntroView *introView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)init {
    self = [super init];
    introView = [[IntroView alloc] initWithTransitionDelegate:self];
    introView.frame = [Utils wrappingFrame:self.view];
    [self.view addSubview:introView];
    return self;
}

- (void)switchViewControllers:(GameButton *)sender {
    // NOT IMPLEMENTED
    // TODO: Maybe these should be ivars
    MainMenuViewController *menuVC = [MainMenuViewController new];
    [self presentViewController:menuVC animated:NO completion:nil];
    
    return;
}

@end
