//
//  Menu.m
//  Life Counter
//
//  Created by Jimmy Lee on 7/30/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "Menu.h"

@implementation Menu {
    UIButton *resetButton;
    UIButton *diceButton;
    
    LifeCounterViewController *lcVC;
    
//    BOOL safeMode;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self setBackgroundColor:[UIColor greenColor]];
//    safeMode = YES;
    
    UIColor *menuPurple = [UIColor colorWithRed:0.718 green:0.0 blue:0.957 alpha:1.0];
    float menuFontSize = 28.0;
    
    
    diceButton = [UIButton new];
    [diceButton setTitle:@"DICE" forState:UIControlStateNormal];
    [self resizeButton:diceButton toSize:menuFontSize];
    [diceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [diceButton setBackgroundColor:[UIColor cyanColor]];
    [self addSubview:diceButton];
    
    resetButton = [UIButton new];
    [resetButton setTitle:@"RESET" forState:UIControlStateNormal];
    [self resizeButton:resetButton toSize:menuFontSize];
    [resetButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [resetButton setBackgroundColor:menuPurple];
    [self addSubview:resetButton];
    
    return self;
}

- (void)layoutSubviews {
    float y = 0.0;
    NSInteger numButtons = 2;
    float dy = self.frame.size.height / numButtons;
    diceButton.frame = CGRectMake(0,y,self.frame.size.width, dy);
    y += dy;
    resetButton.frame = CGRectMake(0,y,self.frame.size.width, dy);
}

- (void)attachToVC:(LifeCounterViewController *)LCVC {
    lcVC = LCVC;
}

- (void)assignMenuButtonAction:(SEL)reset And:(SEL)roll {
    [diceButton addTarget:lcVC action:roll forControlEvents:UIControlEventTouchUpInside];
    [resetButton addTarget:lcVC action:reset forControlEvents:UIControlEventTouchUpInside];
}

- (void)resizeButton:(UIButton *)button toSize:(float)fontSize {
    UIFont *font = button.font;
    [button setFont:[font fontWithSize:fontSize]];
}

@end
