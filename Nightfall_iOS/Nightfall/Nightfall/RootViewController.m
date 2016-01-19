//
//  RootNavigationViewController.m
//  Nightfall
//
//  Created by Jimmy Lee on 1/9/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "RootViewController.h"
#import "OpeningViewController.h"
#import "CharacterCreationViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)init {
    self = [super init];
    [self.view setBackgroundColor:[UIColor whiteColor]];
//    [self presentModalViewController:openingVC animated:NO];
//    [self pushViewController:openingVC animated:NO];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    OpeningViewController *openingVC = [OpeningViewController new];
    [self presentViewController:openingVC animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)switchToCharacterCreation {
    // should actually be called from a navigationcontroller
    CharacterCreationViewController *charVC = [CharacterCreationViewController new];
    [self presentViewController:charVC animated:NO completion:nil];
    
    // TODO: make openingVC a nav-view-controller
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
