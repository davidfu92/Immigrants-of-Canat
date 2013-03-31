//
//  Deck.h
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Card;

@interface Deck : NSObject

- (Card *)drawCardAtIndex:(NSUInteger)index;
- (Card *)peekAtCardAtIndex:(NSUInteger)index;
- (NSArray *)getCardArray;
- (void)addCardToBottom:(Card *)card;
- (void)addCardToTop:(Card *)card;

@end
