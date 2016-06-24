//
//  MainMenuView.m
//  Nightfall
//
//  Created by Jimmy Lee on 6/23/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "MainMenuView.h"
#import "Utils.h"
#import "GameButton.h"

@implementation MainMenuView {
    
    UILabel *titleLabel;
    UILabel *dummyLabel;
    GameButton *innButton;
    GameButton *shopButton;
    GameButton *forestButton;
    // inventory
    // equipment
}

// TODO: 4+ buttons/quadrants/rows on screen. for now just add dummy buttons.


- (id)initWithTransitionDelegate:(id<TransitioningViewController>) tvc {
    UIColor *menuButtonBackgroundColor = [UIColor grayColor];
    UIColor *menuButtonTextColor = [UIColor blackColor];
    
    self = [super init];
    self.transitionController = tvc;
    self.autoresizingMask = HORIZONTAL_CENTER_MASK;
    [self setBackgroundColor:[UIColor orangeColor]];
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLabel.autoresizingMask = HORIZONTAL_CENTER_MASK;
    [titleLabel setText:@"MENU"];
    [titleLabel setTextColor:[UIColor blackColor]];
    [titleLabel sizeToFit];
    [self addSubview:titleLabel];
    
    dummyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    dummyLabel.autoresizingMask = HORIZONTAL_CENTER_MASK;
    [dummyLabel setText:@"Add image or info here"];
    [dummyLabel setTextColor:[UIColor blackColor]];
    [dummyLabel sizeToFit];
    [self addSubview:dummyLabel];

    innButton = [[GameButton alloc] initWithTitle:@"INN"];
    [innButton setColorBackground:menuButtonBackgroundColor Foreground:menuButtonTextColor];
    //[innButton setTransitionToVC:tvc withSelector:@selector(switchViewControllers)];
    [self addSubview:innButton]; // TODO change origin/frame

    shopButton = [[GameButton alloc] initWithTitle:@"SHOP"];
    [shopButton setColorBackground:menuButtonBackgroundColor Foreground:menuButtonTextColor];
    //[shopButton setTransitionToVC:tvc withSelector:@selector(switchViewControllers)];
    [self addSubview:shopButton]; // TODO change origin/frame
    
    forestButton = [[GameButton alloc] initWithTitle:@"FOREST"];
    [forestButton setColorBackground:menuButtonBackgroundColor Foreground:menuButtonTextColor];
    //[forestButton setTransitionToVC:tvc withSelector:@selector(switchViewControllers)];
    [self addSubview:forestButton]; // TODO change origin/frame
    
    return self;
}

- (void) layoutSubviews {
    CGFloat dy = 70;
    CGFloat y = 400;
    
    CGFloat buttonWidth = 150;
    
    [innButton setWidth:buttonWidth];
    [shopButton setWidth:buttonWidth];
    [forestButton setWidth:buttonWidth];
    
    titleLabel.center = CGPointMake(self.center.x, 100);
    dummyLabel.center = CGPointMake(self.center.x, 200);
    
    innButton.center = CGPointMake(self.center.x, y);
    y += dy;
    shopButton.center = CGPointMake(self.center.x, y);
    y += dy;
    forestButton.center = CGPointMake(self.center.x, y);
    
    
}

@end
