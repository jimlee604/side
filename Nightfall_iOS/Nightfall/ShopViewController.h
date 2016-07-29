//
//  ShopViewController.h
//  Nightfall
//
//  Created by Jimmy Lee on 7/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "BackableViewController.h"
#import "BuyButton.h"

@interface ShopViewController : BackableViewController<TransitioningViewController>

- (void)handlePurchase:(BuyButton *)sender;

@end
