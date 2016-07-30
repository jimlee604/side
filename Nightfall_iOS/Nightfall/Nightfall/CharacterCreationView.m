//
//  CharacterCreationView.m
//  Nightfall
//
//  Created by Jimmy Lee on 1/9/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "CharacterCreationView.h"

#import "Data.h"
#import "Utils.h"
#import "GameButton.h"

@implementation CharacterCreationView {
    UILabel *titleLabel;
    UILabel *nameLabel;
    UITextField *nameField;
    GameButton *beginButton;
    
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
    nameField.delegate = tvc;
    
    [nameField addTarget:self
                  action:@selector(nameEdited:)
        forControlEvents:UIControlEventEditingDidEnd];
    
    beginButton = [[GameButton alloc] initWithTitle:@"BEGIN"];
    beginButton.autoresizingMask = HORIZONTAL_CENTER_MASK;
    [beginButton setColorBackground:[UIColor grayColor] Foreground:[UIColor blackColor]];
    [beginButton setTransitionToVC:tvc withSelector:@selector(switchViewControllers:)];
    [self addSubview:beginButton];
    
    return self;
}

// Only gets called when begin button is pressed.
- (void) nameEdited:(UITextField *)sender {
    NSString *name = sender.text;
    if ([name length] > 0) {
        [[Data mainCharacter] setName:sender.text];
    }
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
