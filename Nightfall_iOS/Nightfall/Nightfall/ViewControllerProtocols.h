//
//  ViewControllerProtocols.h
//  Nightfall
//
//  Created by Jimmy Lee on 1/17/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// TODO: may not be used if we make a transitioning viewcontroller class - if that's necessary at all.
@interface ViewControllerProtocols : NSObject

@end

@protocol TransitioningViewController

- (void)switchViewControllers;

// setviewcontroller

@end

