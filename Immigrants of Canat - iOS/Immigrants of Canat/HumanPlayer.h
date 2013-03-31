//
//  HumanPlayer.h
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "Player.h"

@interface HumanPlayer : Player

#define SETTLEMENT_PURCHASE 88843
#define CITY_PURCHASE 99583
#define DEVCARD_PURCHASE 77584
#define ROAD_PURCHASE 374859

- (BOOL)checkAbilityToPurchase:(NSUInteger)item;
- (NSArray *)makePurchaseOfType:(NSUInteger)item;

@end
