//
//  ResourceCard.h
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "Card.h"

@interface ResourceCard : Card

#define STONE_RESOURCE 1
#define CLAY_RESOURCE 2
#define LUMBER_RESOURCE 3
#define LIVESTOCK_RESOURCE 4
#define BARLEY_RESOURCE 5

- (id)initWithResource:(NSUInteger)resource;
- (BOOL)isEqual:(id)object;

@end
