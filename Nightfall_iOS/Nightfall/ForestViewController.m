//
//  ForestViewController.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "ForestViewController.h"
#import "BackableViewController.h"
#import "ForestView.h"
#import "Utils.h"

@implementation ForestViewController {
    ForestView *forestView;
}

- (id)init {
    self = [super init];
    forestView = [[ForestView alloc] initWithTransitionDelegate:self];
    [self.view addSubview: forestView];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    forestView.frame = [Utils wrappingFrame:self.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)switchViewControllers:(GameButton *)sender {
    if ([sender.destination isEqualToString:@"BACK"]) {
        [self goBack];
    }
}

@end