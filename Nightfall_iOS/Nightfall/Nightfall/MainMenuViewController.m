//
//  MainMenuViewController.m
//  Nightfall
//
//  Created by Jimmy Lee on 6/23/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "MainMenuViewController.h"

#import "ForestViewController.h"
#import "InnViewController.h"
#import "MainMenuView.h"
#import "ShopViewController.h"
#import "Utils.h"

@implementation MainMenuViewController {
    MainMenuView *menuView;
    
    InnViewController *innVC;
    ShopViewController *shopVC;
    ForestViewController *forestVC;
}


- (id)init {
    self = [super init];
    menuView = [[MainMenuView alloc] initWithTransitionDelegate:self];
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview: menuView];
    menuView.frame = [Utils wrappingFrame:self.view];
    
    innVC = [InnViewController new];
    shopVC = [ShopViewController new];
    forestVC = [ForestViewController new];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)switchViewControllers:(GameButton *)sender {
    if ([sender.destination isEqualToString:@"INN"]) {
        [self presentViewController:innVC animated:NO completion:nil];
    }
    if ([sender.destination isEqualToString:@"SHOP"]) {
        [self presentViewController:shopVC animated:NO completion:nil];
    }
    if ([sender.destination isEqualToString:@"FOREST"]) {
        [self presentViewController:forestVC animated:NO completion:nil];
    }

    // forest
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
