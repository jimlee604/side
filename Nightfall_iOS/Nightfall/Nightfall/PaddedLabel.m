//
//  BorderedLabel.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/27/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "PaddedLabel.h"

@implementation PaddedLabel

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = {0, 5, 0, 5};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
