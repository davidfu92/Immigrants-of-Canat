//
//  Path.h
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HumanPlayer;
@class ComputerPlayer;
@class ResourceTile;
@class Player;

@interface Path : NSObject

- (id)initWithLocation:(ResourceTile *)location andOwner:(Player *)owner;
- (ResourceTile *)getLocation;
- (Player *)getOwner;

@end
