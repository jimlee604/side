//
//  ShopView.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "ShopView.h"

#import "BuyButton.h"
#import "Consumable.h"
#import "Data.h"
#import "GameButton.h"
#import "ShopViewController.h"
#import "Utils.h"


@implementation ShopView {
    ShopViewController *shopVC;
    
    UILabel *potionLabel;
    GameButton *potionButton;
    UILabel *purchasedLabel;
}

static const float label_x = 30;
static const float button_x = 170;

- (void)linkToShopVC:(ShopViewController *)vc {
    shopVC = vc;
}

- (id)initWithTransitionDelegate:(id<TransitioningViewController>) tvc {
    self = [super initWithTransitionDelegate:tvc Title:@"SHOP"];
    [self setBackgroundColor:[UIColor purpleColor]];
    
    purchasedLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:purchasedLabel];
    
    // have a label generator like buy button?
    potionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [potionLabel setText:@"Health Potion"];
    [potionLabel setTextColor:[UIColor blackColor]];
    [potionLabel sizeToFit];
    [self addSubview:potionLabel];
    
    potionButton = [self createBuyButtonForItem:[HealthPotion new]];
    // generalize and have shop read what items it's supposed to have via data. // dependent on player purchases and level
    [self addSubview:potionButton];
    return self;
}

- (BuyButton *) createBuyButtonForItem:(Item *)item {
    BuyButton *button = [[BuyButton alloc] initWithItem:item];
    [button addTarget:shopVC action:@selector(handlePurchase:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)confirmPurchase:(Item *)item {
    NSString *purchaseText = [NSString stringWithFormat:@"Purchased %@!", item.name];
    [purchasedLabel setText: purchaseText];
    [purchasedLabel sizeToFit];
    [purchasedLabel setHidden:NO];
}

- (void)denyPurchase {
    NSString *purchaseText = @"Not enough gold!";
    [purchasedLabel setText: purchaseText];
    [purchasedLabel sizeToFit];
    [purchasedLabel setHidden:NO];
}

- (void) hidePurchasedLabel {
    [purchasedLabel setHidden:YES];
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    CGFloat dy = 70;
    CGFloat y = 300;
    
    CGFloat buttonWidth = 100;
    
    [potionButton setWidth:buttonWidth];
    
    [self alignShopLabel:potionLabel Button:potionButton AtY:y];

    y += dy;
    [purchasedLabel sizeToFit];
    [Utils horizontallyCenterView:purchasedLabel within:self AtY:y];
}

- (void)alignShopLabel:(UILabel *)label Button:(UIButton *)button AtY:(CGFloat)y {
    [Utils setOriginX:label_x Y:y forView:label];
    label.center = CGPointMake(label.center.x, y);
    
    [Utils setOriginX:button_x Y:y forView:button];
    button.center = CGPointMake(button.center.x, y);

}

- (void)alignShopView:(UIView *)view AtX:(CGFloat)x Y:(CGFloat)y {
    [Utils setOriginX:x Y:y forView:view];
    view.center = CGPointMake(view.center.x, y);
}

@end
