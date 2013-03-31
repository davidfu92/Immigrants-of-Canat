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
@property (nonatomic) NSUInteger portType;
@property (nonatomic) CGPoint location;
@property (strong, nonatomic) UIButton *correspondingTile;

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

- (void)setCorrespondingButton:(UIButton *)tile {
    _correspondingTile = tile;
    UIImage *tileImage;
    if(_isPort) {
        if(_portType == ORE_PORT) {
            tileImage = [UIImage imageNamed:@"oreport.png"];
        } else if(_portType == WHEAT_PORT) {
            tileImage = [UIImage imageNamed:@"wheatport.png"];
        } else if(_portType == BRICK_PORT) {
            tileImage = [UIImage imageNamed:@"brickport.png"];
        } else if(_portType == SHEEP_PORT) {
            tileImage = [UIImage imageNamed:@"sheepport.png"];
        } else if(_portType == WOOD_PORT) {
            tileImage = [UIImage imageNamed:@"woodport.png"];
        } else if(_portType == GENERIC_PORT) {
            tileImage = [UIImage imageNamed:@"genericport.png"];
        }
        [_correspondingTile setImage:tileImage forState:UIControlStateNormal];
    } else {
        tileImage = [UIImage imageNamed:@"oceantile.png"];
        [_correspondingTile setImage:tileImage forState:UIControlStateNormal];
    }
}

- (void)setPortType:(NSUInteger)type {
    if(_isPort) {
        _portType = type;
    }
}

- (BOOL)isPortTile {
    return _isPort;
}

@end
