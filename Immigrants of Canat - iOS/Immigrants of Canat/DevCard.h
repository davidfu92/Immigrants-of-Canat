//
//  DevCard.h
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "Card.h"

@interface DevCard : Card

#define VICTORYPOINT_CARD 334
#define GOODHARVEST_CARD 335
#define CONSTRUCTION_CARD 336
#define COLLECTION_CARD 337
#define MILITIA_CARD 338

- (id)initWithType:(NSUInteger)type;
- (NSUInteger)getType;

@end
