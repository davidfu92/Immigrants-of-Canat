//
//  HumanPlayer.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "HumanPlayer.h"
#import "PlayerDeck.h"
#import "Card.h"
#import "ResourceCard.h"

@interface HumanPlayer()

@property (nonatomic) NSUInteger score;
@property (strong, nonatomic) PlayerDeck *resourceHand, *devHand;

@end

@implementation HumanPlayer

- (BOOL)checkAbilityToPurchase:(NSUInteger)item {
    NSArray *cards = [_resourceHand getCardArray];
    if(item == SETTLEMENT_PURCHASE) {
        BOOL hasBarley, hasLivestock, hasLumber, hasClay;
        for(ResourceCard *card in cards) {
            if([card getType] == LIVESTOCK_RESOURCE) {
                hasLivestock = YES;
            } else if([card getType] == LUMBER_RESOURCE) {
                hasLumber = YES;
            } else if([card getType] == CLAY_RESOURCE) {
                hasClay = YES;
            } else if([card getType] == BARLEY_RESOURCE) {
                hasBarley = YES;
            }
        }
        if(hasLivestock && hasLumber && hasClay && hasBarley) {
            return YES;
        } else {
            return NO;
        }
    } else if(item == CITY_PURCHASE) {
        NSUInteger stoneCounter = 0, barleyCounter = 0;
        for(ResourceCard *card in cards) {
            if([card getType] == STONE_RESOURCE) {
                stoneCounter++;
            } else if([card getType] == BARLEY_RESOURCE) {
                barleyCounter++;
            }
        }
        if(stoneCounter >= 3 && barleyCounter >= 2) {
            return YES;
        } else {
            return NO;
        }
    } else if(item == DEVCARD_PURCHASE) {
        BOOL hasLivestock, hasStone, hasBarley;
        for(ResourceCard *card in cards) {
            if([card getType] == STONE_RESOURCE) {
                hasStone = YES;
            } else if([card getType] == BARLEY_RESOURCE) {
                hasBarley = YES;
            } else if([card getType] == LIVESTOCK_RESOURCE) {
                hasLivestock = YES;
            }
        }
        if(hasLivestock && hasBarley && hasStone) {
            return YES;
        } else {
            return NO;
        }
    } else if(item == ROAD_PURCHASE) {
        BOOL hasClay, hasLumber;
        for(ResourceCard *card in cards) {
            if([card getType] == LUMBER_RESOURCE) {
                hasLumber = YES;
            } else if([card getType] == CLAY_RESOURCE) {
                hasClay = YES;
            }
        }
        if(hasClay && hasLumber) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

- (NSArray *)makePurchaseOfType:(NSUInteger)item {
    if(item == ROAD_PURCHASE) {
        NSUInteger clayIndex = [[_resourceHand getCardArray] indexOfObject:[[ResourceCard alloc] initWithResource:CLAY_RESOURCE]];
        NSUInteger lumberIndex = [[_resourceHand getCardArray] indexOfObject:[[ResourceCard alloc] initWithResource:LUMBER_RESOURCE]];
        NSArray *cards = @[[[_resourceHand getCardArray] objectAtIndex:clayIndex], [[_resourceHand getCardArray] objectAtIndex:lumberIndex]];
        [_resourceHand drawCardAtIndex:clayIndex];
        [_resourceHand drawCardAtIndex:lumberIndex];
        return cards;
    } else if(item == DEVCARD_PURCHASE) {
        NSUInteger stoneIndex = [[_resourceHand getCardArray] indexOfObject:[[ResourceCard alloc] initWithResource:STONE_RESOURCE]];
        NSUInteger livestockIndex = [[_resourceHand getCardArray] indexOfObject:[[ResourceCard alloc] initWithResource:LIVESTOCK_RESOURCE]];
        NSUInteger barleyIndex = [[_resourceHand getCardArray] indexOfObject:[[ResourceCard alloc] initWithResource:BARLEY_RESOURCE]];
        NSArray *cards = @[[[_resourceHand getCardArray] objectAtIndex:stoneIndex], [[_resourceHand getCardArray] objectAtIndex:livestockIndex], [[_resourceHand getCardArray] objectAtIndex:barleyIndex]];
        [_resourceHand drawCardAtIndex:stoneIndex];
        [_resourceHand drawCardAtIndex:livestockIndex];
        [_resourceHand drawCardAtIndex:barleyIndex];
        return cards;
    } else if(item == CITY_PURCHASE) {
        
    } else if(item == SETTLEMENT_PURCHASE) {
        NSUInteger barleyIndex = [[_resourceHand getCardArray] indexOfObject:[[ResourceCard alloc] initWithResource:BARLEY_RESOURCE]];
        NSUInteger livestockIndex = [[_resourceHand getCardArray] indexOfObject:[[ResourceCard alloc] initWithResource:LIVESTOCK_RESOURCE]];
        NSUInteger clayIndex = [[_resourceHand getCardArray] indexOfObject:[[ResourceCard alloc] initWithResource:CLAY_RESOURCE]];
        NSUInteger lumberIndex = [[_resourceHand getCardArray] indexOfObject:[[ResourceCard alloc] initWithResource:LUMBER_RESOURCE]];
        NSArray *cards = @[[_resourceHand drawCardAtIndex:barleyIndex], [_resourceHand drawCardAtIndex:livestockIndex], [_resourceHand drawCardAtIndex:clayIndex], [_resourceHand drawCardAtIndex:lumberIndex]];
        return cards;
    }
    return nil;
}

@end
