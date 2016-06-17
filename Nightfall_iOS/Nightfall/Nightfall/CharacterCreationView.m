//
//  CharacterCreationView.m
//  Nightfall
//
//  Created by Jimmy Lee on 1/9/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "CharacterCreationView.h"
#import "Utils.h"
#import "BeginButton.h"

@implementation CharacterCreationView {
    UILabel *titleLabel;
    UILabel *nameLabel;
    UITextField *nameField;
    BeginButton *beginButton;
    
}

- (id)initWithTransitionDelegate:(id<TransitioningViewController>) tvc {
    self = [super init];
    [self setBackgroundColor:[UIColor blackColor]];
    
    titleLabel = [UILabel new];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setText:@"Character Creation"];
    [self addSubview:titleLabel];
    
    nameLabel = [UILabel new];
    [nameLabel setText:@"Name:"];
    [nameLabel setTextColor:[UIColor whiteColor]];
    [self addSubview:nameLabel];
    
    nameField = [[UITextField alloc] initWithFrame:CGRectZero];
    [nameField setPlaceholder:@"Name"];
    [self addSubview:nameField];
    
    // begin button
//    beginButton = [UIButton new];
//    [beginButton setTitle:@"Begin" forState:UIControlStateNormal];
//    [beginButton setBackgroundColor:[UIColor grayColor]];
//    beginButton.autoresizingMask = HORIZONTAL_CENTER_MASK;
//    UIEdgeInsets insets = UIEdgeInsetsMake(10, 50, 10, 50);
//    [beginButton setContentEdgeInsets:insets];
//    [beginButton sizeToFit];
//    [self addSubview:beginButton];
    
    beginButton = [[BeginButton alloc] initWithFrame:CGRectZero];
    beginButton.autoresizingMask = HORIZONTAL_CENTER_MASK;
    [beginButton addTarget:tvc action:@selector(switchViewControllers) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:beginButton];
    
    return self;
}

- (void)layoutSubviews {
    [titleLabel sizeToFit];
    titleLabel.autoresizingMask = HORIZONTAL_CENTER_MASK;
    titleLabel.center = CGPointMake(self.center.x, 100);
    
    [nameLabel sizeToFit];

    CGFloat nameFieldY = 200;
    CGFloat leftMargin = 40;
    CGFloat buffer = 20;
    [Utils setOriginX:leftMargin Y:nameFieldY forView:nameLabel];
    leftMargin += nameLabel.frame.size.width + buffer;
    
    [nameField sizeToFit];
    [nameField setBackgroundColor:[UIColor whiteColor]];
    CGFloat width = self.frame.size.width;
    width += - leftMargin - buffer - buffer;
    nameField.frame = CGRectMake(leftMargin, 200, width, nameField.frame.size.height);

    CGRect frame = beginButton.frame;
    frame.origin.y = 500;
    beginButton.frame = frame;
    
    
}

@end
