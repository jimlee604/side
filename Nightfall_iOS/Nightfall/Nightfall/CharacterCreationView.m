//
//  CharacterCreationView.m
//  Nightfall
//
//  Created by Jimmy Lee on 1/9/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "CharacterCreationView.h"
#import "Utils.h"

@implementation CharacterCreationView {
    UILabel *titleLabel;
    UILabel *nameLabel;
    UITextField *nameField;
    CGFloat leftMargin;
}

- (id)init {
    self = [super init];
    [self setBackgroundColor:[UIColor blackColor]];
    
    titleLabel = [UILabel new];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setText:@"Character Creation"];
    
    nameLabel = [UILabel new];
    [nameLabel setText:@"Name:"];
    [nameLabel setTextColor:[UIColor whiteColor]];

    nameField = [[UITextField alloc] initWithFrame:CGRectZero];
    [nameField setPlaceholder:@"Name"];
    
    // begin button
   
    [self addSubview:titleLabel];
    [self addSubview:nameLabel];
    [self addSubview:nameField];
    
    return self;
}

- (void)layoutSubviews {
    [titleLabel sizeToFit];
    titleLabel.autoresizingMask = HORIZONTAL_CENTER_MASK;
    titleLabel.center = CGPointMake(self.center.x, 100);
    
    [nameLabel sizeToFit];

    CGFloat nameFieldY = 200;
    leftMargin = 40;
    CGFloat buffer = 20;
    [Utils setOriginX:leftMargin Y:nameFieldY forView:nameLabel];
    leftMargin += nameLabel.frame.size.width + buffer;
    
    [nameField sizeToFit];
    [nameField setBackgroundColor:[UIColor whiteColor]];
    CGFloat width = self.frame.size.width;
    NSLog(@"%f", width);
    width += - leftMargin - buffer - buffer;
    nameField.frame = CGRectMake(leftMargin, 200, width, nameField.frame.size.height);
}

@end
