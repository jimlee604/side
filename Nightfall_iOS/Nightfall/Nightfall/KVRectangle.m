//
//  KVRectangle.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/27/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "KVRectangle.h"
#import "PaddedLabel.h"
#import "Utils.h"

@implementation KVRectangle {
    PaddedLabel *keyBox;
    PaddedLabel *valBox;
}

static const float klen = 35;
static const float vlen = 55;
static const float boxHeight = 35;

const CGRect keyRect =  { { 0.0f, 0.0f }, { klen, boxHeight } };
const CGRect valRect =  { { 0.0f, 0.0f }, { vlen, boxHeight } };

- (id)initWithKey:(NSString *)key Value:(NSString *)value {
    self = [super init];
    
    self.frame = CGRectMake(0, 0, klen + vlen, boxHeight);
    
    keyBox = [[PaddedLabel alloc] initWithFrame:keyRect];
    [keyBox setText: key];
    [keyBox setBackgroundColor:[UIColor whiteColor]];
    keyBox.layer.borderColor = [UIColor blackColor].CGColor;
    keyBox.layer.borderWidth = 1.0;
    
    [self addSubview:keyBox];
    
//    NSString *value = [NSString stringWithFormat:@"%ld", val];
    valBox = [[PaddedLabel alloc] initWithFrame:valRect];
    [valBox setText:value];
    [valBox setBackgroundColor:[UIColor whiteColor]];
    valBox.layer.borderColor = [UIColor blackColor].CGColor;
    valBox.layer.borderWidth = 1.0;
    [self addSubview:valBox];
    
    return self;
}

- (void)setValue:(NSString *)value {
    [valBox setText:value];
}

- (void)layoutSubviews {
    [Utils setOriginX:0 Y:0 forView:keyBox];
    [Utils setOriginX:klen Y:0 forView:valBox];
}

@end
