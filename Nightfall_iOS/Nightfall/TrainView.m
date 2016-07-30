//
//  TrainView.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/28/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "TrainView.h"

@implementation TrainView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithTransitionDelegate:(id<TransitioningViewController>)tvc {
    self = [super initWithTransitionDelegate:tvc Title:@"INN"];
    [self setBackgroundColor:[UIColor whiteColor]];
    return self;
}

@end
