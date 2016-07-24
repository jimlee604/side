//
//  MainMenuViewController.m
//  Nightfall
//
//  Created by Jimmy Lee on 6/23/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "MainMenuViewController.h"
#import "MainMenuView.h"
#import "InnViewController.h"
#import "BackableViewController.h"
#import "Utils.h"

@implementation MainMenuViewController {
    MainMenuView *menuView;
    
    InnViewController *innVC;
}


- (id)init {
    self = [super init];
    menuView = [[MainMenuView alloc] initWithTransitionDelegate:self];
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview: menuView];
    menuView.frame = [Utils wrappingFrame:self.view];
    
    
    innVC = [InnViewController new];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)switchViewControllers:(GameButton *)sender {
    if ([sender.destination isEqualToString:@"INN"]) {
        [self presentViewController:innVC animated:NO completion:nil];
    }
    // shop, forest
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
