//
//  Path.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "Path.h"
#import "ResourceTile.h"
#import "Tile.h"
#import "ComputerPlayer.h"
#import "HumanPlayer.h"
#import "Player.h"

@interface Path()

@property (strong, nonatomic) Player *owner;
@property (strong, nonatomic) ResourceTile *location;

@end

@implementation Path

- (id)initWithLocation:(ResourceTile *)location andOwner:(Player *)owner {
    
    self = [super init];
    
    if(self) {
        if(location && owner) {
            _location = location;
            _owner = owner;
        } else {
            self = nil;
        }
    }
    
    return self;
    
}

- (ResourceTile *)getLocation {
    return _location;
}

- (Player *)getOwner {
    return _owner;
}

@end
