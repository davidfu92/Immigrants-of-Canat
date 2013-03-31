//
//  Player.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "Player.h"
#import "PlayerDeck.h"
#import "ResourceCard.h"
#import "DevCard.h"

@interface Player()

@property (nonatomic) NSUInteger score;
@property (strong, nonatomic) PlayerDeck *resourceHand, *devHand;

@end

@implementation Player

- (id)init {
    
    self = [super init];
    
    if(self) {
        _score = 2;
    }
    
    return self;
    
}

- (void)appendScoreBy:(NSUInteger)points {
    _score += points;
}

- (NSUInteger)getScore {
    return _score;
}

- (void)addResourceCard:(ResourceCard *)card {
    [_resourceHand addCardToBottom:card];
}

- (void)addDevCard:(DevCard *)card {
    [_resourceHand addCardToBottom:card];
}

- (PlayerDeck *)getResourceHand {
    if(_resourceHand) {
        return _resourceHand;
    } else {
        _resourceHand = [[PlayerDeck alloc] init];
        return _resourceHand;
    }
}

- (PlayerDeck *)getDevHand {
    if(_devHand) {
        return _devHand;
    } else {
        _devHand = [[PlayerDeck alloc] init];
        return _devHand;
    }
}

@end
