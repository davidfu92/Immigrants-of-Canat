//
//  Tile.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "Tile.h"
#import "Board.h"

@interface Tile()

@property (nonatomic) CGPoint location;
@property (strong, nonatomic) NSArray *surroundingTiles;

@end

@implementation Tile

- (CGPoint)getLocation {
    return _location;
}

- (void)setSurroundingTiles:(NSArray *)surroundingTiles {
    _surroundingTiles = surroundingTiles;
}

- (NSArray *)getSurroundingTiles {
    return [_surroundingTiles copy];
}

@end
