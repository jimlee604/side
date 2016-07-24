//
//  GameButton.m
//  Nightfall
//
//  Created by Jimmy Lee on 6/20/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "GameButton.h"

@implementation GameButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithTitle:(NSString *) title {
    self = [super initWithFrame:CGRectZero];
    
    [self setBackgroundColor:[UIColor grayColor]];
    [self setTitle: title forState:UIControlStateNormal];
    UIEdgeInsets insets = UIEdgeInsetsMake(10, 10, 10, 10);
    [self setContentEdgeInsets:insets];
    [self sizeToFit];
    
    return self;
}

- (void) setColorBackground:(UIColor *) background Foreground:(UIColor *)foreground {
    [self setBackgroundColor:background];
    [self setTitleColor:foreground forState:UIControlStateNormal];
}

- (void) setTransitionToVC:(nullable id<TransitioningViewController>)tvc withSelector:(SEL)selector{
    [self addTarget:tvc action:selector forControlEvents:UIControlEventTouchUpInside];
}

- (void) setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    CGFloat height = frame.size.height;
    frame.size = CGSizeMake(width, height);
    self.frame = frame;
}

- (void) setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    CGFloat width = frame.size.width;
    frame.size = CGSizeMake(width, height);
    self.frame = frame;
}

@end
