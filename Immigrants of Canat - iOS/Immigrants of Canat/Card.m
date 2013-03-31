//
//  Card.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "Card.h"

@interface Card()

@property (nonatomic) NSUInteger type;
@property (strong, nonatomic) UIButton *tile;

@end

@implementation Card

- (NSUInteger)getType {
    return _type;
}

- (void)setVisibleTile:(UIButton *)tile {
    _tile = tile;
}

@end
