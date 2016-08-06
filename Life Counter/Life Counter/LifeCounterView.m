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
    
    UILabel *timeLabel;
    
    UILabel *titleLabel;
    
    UILabel *p1LifeLabel;
    UILabel *p2LifeLabel;
    
    LifeModifyButton *p1UpButton;
    LifeModifyButton *p2UpButton;
    LifeModifyButton *p1DownButton;
    LifeModifyButton *p2DownButton;
    
    UIImageView *p1Dice;
    UIImageView *p2Dice;
    
    Menu *menu;
}

const float topLineHeight = 50.0;
const float centerBuffer = 50.0;

- (id)initFromController:(LifeCounterViewController *)vc {
    controller = vc;
    
    self = [super init];
    
    [self setBackgroundColor: [UIColor blackColor]];
    timeLabel = [UILabel new];
    [timeLabel setText:@"TIME"];
    [self resizeLabel:timeLabel toSize:24.0];
    [timeLabel setTextColor:[UIColor whiteColor]];
    [self addSubview:timeLabel];
    
    titleLabel = [UILabel new];
    
    [titleLabel setText:@"           LIFE            COUNTER"];
//    [titleLabel setText:@"LifeTap"];
    
    UIFont *font = titleLabel.font;
    [titleLabel setFont:[UIFont fontWithName:@"GillSans-Bold" size:font.pointSize]];
//    [titleLabel setFont:[UIFont fontWithName:@"Zapfino" size:font.pointSize]];
    
    [titleLabel setTextColor:[UIColor whiteColor]];
    [self resizeLabel:titleLabel toSize:30.0];
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
    
    p2DownButton = [[LifeModifyButton alloc] initWithModValue:-1];
    [self addSubview:p2DownButton];
    
    menu = [[Menu alloc] initWithFrame:CGRectZero];
    [self addSubview:menu];
    
    
    UIImage *blueImage = [self getDiceImageWithName:@"Blue1.png"];
    UIImage *redImage = [self getDiceImageWithName:@"Red1.png"];
    p1Dice = [[UIImageView alloc] initWithImage:blueImage];
    p2Dice = [[UIImageView alloc] initWithImage:redImage];
    
    
    p2Dice.hidden = YES;
    p1Dice.hidden = YES;
    
    // problem is p1Dice gets referenced to something else instead of transformed.
    [self addSubview: p1Dice];
    [self addSubview: p2Dice];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    titleLabel.center = CGPointMake(self.center.x, 25);
    
    
    float frameWidth = self.center.x - centerBuffer;
    float frameHeight = (self.frame.size.height - topLineHeight) / 2.0;
    
    float startX = 20;
    float startY = 0;
    timeLabel.frame = CGRectMake(startX, startY, titleLabel.frame.origin.x - startX, topLineHeight);

    
    p1UpButton.frame = CGRectMake(-1, topLineHeight, frameWidth + 1, frameHeight);
    p1DownButton.frame = CGRectMake(-1, topLineHeight + frameHeight, frameWidth + 1, frameHeight + 1);
    
    float p2LifeX = self.center.x + centerBuffer;
    
    p2UpButton.frame = CGRectMake(p2LifeX, topLineHeight, frameWidth, frameHeight);
    p2DownButton.frame = CGRectMake(p2LifeX, topLineHeight + frameHeight, frameWidth, frameHeight + 1);
    
    CGRect menuFrame = CGRectMake(self.center.x - centerBuffer, topLineHeight, centerBuffer * 2.0, self.frame.size.height -topLineHeight);
    menu.frame = menuFrame;
    [menu layoutSubviews];
    
    p1Dice.center = p1LifeLabel.center;
    p2Dice.center = p2LifeLabel.center;
    
//    [self bringSubviewToFront:p1LifeLabel];
//    [self bringSubviewToFront:p2LifeLabel];
}

- (void)displayP1Life:(NSInteger)p1Life P2Life:(NSInteger)p2Life {
    [p1LifeLabel setText:[NSString stringWithFormat:@"%ld", p1Life]];
    [p2LifeLabel setText:[NSString stringWithFormat:@"%ld", p2Life]];
    [p1LifeLabel sizeToFit];
    [p2LifeLabel sizeToFit];
    
    p1LifeLabel.hidden = NO;
    p2LifeLabel.hidden = NO;
    p1Dice.hidden = YES;
    p2Dice.hidden = YES;
    
    [self centerLifeValues];
}

- (void)centerLifeValues {
    float p1CenterX = (self.center.x - centerBuffer) / 2.0;
    float p2CenterX = self.frame.size.width - p1CenterX;
    float centerY = ((self.frame.size.height - topLineHeight) / 2.0) + topLineHeight;
    p1LifeLabel.center = CGPointMake(p1CenterX, centerY);
    p2LifeLabel.center = CGPointMake(p2CenterX, centerY);
    
    p1Dice.center = p1LifeLabel.center;
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
    [self showDiceP1:roll1 P2:roll2];
    [self centerLifeValues];
}

- (void)showDiceP1:(NSInteger)roll1 P2:(NSInteger)roll2 {
    NSString *diceName1 = [NSString stringWithFormat:@"Blue%ld.png", roll1];
    UIImage *diceImage1 = [self getDiceImageWithName:diceName1];
    [p1Dice setImage:diceImage1];
    
    NSString *diceName2 = [NSString stringWithFormat:@"Red%ld.png", roll2];
    UIImage *diceImage2 = [self getDiceImageWithName:diceName2];
    [p2Dice setImage:diceImage2];
    
    p1Dice.hidden = NO;
    p1LifeLabel.hidden = YES;
    
    p2Dice.hidden = NO;
    p2LifeLabel.hidden = YES;
}

- (UIImage *)getDiceImageWithName:(NSString *)imageName {
    UIImage * image = [UIImage imageNamed:imageName];
    CGSize scaleSize = CGSizeMake(150, 150);
    UIGraphicsBeginImageContextWithOptions(scaleSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, scaleSize.width, scaleSize.height)];
    UIImage * diceImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return diceImage;
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

- (void)updateTime:(NSString *)timeString {
    [timeLabel setText:timeString];
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

- (void)assignMenuButtonActionWithRoll:(SEL)roll Reset:(SEL)reset {
    [menu attachToVC:controller];
    [menu assignMenuButtonAction:reset And:roll];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
