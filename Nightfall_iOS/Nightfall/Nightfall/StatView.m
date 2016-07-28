//
//  StatView.m
//  Nightfall
//
//  Created by Jimmy Lee on 7/27/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "StatView.h"

#import "Character.h"
#import "KVRectangle.h"
#import "Stat.h"
#import "Utils.h"

@implementation StatView {
    Stat *stats;
    
    KVRectangle *HPbox;
    KVRectangle *MPbox;
}

- (id)initForCharacter:(Character *)character {
    self = [super init];

    stats = [character stats];
    NSString *HPString = [NSString stringWithFormat:@"%ld/%ld", stats.HP, stats.HP_MAX];
    NSString *MPString = [NSString stringWithFormat:@"%ld/%ld", stats.MP, stats.MP_MAX];
    HPbox = [[KVRectangle alloc] initWithKey:@"HP" Value:HPString];
    MPbox = [[KVRectangle alloc] initWithKey:@"MP" Value:MPString];

    [self addSubview: HPbox];
    [self addSubview: MPbox];

    self.frame = CGRectMake(0, 0, HPbox.frame.size.width, HPbox.frame.size.height * 2);
    return self;
}

- (void)layoutSubviews {
    float y = 0.0;

    [Utils setOriginX:0 Y:y forView:HPbox];
    y += HPbox.frame.size.height;
    [Utils setOriginX:0 Y:y forView:MPbox];
}

- (void)updateValues {
    NSString *HPString = [NSString stringWithFormat:@"%ld/%ld", stats.HP, stats.HP_MAX];
    NSString *MPString = [NSString stringWithFormat:@"%ld/%ld", stats.MP, stats.MP_MAX];
    [HPbox setValue: HPString];
    [MPbox setValue: MPString];
}

@end
