//
//  LifeModifyButton.m
//  Life Counter
//
//  Created by Jimmy Lee on 7/30/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "LifeModifyButton.h"

@implementation LifeModifyButton

- (id)initWithModValue:(NSInteger)modVal {
    self = [super init];
    
    self.modVal = modVal;
    self.layer.borderWidth = 0.25;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
