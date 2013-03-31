//
//  OceanTile.h
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "Tile.h"

@interface OceanTile : Tile

#define SHEEP_PORT 3286
#define ORE_PORT 6586
#define WHEAT_PORT 8965
#define WOOD_PORT 2145
#define BRICK_PORT 7373
#define GENERIC_PORT 9705

- (id)initWithLocation:(CGPoint)location andPortStatus:(BOOL)isPort;
- (void)setCorrespondingButton:(UIButton *)tile;
- (void)setPortType:(NSUInteger)type;
- (BOOL)isPortTile;

@end
