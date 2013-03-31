//
//  OceanTile.h
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "Tile.h"

@interface OceanTile : Tile

- (id)initWithLocation:(CGPoint)location andPortStatus:(BOOL)isPort;
- (BOOL)isPortTile;

@end
