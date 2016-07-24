//
//  MenuOptionViewController.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/3/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "BackableViewController.h"
#import "InnViewController.h"

@implementation BackableViewController
    UIViewController *returnVC;

- (id)initWithPreviousController:(UIViewController <TransitioningViewController>*) prevController {
    InnViewController* innVC = [InnViewController new];
    
    self = [super initWithRootViewController:innVC];
    //    self.returnVC = prevController;
    return self;
}

- (id) init {
    InnViewController* innVC = [InnViewController new];
    self = [super initWithRootViewController:innVC];
    //    self.returnVC = prevController;
    return self;
}


- (void)switchViewControllers:(GameButton *)sender {
    if ([sender.destination isEqualToString:@"BACK"]) {
        // present mainmenu. (TODO: find a way to reference it so don't have to recreate)
        [self goBack];
    }
}

- (void) goBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
