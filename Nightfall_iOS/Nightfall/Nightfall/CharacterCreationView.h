//
//  CharacterCreationView.h
//  Nightfall
//
//  Created by Jimmy Lee on 1/9/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerProtocols.h"

@interface CharacterCreationView : UIView

@property (weak) id <TransitioningViewController> transitionController;

- (id)initWithTransitionDelegate:(id<TransitioningViewController>) tvc;

@end
