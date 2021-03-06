//
//  InnView.h
//  Nightfall
//
//  Created by Jimmy Lee on 6/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuOptionView.h"
#import "ViewControllerProtocols.h"

@interface InnView : MainMenuOptionView<TransitionedView>

// proper access level?
@property (weak) id <TransitioningViewController> transitionController;

@end
