//
//  Consumable.h
//  Nightfall
//
//  Created by Jimmy Lee on 7/26/16.
//  Copyright © 2016 Jimmy Lee. All rights reserved.
//

#import "Item.h"
#import "Character.h"
#import "Stat.h"

@interface Consumable : Item

@property StatType statType;
@property ModifyType modifyType;
@property NSNumber *modifyValue;

-(void)useOnCharacter:(Character *)character;

@end

@interface HealthPotion : Consumable
@end
