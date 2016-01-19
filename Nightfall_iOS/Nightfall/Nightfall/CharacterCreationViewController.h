//
//  CharacterCreationViewController.h
//  Nightfall
//
//  Created by Jimmy Lee on 1/9/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CharacterCreationView.h"
#import "ViewControllerProtocols.h"

@interface CharacterCreationViewController : UIViewController <TransitioningViewController>

@property (nonatomic) CharacterCreationView *charCreationView;

@end
