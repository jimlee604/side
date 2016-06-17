//
//  NextButton.m
//  Nightfall
//
//  Created by Jimmy Lee on 6/17/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "NextButton.h"

@implementation NextButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// TODO: Remove this class and just make a normal button to attach switch to?

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    NSString *startTitle = @"NEXT";
    [self setBackgroundColor:[UIColor grayColor]];
    [self setTitle: startTitle forState:UIControlStateNormal];
    [self sizeToFit];
    UIEdgeInsets insets = UIEdgeInsetsMake(10, 50, 10, 50);
    [self setContentEdgeInsets:insets];
    
    return self;
}

@end
