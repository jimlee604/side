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
    
    BOOL safeMode;
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
    safeMode = YES;
    resetButton = [UIButton new];
    [resetButton setTitle:@"RESET" forState:UIControlStateNormal];
    [self resizeButton:resetButton toSize:28];
    
    UIColor *menuPurple = [UIColor colorWithRed:0.718 green:0.0 blue:0.957 alpha:1.0];
    [resetButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [resetButton setBackgroundColor:menuPurple];
    [self addSubview:resetButton];
    
    return self;
}

- (void)layoutSubviews {
    resetButton.frame = CGRectMake(0,0,self.frame.size.width, self.frame.size.height);
}

- (void)assignMenuButtonAction:(SEL)reset {
    [resetButton addTarget:nil action:reset forControlEvents:UIControlEventTouchUpInside];
}

- (void)resizeButton:(UIButton *)button toSize:(float)fontSize {
    UIFont *font = button.font;
    [button setFont:[font fontWithSize:fontSize]];
}

@end
