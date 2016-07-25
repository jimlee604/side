//
//  ShopView.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "ShopView.h"

@implementation ShopView

- (id)initWithTransitionDelegate:(id<TransitioningViewController>) tvc {
    self = [super initWithTransitionDelegate:tvc Title:@"SHOP"];
    [self setBackgroundColor:[UIColor purpleColor]];
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
}

@end
