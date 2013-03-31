//
//  Thief.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "Thief.h"
#import "Player.h"
#import "ResourceTile.h"

@interface Thief()

@property (strong, nonatomic) ResourceTile *location;

@end

@implementation Thief

- (BOOL)setLocationAt:(ResourceTile *)location {
    if(location && ![location isEqual:_location]) {
        _location = location;
        return YES;
    } else {
        return NO;
    }
}

- (ResourceTile *)getLocation {
    return _location;
}

@end
