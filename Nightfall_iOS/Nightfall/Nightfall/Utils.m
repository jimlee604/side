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

@end
