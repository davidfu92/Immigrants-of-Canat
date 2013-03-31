//
//  Player.h
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PlayerDeck;
@class ResourceCard;
@class DevCard;

@interface Player : NSObject

- (NSUInteger)getScore;
- (void)appendScoreBy:(NSUInteger)points;
- (void)addResourceCard:(ResourceCard *)card;
- (void)addDevCard:(DevCard *)card;
- (PlayerDeck *)getResourceHand;
- (PlayerDeck *)getDevHand;

@end
