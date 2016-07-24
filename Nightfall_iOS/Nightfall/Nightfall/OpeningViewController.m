//
//  OpeningViewController.m
//  Nightfall
//
//  Created by Jimmy Lee on 1/5/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "CharacterCreationViewController.h"
#import "GameButton.h"
#import "OpeningViewController.h"
#import "OpeningView.h"
#import "Utils.h"

@interface OpeningViewController () {
    OpeningView *openingView;
}

@end

@implementation OpeningViewController

- (id)init {
    self = [super init];
    openingView = [[OpeningView alloc] initWithTransitionDelegate:self];
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview: openingView];
    openingView.frame = [Utils wrappingFrame:self.view];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)switchViewControllers {
    CharacterCreationViewController *charVC = [CharacterCreationViewController new];
    [self presentViewController:charVC animated:NO completion:nil];
}

- (void)switchViewControllers:(GameButton *)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
