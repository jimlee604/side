//
//  StartButton.m
//  Nightfall
//
//  Created by Jimmy Lee on 1/8/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "StartButton.h"

@implementation StartButton

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
    
    NSString *startTitle = @"START";
    [self setBackgroundColor:[UIColor blueColor]];
    [self setTitle: startTitle forState:UIControlStateNormal];
    [self sizeToFit];
    UIEdgeInsets insets = UIEdgeInsetsMake(10, 50, 10, 50);
    [self setContentEdgeInsets:insets];
    
    return self;
}



@end
