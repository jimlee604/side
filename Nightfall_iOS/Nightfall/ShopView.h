//
//  ShopView.h
//  Nightfall
//
//  Created by Jimmy Lee on 7/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuOptionView.h"
#import "ShopViewController.h"


@interface ShopView : MainMenuOptionView

- (void)hidePurchasedLabel;

- (void)linkToShopVC:(ShopViewController *)vc;

- (void)confirmPurchase:(Item *)item;
- (void)denyPurchase;

@end
