//
//  DevCard.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "DevCard.h"

@interface DevCard()

@property (nonatomic) NSUInteger type;

@end

@implementation DevCard

- (id)initWithType:(NSUInteger)type {
    
    self = [super init];
    
    if(self ) {
        if(type == VICTORYPOINT_CARD || type == GOODHARVEST_CARD || type == CONSTRUCTION_CARD || type == COLLECTION_CARD || type == MILITIA_CARD) {
            _type = type;
        } else {
            self = nil;
        }
    }
    
    return self;
    
}

- (NSUInteger)getType {
    return _type;
}

@end
