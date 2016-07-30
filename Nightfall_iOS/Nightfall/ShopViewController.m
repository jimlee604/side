//
//  ShopViewController.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/24/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "ShopViewController.h"
#import "Utils.h"
#import "ShopView.h"
#import "Item.h"
#import "Data.h"
#import "BuyButton.h"

@implementation ShopViewController {
    ShopView *shopView;
}

- (id)init {
    self = [super init];
    shopView = [[ShopView alloc] initWithTransitionDelegate:self];
    [shopView linkToShopVC:self];
    //[self.view setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview: shopView];
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [shopView hidePurchasedLabel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    shopView.frame = [Utils wrappingFrame:self.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)switchViewControllers:(GameButton *)sender {
    if ([sender.destination isEqualToString:@"BACK"]) {
        [self goBack];
    }
}

- (void)handlePurchase:(BuyButton *)sender {
    Item *item = sender.item;
    if (item != nil) {
        Player *player = [Data mainCharacter];
        NSInteger cost = item.value;
        // TODO: handle message saying not enough gold.
        // TODO: Display cost in label.
        if (player.gold >= cost) {
            [player loseGold:cost];
            [[player items] addObject:item];
            [shopView confirmPurchase:item];
        } else {
            [shopView denyPurchase];
        }
    }
    [sender unhighlight];
}

@end
