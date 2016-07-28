//
//  BuyButton.h
//  Nightfall
//
//  Created by Jimmy Lee on 7/27/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "GameButton.h"
#import "Item.h"

@interface BuyButton : GameButton

@property Item *item;

- (id) initWithItem:(Item *)item;
- (void)unhighlight;

@end
