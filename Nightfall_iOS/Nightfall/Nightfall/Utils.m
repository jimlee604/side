//
//  Utils.m
//  Nightfall
//
//  Created by Jimmy Lee on 1/11/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "Utils.h"

@implementation Utils

UIViewAutoresizing const HORIZONTAL_CENTER_MASK = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;

+ (CGRect)wrappingFrame:(UIView *) view {
    return CGRectMake(0,0, CGRectGetWidth(view.bounds), CGRectGetHeight(view.bounds));
}

+ (void)setOriginX:(CGFloat)x Y:(CGFloat)y forView:(UIView *)view {
    CGRect frame = view.frame;
    frame.origin.x = x;
    frame.origin.y = y;
    view.frame = frame;
}

+ (void)horizontallyCenterView:(UIView *)subview within:(UIView *)view AtY:(CGFloat)y {
    CGFloat centerX = view.center.x;
    subview.center = CGPointMake(centerX, 0);
    [Utils setOriginX:subview.frame.origin.x Y:y forView:subview];
}

@end
