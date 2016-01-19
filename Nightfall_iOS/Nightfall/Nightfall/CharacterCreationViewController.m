//
//  CharacterCreationViewController.m
//  Nightfall
//
//  Created by Jimmy Lee on 1/9/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "CharacterCreationViewController.h"
#import "CharacterCreationView.h"
#import "Utils.h"

@interface CharacterCreationViewController ()

@end

@implementation CharacterCreationViewController

- (id)init {
    self = [super init];
    self.charCreationView = [CharacterCreationView new];
    self.charCreationView.frame = [Utils wrappingFrame:self.view];
    [self.view addSubview:self.charCreationView];
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

- (void)switchViewControllers {
    NSLog(@"Need to make a new controller to switch to.");
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
