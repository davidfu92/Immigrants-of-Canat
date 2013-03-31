//
//  DevCardDeck.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "DevCardDeck.h"
#import "DevCard.h"

@interface DevCardDeck()

@property (strong, nonatomic) NSMutableArray *deck;

@end

@implementation DevCardDeck

- (id)init {
    
    self = [super init];
    
    if(self) {
        for(NSUInteger i = 0; i < 25; i++) {
            if(i < 14) {
                [_deck insertObject:[[DevCard alloc] initWithType:MILITIA_CARD] atIndex:i];
            } else if(i < 19) {
                [_deck insertObject:[[DevCard alloc] initWithType:VICTORYPOINT_CARD] atIndex:i];
            } else if(i < 21) {
                [_deck insertObject:[[DevCard alloc] initWithType:GOODHARVEST_CARD] atIndex:i];
            } else if(i < 23) {
                [_deck insertObject:[[DevCard alloc] initWithType:CONSTRUCTION_CARD] atIndex:i];
            } else if(i < 25) {
                [_deck insertObject:[[DevCard alloc] initWithType:COLLECTION_CARD] atIndex:i];
            }
        }
    }
    
    return self;
    
}

- (void)shuffle {
    for(NSUInteger i = 0; i < 25; i++) {
        NSUInteger index1 = arc4random_uniform(25), index2 = arc4random_uniform(25);
        if(index1 != index2) {
            DevCard *tmpCard = [_deck objectAtIndex:index1];
            [_deck replaceObjectAtIndex:index1 withObject:[_deck objectAtIndex:index2]];
            [_deck replaceObjectAtIndex:index2 withObject:tmpCard];
        }
    }
}

@end
