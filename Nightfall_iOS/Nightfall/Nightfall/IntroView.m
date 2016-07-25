//
//  IntroView.m
//  Nightfall
//
//  Created by Jimmy Lee on 6/17/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "GameButton.h"
#import "IntroView.h"
#import "Utils.h"

@implementation IntroView {
    GameButton *nextButton;
    UILabel *introLabel;
}

- (id)initWithTransitionDelegate:(id<TransitioningViewController>) tvc {
    
    
    self = [super init];
    self.transitionController = tvc;
    [self setBackgroundColor:[UIColor cyanColor]];
    introLabel = [UILabel new];
    self.introText = introLabel;
    self.autoresizesSubviews = YES;
    [self addSubview:introLabel];
    
    nextButton = [[GameButton alloc] initWithTitle:@"NEXT"];
    // TODO: set origin for nextbutton
    nextButton.autoresizingMask = HORIZONTAL_CENTER_MASK;
    [nextButton setColorBackground:[UIColor blackColor] Foreground:[UIColor whiteColor]];
    [nextButton setTransitionToVC:tvc withSelector:@selector(switchViewControllers:)];
    [self addSubview:nextButton];
    
    return self;
}


- (void)layoutSubviews{
    CGFloat widthMargin = 25;
    CGFloat heightMargin = 50;
    CGFloat frameWidth = CGRectGetWidth([Utils wrappingFrame:self]);
    CGFloat frameHeight = CGRectGetHeight([Utils wrappingFrame:self]);

    introLabel.numberOfLines = 2;
    introLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [introLabel setText:@"Insert flavor text here. Label has been set up to center and word wrap."];
    introLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    introLabel.frame = CGRectMake(widthMargin, heightMargin, frameWidth - widthMargin, frameHeight - heightMargin);
    [introLabel sizeToFit];
    
    [nextButton sizeToFit];
    nextButton.center = CGPointMake(self.center.x, 400);

}


@end
