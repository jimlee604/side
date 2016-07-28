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
#import "BuyButton.h"
#import "Utils.h"


@implementation ShopView {
    UILabel *potionLabel;
    GameButton *potionButton;
}

- (id)initWithTransitionDelegate:(id<TransitioningViewController>) tvc {
    self = [super initWithTransitionDelegate:tvc Title:@"SHOP"];
    [self setBackgroundColor:[UIColor purpleColor]];
    
    // have a label generator like buy button?
    potionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [potionLabel setText:@"Health Potion"];
    [potionLabel setTextColor:[UIColor blackColor]];
    [potionLabel sizeToFit];
    [self addSubview:potionLabel];
    
    
    potionButton = [self createBuyButtonForItem:[HealthPotion new]];
    
    // generalize and have shop read what items it's supposed to have via data. // dependent on player purchases and level
//    NSString *potionPrice = [NSString stringWithFormat:@"%ld G", [HealthPotion new].value];
//    potionButton = [[GameButton alloc] initWithTitle:potionPrice];
//    [potionButton setColorBackground:[UIColor yellowColor] Foreground:[UIColor blackColor]];
//    [potionButton setDestination:@"potion"];
//    
    // TODO: redirect to shopVC instead of self.
//    [potionButton addTarget:self action:@selector(addItem:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:potionButton];
    
    return self;
}

- (BuyButton *) createBuyButtonForItem:(Item *)item {
    BuyButton *button = [[BuyButton alloc] initWithItem:item];
    [button addTarget:self action:@selector(addItem:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void) addItem:(BuyButton *)sender {
    Item *item = sender.item;
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
    [sender unhighlight];
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
