//
//  Thief.h
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ResourceTile;

@interface Thief : NSObject

- (BOOL)setLocationAt:(ResourceTile *)location;
- (ResourceTile *)getLocation;

@end
