//
//  MainMenuViewController.m
//  Nightfall
//
//  Created by Jimmy Lee on 6/23/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "MainMenuViewController.h"
#import "MainMenuView.h"
#import "Utils.h"

@implementation MainMenuViewController {
    MainMenuView *menuView;
}


- (id)init {
    self = [super init];
    menuView = [[MainMenuView alloc] initWithTransitionDelegate:self];
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview: menuView];
    menuView.frame = [Utils wrappingFrame:self.view];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)switchViewControllers {
    
    // TRICKY: Need to take arguments depending on which button is being pressed. then switch case or something
    
    
    //CharacterCreationViewController *charVC = [CharacterCreationViewController new];
    //[self presentViewController:charVC animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
