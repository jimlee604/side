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

@interface LifeCounterViewController () {
    BOOL diceDisplayed;
    NSTimer *timeTimer;
    NSTimer *diceTimer;
    NSDateFormatter *formatter;
}

@end

@implementation LifeCounterViewController {
    LifeCounterView *lifeCounterView;
    Lives *lives;
}

- (id)init {
    self = [super init];
    
    diceDisplayed = NO;
    
    lifeCounterView = [[LifeCounterView alloc] initFromController:self];
    
    [lifeCounterView assignButtonActionsWith:@selector(modifyP1Life:) And:@selector(modifyP2Life:)];
    [lifeCounterView assignMenuButtonActionWithRoll:@selector(rollDice) Reset:@selector(resetLives)];
    
    self.view = lifeCounterView;
    lives = [Lives new];
    
    
    formatter = [[NSDateFormatter alloc]init];
    
    [self updateTime];
    
    timeTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    
    return self;
}

- (void)resetLives {
    if (diceDisplayed) {
        diceDisplayed = NO;
    } else {
        [lives resetLives];
    }
    [self updateLives];
}
     
- (void)modifyP1Life:(LifeModifyButton *)sender {
    if (diceDisplayed) {
        diceDisplayed = NO;
    } else {
        [lives changeP1by:sender.modVal];
    }
    [self updateLives];
}

- (void)modifyP2Life:(LifeModifyButton *)sender {
    if (diceDisplayed) {
        diceDisplayed = NO;
    } else {
        [lives changeP2by:sender.modVal];
    };
    [self updateLives];
}

- (void)updateLives {
    [lifeCounterView displayP1Life:lives.p1Life P2Life:lives.p2Life];
    diceDisplayed = NO;
}

- (void)rollDice {
    
    // start a timer for 5s
    [lifeCounterView rollDice];
    diceDisplayed = YES;
    
    if (diceTimer != nil) {
        [diceTimer invalidate];
    }
    diceTimer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(updateLives)
                                                  userInfo:nil repeats:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}



- (void)updateTime {
    NSDate *date = [NSDate date];
    formatter.dateFormat = @"h:mm a";
    [lifeCounterView updateTime:[formatter stringFromDate:date]];
    
//    [formatter1 release];
}

- (void) viewWillAppear:(BOOL)animated {
    [lifeCounterView drawBorders];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
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
