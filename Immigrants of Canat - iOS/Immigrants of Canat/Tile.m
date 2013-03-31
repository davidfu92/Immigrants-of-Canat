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
@property (strong, nonatomic) UIButton *correspondingTile, *bigTile;

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

- (void)setBigTile:(UIButton *)bigTile {
    _bigTile = bigTile;
}

- (void)setCorrespondingButton:(UIButton *)tile {
    _correspondingTile = tile;
}

@end
