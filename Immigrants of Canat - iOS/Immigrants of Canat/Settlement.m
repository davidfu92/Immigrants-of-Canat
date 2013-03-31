//
//  Settlement.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "Settlement.h"
#import "ResourceTile.h"
#import "Player.h"

@interface Settlement()

@property (strong, nonatomic) ResourceTile *location;
@property (strong, nonatomic) Player *owner;
@property (nonatomic) NSUInteger corner;

@end

@implementation Settlement

- (id)initWithTileLocation:(ResourceTile *)location CornerLocation:(NSUInteger)corner andOwner:(Player *)owner {
    
    self = [super init];
    
    if(self) {
        if(location && owner && (corner == LEFT_CORNER || corner == UPPER_LEFT_CORNER || corner == UPPER_RIGHT_CORNER || corner == RIGHT_CORNER || corner == LOWER_RIGHT_CORNER || corner == LOWER_LEFT_CORNER)) {
            _location = location;
            _owner = owner;
            _corner = corner;
        } else {
            self = nil;
        }
    }
    
    return self;
    
}

- (NSArray *)getLocation {
    NSNumber *corner = [[NSNumber alloc] initWithInt:_corner];
    NSArray *locationArray = @[_location, corner];
    return locationArray;
}

- (Player *)getOwner {
    return _owner;
}

@end
