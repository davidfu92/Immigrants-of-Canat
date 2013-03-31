//
//  ResourceTile.h
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "Tile.h"
@class ResourceCard;
@class Village;
@class Metropolis;
@class Path;
@class Player;
@class Settlement;

@interface ResourceTile : Tile

#define NORESOURCE 0
#define LEFT_CORNER 10
#define UPPER_LEFT_CORNER 15
#define UPPER_RIGHT_CORNER 20
#define RIGHT_CORNER 25
#define LOWER_RIGHT_CORNER 30
#define LOWER_LEFT_CORNER 35
#define UPPER_LEFT_SIDE 40
#define UPPER_MIDDLE_SIDE 45
#define UPPER_RIGHT_SIDE 50
#define LOWER_RIGHT_SIDE 55
#define LOWER_MIDDLE_SIDE 60
#define LOWER_LEFT_SIDE 65
#define VILLAGE_TYPE 500
#define METROPOLIS_TYPE 550

- (id)initWithResourceType:(NSUInteger)resource andLocation:(CGPoint)location andRollNumber:(NSUInteger)rollNumber;
- (NSUInteger)getResourceType;
- (NSUInteger)getNumberOfTile;
- (BOOL)hasSettlementAt:(NSUInteger)corner;
- (BOOL)setSettlementAt:(NSUInteger)corner toBe:(Settlement *)settlement withOwner:(Player *)owner;
- (Settlement *)getSettlementAt:(NSUInteger)corner;
- (NSUInteger)settlementIsOfTypeAt:(NSUInteger)corner;
- (BOOL)setPathAt:(NSUInteger)side withOwner:(Player *)owner;
- (BOOL)hasPathAt:(NSUInteger)side;
- (BOOL)hasThief;
- (void)setCorrespondingButton:(UIButton *)tile;

@end
