//
//  BuyButton.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/27/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "BuyButton.h"
#import "Data.h"
#import "Item.h"

// TODO: put all color constants in a file
@implementation BuyButton {
}

- (id)initWithItem:(Item *)item {
    self.item = item;
    
    NSString *priceString = [NSString stringWithFormat:@"%ld G", item.value];
    self = [super initWithTitle:priceString];
    
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.0;
    
    [self setBackgroundColor:[UIColor yellowColor]];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addTarget:self action:@selector(highlight) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(unhighlight) forControlEvents:UIControlEventTouchUpOutside];
    
    return self;
}

- (void)highlight {
    [self setBackgroundColor:[UIColor orangeColor]];
}

- (void)unhighlight {
    [self setBackgroundColor:[UIColor yellowColor]];
}

@end
