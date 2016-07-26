//
//  ShopView.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "ShopView.h"

#import "Consumable.h"
#import "Data.h"
#import "GameButton.h"
#import "Utils.h"

@implementation ShopView {
    UILabel *potionLabel;
    GameButton *potionButton;
}

- (id)initWithTransitionDelegate:(id<TransitioningViewController>) tvc {
    self = [super initWithTransitionDelegate:tvc Title:@"SHOP"];
    [self setBackgroundColor:[UIColor purpleColor]];
    
    
    potionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [potionLabel setText:@"Health Potion"];
    [potionLabel setTextColor:[UIColor blackColor]];
    [potionLabel sizeToFit];
    [self addSubview:potionLabel];
    
    // generalize and have shop read what items it's supposed to have via data. // dependent on player purchases and level
    potionButton = [[GameButton alloc] initWithTitle:@"BUY"];
    [potionButton setColorBackground:[UIColor grayColor] Foreground:[UIColor blackColor]];
    [potionButton setDestination:@"potion"];
    
    // TODO: redirect to shopVC instead of self.
    [potionButton addTarget:self action:@selector(addItem:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:potionButton];
    
    return self;
}

- (void) addItem:(GameButton *)sender {
    Item *item = nil;
    if ([sender.destination isEqualToString:@"potion"]) {
        item = [HealthPotion new];
    }
    if (item != nil) {
        Player *player = [Data mainCharacter];
        NSInteger cost = item.value;
        // TODO: handle message saying not enough gold.
        // TODO: Display cost in label.
        if (player.gold >= cost) {
            [player loseGold:cost];
            [[player items] addObject:item];
        }
    }
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
//    CGFloat dy = 70;
    CGFloat y = 300;
    
    CGFloat label_x = 30;
    CGFloat button_x = 170;
    
    CGFloat buttonWidth = 100;
    
    [potionButton setWidth:buttonWidth];
    
    [self alignShopView:potionLabel AtX:label_x Y:y];
    [self alignShopView:potionButton AtX:button_x Y:y];
}

- (void)alignShopView:(UIView *)view AtX:(CGFloat)x Y:(CGFloat)y {
    [Utils setOriginX:x Y:y forView:view];
    view.center = CGPointMake(view.center.x, y);
}

@end
