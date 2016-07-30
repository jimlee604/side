//
//  CharacterCreationViewController.m
//  Nightfall
//
//  Created by Jimmy Lee on 1/9/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "CharacterCreationViewController.h"

#import "CharacterCreationView.h"
#import "Data.h"
#import "IntroViewController.h"
#import "Utils.h"

@interface CharacterCreationViewController ()

@end

@implementation CharacterCreationViewController

- (id)init {
    self = [super init];
    
    [Data initializeCharacter];
    
    self.charCreationView = [[CharacterCreationView alloc] initWithTransitionDelegate:self];
    self.charCreationView.frame = [Utils wrappingFrame:self.view];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(endEditing)];
    
    [self.charCreationView addGestureRecognizer:tap];
    
    
    [self.view addSubview:self.charCreationView];
    return self;
}

-(void)endEditting {
    [self.charCreationView endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)switchViewControllers:(GameButton *) sender {
    IntroViewController *introVC = [IntroViewController new];
    [self presentViewController:introVC animated:NO completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
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
