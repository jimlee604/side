//
//  ShopViewController.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "ShopViewController.h"
#import "Utils.h"
#import "ShopView.h"

@implementation ShopViewController {
    ShopView *shopView;
}

- (id)init {
    self = [super init];
    shopView = [[ShopView alloc] initWithTransitionDelegate:self];
    //[self.view setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview: shopView];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    shopView.frame = [Utils wrappingFrame:self.view];
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
