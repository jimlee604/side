
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
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"<" style:UIBarButtonItemStylePlain
                                                target:self
                                                action:@selector(donePressed:)];
    self.navigationItem.leftBarButtonItem = barButton;
}

- (IBAction)donePressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)switchViewControllers:(GameButton *)sender {
    if ([sender.destination isEqualToString:@"BACK"]) {
        // present mainmenu. (TODO: find a way to reference it so don't have to recreate)
        
//    TODO: GO BACK is broken. make mainmenuVC a UINavigationVC?
//        [self presentViewController:[MainMenuViewController new] animated:NO completion:nil];
        // must set returnVC
//        [self goBack];
    }
}

@end
