//
//  MainMenuView.m
//  Nightfall
//
//  Created by Jimmy Lee on 6/23/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "MainMenuView.h"

#import "Data.h"
#import "OpeningViewController.h"
#import "Utils.h"
#import "GameButton.h"
#import "StatView.h"

@implementation MainMenuView {
    
    UILabel *titleLabel;
    UILabel *dummyLabel;
    UILabel *goldLabel;
    
    StatView *statView;
    
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
    NSString *name = [[Data mainCharacter] name];
    NSString *greetingText = [NSString stringWithFormat:@"Welcome, %@!", name];
    [dummyLabel setText:greetingText];
    [dummyLabel setTextColor:[UIColor blackColor]];
    [dummyLabel sizeToFit];
    [self addSubview:dummyLabel];
    
    statView = [[StatView alloc] initForCharacter:[Data mainCharacter]];
    [self addSubview:statView];
    
    goldLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    goldLabel.autoresizingMask = HORIZONTAL_CENTER_MASK;
    // TODO: ld instead of d? why?
    NSString *goldText = [NSString stringWithFormat:@"Your gold: %ld", (long)[[Data mainCharacter] gold]];
    [goldLabel setText:goldText];
    [goldLabel setTextColor:[UIColor blackColor]];
    [goldLabel sizeToFit];
    [self addSubview:goldLabel];

    innButton = [[GameButton alloc] initWithTitle:@"INN"];
    [innButton setDestination:@"INN"];
    [innButton setColorBackground:menuButtonBackgroundColor Foreground:menuButtonTextColor];
    [innButton setTransitionToVC:tvc withSelector:@selector(switchViewControllers:)];
    [self addSubview:innButton]; // TODO change origin/frame

    shopButton = [[GameButton alloc] initWithTitle:@"SHOP"];
    [shopButton setColorBackground:menuButtonBackgroundColor Foreground:menuButtonTextColor];
    [shopButton setDestination:@"SHOP"];
    [shopButton setTransitionToVC:tvc withSelector:@selector(switchViewControllers:)];
    [self addSubview:shopButton]; // TODO change origin/frame
    
    forestButton = [[GameButton alloc] initWithTitle:@"FOREST"];
    [forestButton setColorBackground:menuButtonBackgroundColor Foreground:menuButtonTextColor];
    [forestButton setDestination:@"FOREST"];
    [forestButton setTransitionToVC:tvc withSelector:@selector(switchViewControllers:)];
    [self addSubview:forestButton]; // TODO change origin/frame
    
    return self;
}

- (void)updateCharacterData {
    //TODO: name as well
    NSString *goldText = [NSString stringWithFormat:@"Your gold: %ld", (long)[[Data mainCharacter] gold]];
    [goldLabel setText:goldText];
    [goldLabel sizeToFit];
    [statView updateValues];
}

- (void)layoutSubviews {

    CGFloat dy = 70;
    CGFloat y = 50;
    
    CGFloat buttonWidth = 150;
    
    [innButton setWidth:buttonWidth];
    [shopButton setWidth:buttonWidth];
    [forestButton setWidth:buttonWidth];
    
    [Utils horizontallyCenterView:titleLabel within:self AtY:y];
    y += 50;
    [Utils horizontallyCenterView:dummyLabel within:self AtY:y];
    y += 50;
    [Utils horizontallyCenterView:statView within:self AtY:y];
    y += statView.frame.size.height + 10;
    [Utils horizontallyCenterView:goldLabel within:self AtY:y];
    y += 50;
    [Utils horizontallyCenterView:innButton within:self AtY:y];
    y += dy;
    [Utils horizontallyCenterView:shopButton within:self AtY:y];
    y += dy;
    [Utils horizontallyCenterView:forestButton within:self AtY:y];
}

@end
