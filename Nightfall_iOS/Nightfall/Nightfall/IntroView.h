//
//  IntroView.h
//  Nightfall
//
//  Created by Jimmy Lee on 6/17/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerProtocols.h"

@interface IntroView : UIView

@property (weak) id <TransitioningViewController> transitionController;

@property (nonatomic) UILabel *introText;

- (id)initWithTransitionDelegate:(id<TransitioningViewController>) tvc;

@end
