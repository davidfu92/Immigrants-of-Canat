//
//  OceanTile.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "OceanTile.h"

@interface OceanTile()

@property (nonatomic) BOOL isPort;
@property (nonatomic) CGPoint location;

@end

@implementation OceanTile

- (id)initWithLocation:(CGPoint)location andPortStatus:(BOOL)isPort {
    
    self = [super init];
    
    if(self) {
        _location = location;
        _isPort = isPort;
    }
    
    return self;
    
}

- (BOOL)isPortTile {
    return _isPort;
}

@end
