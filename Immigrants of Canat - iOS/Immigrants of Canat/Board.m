//
//  Board.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "Board.h"
#import "OceanTile.h"
#import "ResourceTile.h"
#import "ResourceCard.h"

@interface Board()

@property (strong, nonatomic) NSMutableArray *board;

@end

@implementation Board

- (id)init {
    
    self = [super init];
    
    if(self) {
        _board = [[NSMutableArray alloc] init];
        for(NSUInteger i = 0; i < 9; i++) {
            [_board addObject:[[NSMutableArray alloc] init]];
        }
        NSUInteger xMax = 5;
        NSUInteger yCounter = 0;
        BOOL hasPassedMiddle = NO;
        while(yCounter < 9) {
            for(NSUInteger i = 0; i < xMax; i++) {
                if(yCounter == 0 || yCounter == 8) {
                    [[_board objectAtIndex:yCounter] addObject:[[Tile alloc] init]];
                } else if(yCounter == 1 || yCounter == 7){
                    if(i == 0 || i == xMax - 1) {
                        [[_board objectAtIndex:yCounter] addObject:[[Tile alloc] init]];
                    } else {
                        NSUInteger random = arc4random_uniform(2);
                        if(random == 1) {
                            [[_board objectAtIndex:yCounter] addObject:[[OceanTile alloc] initWithLocation:CGPointMake(i, yCounter) andPortStatus:YES]];
                        } else {
                            [[_board objectAtIndex:yCounter] addObject:[[OceanTile alloc] initWithLocation:CGPointMake(i, yCounter) andPortStatus:NO]];
                        }
                    }
                } else {
                    if(i == 0 || i == xMax - 1) {
                        [[_board objectAtIndex:yCounter] addObject:[[Tile alloc] init]];
                    } else if(i == 1 || i == xMax - 2) {
                        NSUInteger random = arc4random_uniform(2);
                        if(random == 1) {
                            [[_board objectAtIndex:yCounter] addObject:[[OceanTile alloc] initWithLocation:CGPointMake(i, yCounter) andPortStatus:YES]];
                        } else {
                            [[_board objectAtIndex:yCounter] addObject:[[OceanTile alloc] initWithLocation:CGPointMake(i, yCounter) andPortStatus:NO]];
                        }
                    } else {
                        NSUInteger random = arc4random_uniform(5);
                        NSUInteger rollNumber = arc4random_uniform(13);
                        while(rollNumber < 2 || rollNumber == 7) {
                            rollNumber = arc4random_uniform(13);
                        }
                        NSUInteger resource;
                        if(random == 0) {
                            resource = STONE_RESOURCE;
                        } else if(random == 1) {
                            resource = CLAY_RESOURCE;
                        } else if(random == 2) {
                            resource = LUMBER_RESOURCE;
                        } else if(random == 3) {
                            resource = BARLEY_RESOURCE;
                        } else {
                            resource = LIVESTOCK_RESOURCE;
                        }
                        [[_board objectAtIndex:yCounter] addObject:[[ResourceTile alloc] initWithResourceType:resource andLocation:CGPointMake(i, yCounter) andRollNumber:rollNumber]];
                    }
                }
            }
            yCounter++;
            if(xMax == 9) {
                hasPassedMiddle = YES;
            }
            if(hasPassedMiddle) {
                xMax--;
            } else {
                xMax++;
            }
        }
        xMax = 6;
        yCounter = 1;
        hasPassedMiddle = NO;
        while(yCounter < 8) {
            for(NSUInteger i = 1; i < xMax - 1; i++) {
                if(yCounter < 4) {
                    [[[_board objectAtIndex:yCounter] objectAtIndex:i] setSurroundingTiles:@[[[_board objectAtIndex:yCounter - 1] objectAtIndex:i - 1], [[_board objectAtIndex:yCounter - 1] objectAtIndex:i], [[_board objectAtIndex:yCounter] objectAtIndex:i - 1], [[_board objectAtIndex:yCounter] objectAtIndex:i + 1], [[_board objectAtIndex:yCounter + 1] objectAtIndex:i], [[_board objectAtIndex:yCounter + 1] objectAtIndex:i + 1]]];
                } else if(yCounter == 4) {
                    [[[_board objectAtIndex:yCounter] objectAtIndex:i] setSurroundingTiles:@[[[_board objectAtIndex:yCounter - 1] objectAtIndex:i - 1], [[_board objectAtIndex:yCounter - 1] objectAtIndex:i], [[_board objectAtIndex:yCounter] objectAtIndex:i - 1], [[_board objectAtIndex:yCounter] objectAtIndex:i + 1], [[_board objectAtIndex:yCounter + 1] objectAtIndex:i - 1], [[_board objectAtIndex:yCounter + 1] objectAtIndex:i]]];
                } else {
                    [[[_board objectAtIndex:yCounter] objectAtIndex:i] setSurroundingTiles:@[[[_board objectAtIndex:yCounter - 1] objectAtIndex:i], [[_board objectAtIndex:yCounter - 1] objectAtIndex:i + 1], [[_board objectAtIndex:yCounter] objectAtIndex:i - 1], [[_board objectAtIndex:yCounter] objectAtIndex:i + 1], [[_board objectAtIndex:yCounter + 1] objectAtIndex:i - 1], [[_board objectAtIndex:yCounter + 1] objectAtIndex:i]]];
                }
            }
            yCounter++;
            if(xMax == 9) {
                hasPassedMiddle = YES;
            }
            if(hasPassedMiddle) {
                xMax--;
            } else {
                xMax++;
            }
        }
        
    }
    
    return self;
    
}

- (Tile *)getTileAtX:(NSUInteger)xpos Y:(NSUInteger)ypos {
    return [[_board objectAtIndex:ypos] objectAtIndex:xpos];
}

@end
