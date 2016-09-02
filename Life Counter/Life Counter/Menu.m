//
//  Menu.m
//  Life Counter
//
//  Created by Jimmy Lee on 7/30/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "Menu.h"

@implementation Menu {
    UIButton *diceButton;
    UIButton *rotateButton;
    UIButton *resetButton;
    
    LifeCounterViewController *lcVC;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

const float menuFontSize = 24.0;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self setBackgroundColor:[UIColor greenColor]];
   
    UIColor *menuPurple = [UIColor colorWithRed:0.718 green:0.0 blue:0.957 alpha:1.0];
    
    diceButton = [self menuButtonWithName:@"DICE" Color:[UIColor cyanColor]];
    [self addSubview:diceButton];
    rotateButton = [self menuButtonWithName:@"ROTATE" Color:[UIColor greenColor]];
    [self addSubview:rotateButton];
    resetButton = [self menuButtonWithName:@"RESET" Color:menuPurple];
    [self addSubview:resetButton];
    
    return self;
}

- (UIButton *)menuButtonWithName:(NSString *)name Color:(UIColor *)color {
    UIButton *button = [UIButton new];
    [button setTitle:name forState:UIControlStateNormal];
    [self resizeButton:button toSize:menuFontSize];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundColor:color];
    return button;
}

- (void)layoutSubviews {
    float y = 0.0;
    NSInteger numButtons = 3;
    float dy = self.frame.size.height / numButtons;
    diceButton.frame = CGRectMake(0,y,self.frame.size.width, dy);
    y += dy;
    rotateButton.frame = CGRectMake(0,y,self.frame.size.width, dy);
    y += dy;
    resetButton.frame = CGRectMake(0,y,self.frame.size.width, dy);
}

- (void)attachToVC:(LifeCounterViewController *)LCVC {
    lcVC = LCVC;
}

- (void)assignMenuButtonActionReset:(SEL)reset Roll:(SEL)roll Rotate:(SEL)rotate {
    [diceButton addTarget:lcVC action:roll forControlEvents:UIControlEventTouchUpInside];
    [resetButton addTarget:lcVC action:reset forControlEvents:UIControlEventTouchUpInside];
    [rotateButton addTarget:lcVC action:rotate forControlEvents:UIControlEventTouchUpInside];
}

- (void)resizeButton:(UIButton *)button toSize:(float)fontSize {
    UIFont *font = button.font;
    [button setFont:[font fontWithSize:fontSize]];
}

@end
