//
//  TrainViewController.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/28/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "TrainViewController.h"

#import "TrainView.h"
#import "Utils.h"

@implementation TrainViewController {
    TrainView *trainView;
}

- (id)init {
    self = [super init];
    
    trainView = [[TrainView alloc] initWithTransitionDelegate:self];
    [self.view addSubview: trainView];
    trainView.frame = [Utils wrappingFrame:self.view]; // is there a better way?
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end