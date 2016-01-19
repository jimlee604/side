//
//  Utils.h
//  Nightfall
//
//  Created by Jimmy Lee on 1/11/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utils : NSObject

extern UIViewAutoresizing const HORIZONTAL_CENTER_MASK;

+ (CGRect)wrappingFrame:(UIView *) view;
+ (void)setOriginX:(CGFloat)x Y:(CGFloat)y forView:(UIView *)view;

@end

