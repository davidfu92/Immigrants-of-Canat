//
//  Board.h
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Tile;
@class ResourceTile;
@class OceanTile;

@interface Board : NSObject

- (Tile *)getTileAtX:(NSUInteger)xpos Y:(NSUInteger) ypos;

@end
