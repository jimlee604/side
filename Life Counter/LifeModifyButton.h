//
//  LifeModifyButton.h
//  Life Counter
//
//  Created by Jimmy Lee on 7/30/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LifeModifyButton : UIButton

@property NSInteger modVal;

- (id)initWithModValue:(NSInteger)modVal;

@end
