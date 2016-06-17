
//  OpeningView.h
//  Nightfall
//
//  Created by Jimmy Lee on 1/6/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ViewControllerProtocols.h"

@interface OpeningView : UIView

@property (weak) id <TransitioningViewController> transitionController;

//TODO wrap this concept into an interface, or is protocol sufficient?
- (id)initWithTransitionDelegate:(id<TransitioningViewController>) tvc;

@end