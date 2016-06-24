//
//  MainMenuView.h
//  Nightfall
//
//  Created by Jimmy Lee on 6/23/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerProtocols.h"

@interface MainMenuView : UIView

@property (weak) id <TransitioningViewController> transitionController;
//@property (atomic) UILabel *titleLabel;

//TODO wrap this concept into an interface, or is protocol sufficient?
- (id)initWithTransitionDelegate:(id<TransitioningViewController>) tvc;

@end
