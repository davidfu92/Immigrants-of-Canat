//
//  ResourceDeck.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "ResourceDeck.h"
#import "ResourceTile.h"
#import "ResourceCard.h"

@interface ResourceDeck()

@property (strong, nonatomic) NSMutableArray *deck;
@property (nonatomic) NSUInteger resourceType;

@end

@implementation ResourceDeck

- (id)initWithResource:(NSUInteger)resource {
    
    self = [super init];
    
    if(self) {
        if(resource == STONE_RESOURCE || resource == LUMBER_RESOURCE || resource == CLAY_RESOURCE || resource == BARLEY_RESOURCE || resource == LIVESTOCK_RESOURCE) {
            _resourceType = resource;
            for(NSUInteger i = 0; i < 19; i++) {
                [_deck addObject:[[ResourceCard alloc] initWithResource:resource]];
            }
        } else {
            self = nil;
        }
    }
    
    return self;
    
}

- (NSUInteger)getDeckType {
    return _resourceType;
}

@end
