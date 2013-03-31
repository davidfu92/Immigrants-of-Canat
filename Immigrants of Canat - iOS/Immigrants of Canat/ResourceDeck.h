//
//  ResourceDeck.h
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "Deck.h"
@class ResourceTile;

@interface ResourceDeck : Deck

- (id)initWithResource:(NSUInteger)resource;
- (NSUInteger)getDeckType;

@end
