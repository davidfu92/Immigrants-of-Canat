//
//  ResourceCard.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "ResourceCard.h"

@interface ResourceCard()

@property (nonatomic) NSUInteger type;

@end

@implementation ResourceCard

- (id)initWithResource:(NSUInteger)resource {
    
    self = [super init];
    
    if(self) {
        if(resource == STONE_RESOURCE || resource == CLAY_RESOURCE || resource == LUMBER_RESOURCE || resource == LIVESTOCK_RESOURCE || resource == BARLEY_RESOURCE) {
            _type = resource;
        } else {
            self = nil;
        }
    }
    
    return self;
    
}

@end
