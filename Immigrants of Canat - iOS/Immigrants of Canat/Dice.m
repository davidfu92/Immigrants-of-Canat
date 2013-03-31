//
//  Dice.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/31/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (CGPoint)roll {
    NSUInteger die1 = arc4random_uniform(7);
    while(die1 == 0) {
        die1 = arc4random_uniform(7);
    }
    NSUInteger die2 = arc4random_uniform(7);
    while(die2 == 0) {
        die2 = arc4random_uniform(7);
    }
    return CGPointMake(die1, die2);
}

@end
