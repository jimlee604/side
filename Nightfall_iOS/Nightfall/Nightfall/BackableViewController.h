//
//  MenuOptionViewController.h
//  Nightfall
//
//  Created by Jimmy Lee on 7/3/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerProtocols.h"

//@interface BackableViewController : UIViewController<TransitioningViewController>
@interface BackableViewController : UINavigationController<TransitioningViewController>

@property (retain) UIViewController *returnVC;


- (id)initWithPreviousController:(UIViewController <TransitioningViewController>*) prevController;

- (void)setReturnVC:(UIViewController*) ret;

- (void)goBack;

@end
