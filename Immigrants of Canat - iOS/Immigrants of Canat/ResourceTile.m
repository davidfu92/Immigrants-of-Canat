//
//  ResourceTile.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "ResourceTile.h"
#import "Village.h"
#import "Metropolis.h"
#import "ResourceCard.h"
#import "Path.h"
#import "Player.h"
#import "Settlement.h"

@interface ResourceTile()

@property (strong, nonatomic) NSMutableDictionary *settlements, *paths;
@property (nonatomic) NSUInteger resourceType, rollNumber;
@property (nonatomic) CGPoint location;
@property (nonatomic) BOOL hasThief;
@property (strong, nonatomic) UIButton *correspondingTile;

@end

@implementation ResourceTile

- (id)initWithResourceType:(NSUInteger)resource andLocation:(CGPoint)location andRollNumber:(NSUInteger)rollNumber; {
    
    self = [super init];
    
    if(self) {
        if((resource == STONE_RESOURCE || resource == CLAY_RESOURCE || resource == LUMBER_RESOURCE || resource == LIVESTOCK_RESOURCE || resource == BARLEY_RESOURCE || resource == NORESOURCE) && rollNumber > 0 && rollNumber < 13) {
            _resourceType = resource;
            _location = location;
            _rollNumber = rollNumber;
        } else {
            self = nil;
        }
    }
    
    return self;
    
}

- (void)setCorrespondingButton:(UIButton *)tile {
    _correspondingTile = tile;
    UIImage *buttonImage;
    if(_resourceType == STONE_RESOURCE) {
        buttonImage = [UIImage imageNamed:@"stonetile.png"];
    } else if(_resourceType == CLAY_RESOURCE) {
        buttonImage = [UIImage imageNamed:@"bricktile.png"];
    } else if(_resourceType == LUMBER_RESOURCE) {
        buttonImage = [UIImage imageNamed:@"woodtile.png"];
    } else if(_resourceType == LIVESTOCK_RESOURCE) {
        buttonImage = [UIImage imageNamed:@"sheeptile.png"];
    } else if(_resourceType == BARLEY_RESOURCE) {
        buttonImage = [UIImage imageNamed:@"wheattile.png"];
    } else if(_resourceType == NORESOURCE) {
        buttonImage = [UIImage imageNamed:@"desert.png"];
    }
    [_correspondingTile setImage:buttonImage forState:UIControlStateNormal];
}

- (NSUInteger)getResourceType {
    return _resourceType;
}

- (NSUInteger)getNumberOfTile {
    return _rollNumber;
}

- (BOOL)hasSettlementAt:(NSUInteger)corner {
    if([_settlements objectForKey:[[NSNumber alloc] initWithInt:corner]]) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)setSettlementAt:(NSUInteger)corner toBe:(Settlement *)settlement withOwner:(Player *)owner {
    
    if((corner == LEFT_CORNER || corner == UPPER_LEFT_CORNER || corner == UPPER_RIGHT_CORNER || corner == RIGHT_CORNER || corner == LOWER_RIGHT_CORNER || corner == LOWER_LEFT_CORNER) && ![_settlements objectForKey:[[NSNumber alloc] initWithInt:corner]]) {
        if(!_settlements) {
            _settlements = [[NSMutableDictionary alloc] init];
        }
        NSNumber *chosenCorner = [[NSNumber alloc] initWithInt:corner];
        [_settlements setObject:settlement forKey:chosenCorner];
        return YES;
    } else {
        return NO;
    }
    
}

- (Settlement *)getSettlementAt:(NSUInteger)corner {
    return [_settlements objectForKey:[[NSNumber alloc] initWithInt:corner]];
}

- (NSUInteger)settlementIsOfTypeAt:(NSUInteger)corner {
    if([_settlements objectForKey:[[NSNumber alloc] initWithInt:corner]]) {
        if([[_settlements objectForKey:[[NSNumber alloc] initWithInt:corner]] isMemberOfClass:[Village class]]) {
            return VILLAGE_SETTLEMENT;
        } else {
            return METROPOLIS_SETTLEMENT;
        }
    } else {
        return -1;
    }
}

- (BOOL)setPathAt:(NSUInteger)side withOwner:(Player *)owner {
    if(!_paths) {
        _paths = [[NSMutableDictionary alloc] init];
    }
    if((side == UPPER_LEFT_SIDE || side == UPPER_MIDDLE_SIDE || side == UPPER_RIGHT_SIDE || side == LOWER_RIGHT_SIDE || side == LOWER_MIDDLE_SIDE || side == LOWER_LEFT_SIDE) && ![_paths objectForKey:[[NSNumber alloc] initWithInt:side]]) {
        [_paths setObject:[[Path alloc] initWithLocation:self andOwner:owner] forKey:[[NSNumber alloc] initWithInt:side]];
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)hasPathAt:(NSUInteger)side {
    if([_paths objectForKey:[[NSNumber alloc] initWithInt:side]]) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)hasThief {
    return _hasThief;
}

@end
