//
//  TrainView.h
//  Nightfall
//
//  Created by Jimmy Lee on 7/28/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerProtocols.h"
#import "MainMenuOptionView.h"

// TODO: not mainmenuoptionview??
@interface TrainView : MainMenuOptionView<TransitionedView>

-(id)initWithTransitionDelegate:(id<TransitioningViewController>)tvc;



@end
