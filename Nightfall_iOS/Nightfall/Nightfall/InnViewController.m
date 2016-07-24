
//  InnViewController.m
//  Nightfall
//
//  Created by Jimmy Lee on 6/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "InnViewController.h"
#import "Innview.h"
#import "MainMenuViewController.h"
#import "Utils.h"

@implementation InnViewController {
    InnView *innView;
}

- (id)init {
    self = [super init];
    innView = [[InnView alloc] initWithTransitionDelegate:self];
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview: innView];
    innView.frame = [Utils wrappingFrame:self.view];
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)donePressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)switchViewControllers:(GameButton *)sender {
    if ([sender.destination isEqualToString:@"BACK"]) {
        [self goBack];
    }
}

@end
