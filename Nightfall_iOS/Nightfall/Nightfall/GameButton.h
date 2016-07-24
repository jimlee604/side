//
//  GameButton.h
//  Nightfall
//
//  Created by Jimmy Lee on 6/20/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerProtocols.h"

@protocol TransitioningViewController;

@interface GameButton : UIButton

@property (weak) NSString *destination;

- (id)initWithTitle:(NSString *) title;

- (void)setColorBackground:(UIColor *) background Foreground:(UIColor *)foreground;

- (void)setTransitionToVC:(nullable id<TransitioningViewController>)tvc withSelector:(SEL)selector;

- (void) setWidth:(CGFloat)width;

@end