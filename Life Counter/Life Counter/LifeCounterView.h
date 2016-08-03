//
//  LifeCounterView.h
//  Life Counter
//
//  Created by Jimmy Lee on 7/29/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LifeCounterViewController.h"

@interface LifeCounterView : UIView

- (void)drawBorders;
- (void)displayP1Life:(NSInteger)p1Life P2Life:(NSInteger)p2Life;

- (id)initFromController:(LifeCounterViewController *)vc;

- (void)assignButtonActionsWith:(SEL)modP1 And:(SEL)modP2;
- (void)assignMenuButtonActionWithRoll:(SEL)roll Reset:(SEL)reset;

- (void)rollDice;
    
- (void)centerLifeValues;


@end
