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
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donePressed:)] ;
}

- (void)switchViewControllers {
    
    // TRICKY: Need to take arguments depending on which button is being pressed. then switch case or something
    
    
    //CharacterCreationViewController *charVC = [CharacterCreationViewController new];
    //[self presentViewController:charVC animated:NO completion:nil];
}

- (void)switchViewControllers:(GameButton *)sender {
    if ([sender.destination isEqualToString:@"INN"]) {
        // TODO: cache each menu's controller as vars?
        
        BackableViewController *back = [BackableViewController new];
        
//        InnViewController *innVC = [InnViewController new];
//        [innVC setReturnVC:self];
        [self presentViewController:back animated:YES completion:nil];
//        [self.navigationController presentViewController:innVC animated:NO completion:nil];
        
//        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed:)]autorelease];
//        [self.navigationController pushViewController:innVC animated:NO];
    }
}

- (IBAction)donePressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
