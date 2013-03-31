//
//  Deck.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "Deck.h"
#import "Card.h"

@interface Deck()

@property (strong, nonatomic)NSMutableArray *deck;

@end

@implementation Deck

- (Card *)drawCard {
    if(_deck) {
        Card *returnCard = [_deck objectAtIndex:0];
        [_deck removeObjectAtIndex:0];
        return returnCard;
    } else {
        return nil;
    }
}

- (void)addCardToBottom:(Card *)card {
    [_deck insertObject:card atIndex:[_deck count] - 1];
}

- (void)addCardToTop:(Card *)card {
    [_deck insertObject:card atIndex:0];
}

@end
