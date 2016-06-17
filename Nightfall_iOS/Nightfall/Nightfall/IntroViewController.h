//
//  IntroViewController.h
//  Nightfall
//
//  Created by Jimmy Lee on 6/17/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerProtocols.h"
#import "IntroView.h"

@interface IntroViewController : UIViewController <TransitioningViewController>

@property (nonatomic) IntroView *introView;



@end
