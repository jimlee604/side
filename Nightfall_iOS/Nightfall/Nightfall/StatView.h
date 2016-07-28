//
//  StatView.h
//  Nightfall
//
//  Created by Jimmy Lee on 7/27/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Character.h"

@interface StatView : UIView

- (id)initForCharacter:(Character *)character;
- (void)updateValues;

@end
