//
//  Menu.h
//  Life Counter
//
//  Created by Jimmy Lee on 7/30/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LifeCounterViewController.h"

@interface Menu : UIView

- (void)assignMenuButtonActionReset:(SEL)reset Roll:(SEL)roll Rotate:(SEL)rotate;
- (void)attachToVC:(LifeCounterViewController *)LCVC;

@end
