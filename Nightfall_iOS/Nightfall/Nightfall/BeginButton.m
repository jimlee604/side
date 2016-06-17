//
//  BeginButton.m
//  Nightfall
//
//  Created by Jimmy Lee on 6/17/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "BeginButton.h"

@implementation BeginButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    NSString *startTitle = @"BEGIN";
    [self setBackgroundColor:[UIColor grayColor]];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitle: startTitle forState:UIControlStateNormal];
    UIEdgeInsets insets = UIEdgeInsetsMake(10, 50, 10, 50);
    [self setContentEdgeInsets:insets];
    [self sizeToFit];
    
    return self;
}

@end
