//
//  BackButton.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/3/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "BackButton.h"

@implementation BackButton

- (id)init {
    self = [super initWithTitle:@"BACK"];
    self.destination = @"BACK";
    [self setColorBackground:[UIColor grayColor] Foreground:[UIColor whiteColor]];
    return self;
}

@end
