//
//  MainMenuOptionView.h
//  Nightfall
//
//  Created by Jimmy Lee on 7/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerProtocols.h"

@interface MainMenuOptionView : UIView<TransitionedView>

@property (weak) id <TransitioningViewController> transitionController;

- (id)initWithTransitionDelegate:(id<TransitioningViewController>)tvc Title:(NSString*)title;

@end
