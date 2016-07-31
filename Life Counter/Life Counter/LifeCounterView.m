//
//  LifeCounterView.m
//  Life Counter
//
//  Created by Jimmy Lee on 7/29/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "LifeCounterView.h"

#import "LifeCounterViewController.h"
#import "LifeModifyButton.h"
#import "Menu.h"

UIViewAutoresizing const HORIZONTAL_CENTER_MASK = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;

@implementation LifeCounterView {
    LifeCounterViewController *controller;
    
    UILabel *titleLabel;
    
    UILabel *p1LifeLabel;
    UILabel *p2LifeLabel;
    
    LifeModifyButton *p1UpButton;
    LifeModifyButton *p2UpButton;
    LifeModifyButton *p1DownButton;
    LifeModifyButton *p2DownButton;
    
    Menu *menu;
}

const float topLineHeight = 50.0;
const float centerBuffer = 50.0;

- (id)initFromController:(LifeCounterViewController *)vc {
    controller = vc;
    
    self = [super init];
    [self setBackgroundColor: [UIColor blackColor]];
    titleLabel = [UILabel new];
    
    [titleLabel setText:@"   Magic      Life      Counter"];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [self resizeLabel:titleLabel toSize:35.0];
    [titleLabel sizeToFit];
    [self addSubview:titleLabel];
    
    
    p1LifeLabel = [UILabel new];
    [self addSubview:p1LifeLabel];
    p2LifeLabel = [UILabel new];
    [self addSubview:p2LifeLabel];
    
    [p1LifeLabel setTextColor:[UIColor blueColor]];
    [p2LifeLabel setTextColor:[UIColor redColor]];
    
    float lifeTextSize = 150.0;
    [self resizeLabel:p1LifeLabel toSize:lifeTextSize];
    [self resizeLabel:p2LifeLabel toSize:lifeTextSize];
    
    p1UpButton = [[LifeModifyButton alloc] initWithModValue:1];
    [self addSubview:p1UpButton];
    
    p1DownButton = [[LifeModifyButton alloc] initWithModValue:-1];
    [self addSubview:p1DownButton];
    
    p2UpButton = [[LifeModifyButton alloc] initWithModValue:1];
    [self addSubview:p2UpButton];
    
    p2DownButton = [[LifeModifyButton alloc] initWithModValue:-1 ];
    [self addSubview:p2DownButton];
    
    menu = [[Menu alloc] initWithFrame:CGRectZero];
    [self addSubview:menu];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    titleLabel.center = CGPointMake(self.center.x, 25);
    
    float frameWidth = self.center.x - centerBuffer;
    float frameHeight = (self.frame.size.height - topLineHeight) / 2.0;
    
    p1UpButton.frame = CGRectMake(-1, topLineHeight, frameWidth + 1, frameHeight);
    p1DownButton.frame = CGRectMake(-1, topLineHeight + frameHeight, frameWidth + 1, frameHeight + 1);
    
    float p2LifeX = self.center.x + centerBuffer;
    
    p2UpButton.frame = CGRectMake(p2LifeX, topLineHeight, frameWidth, frameHeight);
    p2DownButton.frame = CGRectMake(p2LifeX, topLineHeight + frameHeight, frameWidth, frameHeight + 1);
    
    CGRect menuFrame = CGRectMake(self.center.x - centerBuffer, topLineHeight, centerBuffer * 2.0, self.frame.size.height -topLineHeight);
    menu.frame = menuFrame;
    [menu layoutSubviews];
    
//    [self bringSubviewToFront:p1LifeLabel];
//    [self bringSubviewToFront:p2LifeLabel];
}

- (void)displayP1Life:(NSInteger)p1Life P2Life:(NSInteger)p2Life {
    [p1LifeLabel setText:[NSString stringWithFormat:@"%ld", p1Life]];
    [p2LifeLabel setText:[NSString stringWithFormat:@"%ld", p2Life]];
    [p1LifeLabel sizeToFit];
    [p2LifeLabel sizeToFit];
    
    [self centerLifeValues];
}

- (void)centerLifeValues {
    float p1CenterX = (self.center.x - centerBuffer) / 2.0;
    float p2CenterX = self.frame.size.width - p1CenterX;
    float centerY = ((self.frame.size.height - topLineHeight) / 2.0) + topLineHeight;
    p1LifeLabel.center = CGPointMake(p1CenterX, centerY);
    p2LifeLabel.center = CGPointMake(p2CenterX, centerY);
}

- (void)rollDice {
    NSInteger roll1 = 1 + arc4random_uniform(6);
    NSInteger roll2 = 1 + arc4random_uniform(6);
    
    if (roll1 > roll2) {
        [p1LifeLabel setText:[NSString stringWithFormat:@"%ld*", roll1]];
    } else {
        [p1LifeLabel setText:[NSString stringWithFormat:@"%ld", roll1]];
    }
    if (roll2 > roll1) {
        [p2LifeLabel setText:[NSString stringWithFormat:@"%ld*", roll2]];
    } else {
        [p2LifeLabel setText:[NSString stringWithFormat:@"%ld", roll2]];
    }
    [p1LifeLabel sizeToFit];
    [p2LifeLabel sizeToFit];
    [self centerLifeValues];
}

// borders logic. move to another class if it won't cause problems.

- (void)drawBorders {
    
    
    float leftLineX = self.center.y - centerBuffer;
    float rightLineX = self.center.y + centerBuffer;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0.0, topLineHeight)];
    [path addLineToPoint:CGPointMake(self.frame.size.height, topLineHeight)];
    
    [path moveToPoint:CGPointMake(leftLineX, topLineHeight)];
    [path addLineToPoint:CGPointMake(leftLineX, self.frame.size.width)];
    
    [path moveToPoint:CGPointMake(rightLineX, topLineHeight)];
    [path addLineToPoint:CGPointMake(rightLineX, self.frame.size.width)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor grayColor] CGColor];
    shapeLayer.lineWidth = 2.0;
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    
    [self.layer addSublayer:shapeLayer];
}

- (void)resizeLabel:(UILabel *)label toSize:(float)fontSize {
    UIFont *font = label.font;
    [label setFont:[font fontWithSize:fontSize]];
}

- (void)assignButtonActionsWith:(SEL)modP1 And:(SEL)modP2 {
    [p1UpButton addTarget:controller action:modP1 forControlEvents:UIControlEventTouchUpInside];
    [p1DownButton addTarget:controller action:modP1 forControlEvents:UIControlEventTouchUpInside];
    [p2UpButton addTarget:controller action:modP2 forControlEvents:UIControlEventTouchUpInside];
    [p2DownButton addTarget:controller action:modP2 forControlEvents:UIControlEventTouchUpInside];
}

- (void)assignMenuButtonActionWith:(SEL)reset {
    [menu assignMenuButtonAction:reset And:@selector(rollDice)];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
