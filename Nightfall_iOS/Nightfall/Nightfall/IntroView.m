//
//  IntroView.m
//  Nightfall
//
//  Created by Jimmy Lee on 6/17/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "IntroView.h"
#import "Utils.h"

@implementation IntroView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithTransitionDelegate:(id<TransitioningViewController>) tvc {
    
    
    self = [super init];
    self.transitionController = tvc;
//    self.autoresizingMask = HORIZONTAL_CENTER_MASK;
    [self setBackgroundColor:[UIColor cyanColor]];
    UILabel *introLabel = [UILabel new];
    self.introText = introLabel;
    self.autoresizesSubviews = YES;
    [self addSubview:introLabel];
    
//    titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//    [titleLabel setText:@"Nightfall"];
//    [titleLabel setTextColor:[UIColor whiteColor]];
//    titleLabel.autoresizingMask = HORIZONTAL_CENTER_MASK;
//    [self addSubview:titleLabel];
//    
//    startButton = [[StartButton alloc] initWithFrame:CGRectZero];
//    startButton.autoresizingMask = HORIZONTAL_CENTER_MASK;
//    [startButton addTarget:tvc action:@selector(switchViewControllers) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:startButton];
    
    return self;
}


- (void)layoutSubviews{
    CGFloat widthMargin = 25;
    CGFloat heightMargin = 50;
    CGFloat frameWidth = CGRectGetWidth([Utils wrappingFrame:self]);
    CGFloat frameHeight = CGRectGetHeight([Utils wrappingFrame:self]);

    UILabel *introLabel = self.introText;
    introLabel.numberOfLines = 2;
    introLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [introLabel setText:@"Insert flavor text here. Label has been set up to center and word wrap."];
    introLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    introLabel.frame = CGRectMake(widthMargin, heightMargin, frameWidth - widthMargin, frameHeight - heightMargin);
    [introLabel sizeToFit];


}


@end
