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
    
    BOOL rotated;
    
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
    UIImageView *crown;
    
    Menu *menu;
}

const float topLineHeight = 50.0;
const float centerBuffer = 50.0;

- (id)initFromController:(LifeCounterViewController *)vc {
    controller = vc;
    self = [super init];
    
    rotated = NO;
    
    [self setBackgroundColor: [UIColor blackColor]];
    timeLabel = [UILabel new];
    [timeLabel setText:@"TIMEEEEEEEEE"];
    [timeLabel sizeToFit];
    timeLabel.adjustsFontSizeToFitWidth = YES;
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
    
    float diceSize = 150;
    
    UIImage *blueImage = [self scaledImageWithName:@"Blue1.png" Width:diceSize Height:diceSize];
    UIImage *redImage = [self scaledImageWithName:@"Red1.png" Width:diceSize Height:diceSize];
    p1Dice = [[UIImageView alloc] initWithImage:blueImage];
    p2Dice = [[UIImageView alloc] initWithImage:redImage];
    
    UIImage *crownImage = [UIImage imageNamed:@"crown.png"];
    crownImage = [self scaledImageWithName:@"crown.png" Width:125 Height:50];
    crown = [[UIImageView alloc] initWithImage:crownImage];
    
    p2Dice.hidden = YES;
    p1Dice.hidden = YES;
    
    [crown sizeToFit];
    crown.hidden = YES;
    
    // problem is p1Dice gets referenced to something else instead of transformed.
    [self addSubview: p1Dice];
    [self addSubview: p2Dice];
    [self addSubview: crown];
    
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

    if (rotated) {
        frameWidth = frameWidth / 2;
        frameHeight = frameHeight * 2;
        
        p1UpButton.frame = CGRectMake(-1, topLineHeight, frameWidth + 1, frameHeight + 1);
        p1DownButton.frame = CGRectMake(frameWidth + 1, topLineHeight, frameWidth + 1, frameHeight + 1);
        
        float p2LifeX = self.center.x + centerBuffer;
        
        p2UpButton.frame = CGRectMake(p2LifeX, topLineHeight, frameWidth, frameHeight);
        p2DownButton.frame = CGRectMake(p2LifeX + frameWidth + 1, topLineHeight, frameWidth, frameHeight + 1);
        
    } else {
    
        p1UpButton.frame = CGRectMake(-1, topLineHeight, frameWidth + 1, frameHeight);
        p1DownButton.frame = CGRectMake(-1, topLineHeight + frameHeight, frameWidth + 1, frameHeight + 1);

        float p2LifeX = self.center.x + centerBuffer;
    
        p2UpButton.frame = CGRectMake(p2LifeX, topLineHeight, frameWidth, frameHeight);
        p2DownButton.frame = CGRectMake(p2LifeX, topLineHeight + frameHeight, frameWidth, frameHeight + 1);
        
    }
    
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
    crown.hidden = YES;
    
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
    
    float crownDist = 110;
    
    if (roll1 > roll2) {
        crown.center = CGPointMake(p1Dice.center.x, p1Dice.center.y - crownDist);
        [p1LifeLabel setText:[NSString stringWithFormat:@"%ld*", roll1]];
    } else {
        [p1LifeLabel setText:[NSString stringWithFormat:@"%ld", roll1]];
    }
    if (roll2 > roll1) {
        crown.center = CGPointMake(p2Dice.center.x, p2Dice.center.y - crownDist);
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
    
    if (roll1 != roll2) {
        crown.hidden = NO;
    }
    
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

- (UIImage *)scaledImageWithName:(NSString *)name Width:(float)width Height:(float)height {
    UIImage *image = [UIImage imageNamed:name];
    CGSize scaleSize = CGSizeMake(width, height);
    UIGraphicsBeginImageContextWithOptions(scaleSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, scaleSize.width, scaleSize.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}


// borders logic. move to another class if it won't cause problems.
- (void)drawBorders {
    
    
    float leftLineX = self.center.x - centerBuffer;
    float rightLineX = self.center.x + centerBuffer;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0.0, topLineHeight)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, topLineHeight)];
    
    [path moveToPoint:CGPointMake(leftLineX, topLineHeight)];
    [path addLineToPoint:CGPointMake(leftLineX, self.frame.size.height)];
    
    [path moveToPoint:CGPointMake(rightLineX, topLineHeight)];
    [path addLineToPoint:CGPointMake(rightLineX, self.frame.size.height)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor grayColor] CGColor];
    shapeLayer.lineWidth = 2.0;
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    
    [self.layer addSublayer:shapeLayer];
}

- (void)updateTime:(NSString *)timeString {
    [timeLabel setText:timeString];
    [timeLabel sizeToFit];
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

- (void) assignMenuButtonActionWithRoll:(SEL)roll Reset:(SEL)reset Rotate:(SEL)rotate {
    [menu attachToVC:controller];
    [menu assignMenuButtonActionReset:reset Roll:roll Rotate:rotate];
}


- (void) rotate {
    
    BOOL coding = YES;
    
    if (!coding) {
        return;
    }
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(-M_PI_2);
    
    
    if (!rotated) {
        rotated = YES;
    } else {
        rotated = NO;
        transform = CGAffineTransformMakeRotation(0); // probably a better keyword here
    }
    p1LifeLabel.transform = transform;
    p2LifeLabel.transform = transform;
    
    
    p1UpButton.frame = CGRectMake(0, 0, 0, 0);
    
//    p1UpButton.frame = CGRectMake(0, 0, width, height);
    
//    p1UpButton.transform = ;
//    p2UpButton.backgroundColor = [UIColor greenColor];
//    p2DownButton.backgroundColor = [UIColor redColor];
    
    p1DownButton.imageView.transform = transform;
    p2UpButton.transform = transform;
    p2DownButton.transform = transform;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
