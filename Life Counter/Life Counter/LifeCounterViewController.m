//
//  ViewController.m
//  Life Counter
//
//  Created by Jimmy Lee on 7/29/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "LifeCounterViewController.h"

#import "LifeCounterView.h"
#import "LifeModifyButton.h"
#import "Lives.h"

@interface LifeCounterViewController ()

@end

@implementation LifeCounterViewController {
    LifeCounterView *lifeCounterView;
    Lives *lives;
    
}

- (id)init {
    self = [super init];
    
    lifeCounterView = [[LifeCounterView alloc] initFromController:self];
    
    [lifeCounterView assignButtonActionsWith:@selector(modifyP1Life:) And:@selector(modifyP2Life:)];
    [lifeCounterView assignMenuButtonActionWith:@selector(resetLives)];
    
    self.view = lifeCounterView;
    lives = [Lives new];
    
    return self;
}

- (void)resetLives {
    [lives resetLives];
    [self updateLives];
}
     
- (void)modifyP1Life:(LifeModifyButton *)sender {
    [lives changeP1by:sender.modVal];
    [self updateLives];
}

- (void)modifyP2Life:(LifeModifyButton *)sender {
    [lives changeP2by:sender.modVal];
    [self updateLives];
}

- (void)updateLives {
    [lifeCounterView displayP1Life:lives.p1Life P2Life:lives.p2Life];
}

- (void)rollDice {
    [lifeCounterView rollDice];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillAppear:(BOOL)animated {
    [lifeCounterView drawBorders];
}

- (void) viewDidAppear:(BOOL)animated {
    [lifeCounterView displayP1Life:lives.p1Life P2Life:lives.p2Life];
}

- (NSUInteger)supportedInterfaceOrientations {
        return UIInterfaceOrientationMaskLandscape;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGRect)wrappingFrame {
    return CGRectMake(0,0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
}

@end
