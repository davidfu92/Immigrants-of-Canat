//
//  TileModifyingViewController.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/31/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "TileModifyingViewController.h"
#import "ResourceTile.h"
#import "Board.h"
#import "ResourceCard.h"
#import "OceanTile.h"

@interface TileModifyingViewController ()

@property (weak, nonatomic) IBOutlet UIButton *centerButton;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *surroundingButtons;

@end

@implementation TileModifyingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void)viewWillAppear:(BOOL)animated {
    NSString *identifier = [_sentButton titleForState:UIControlStateNormal];
    NSRange first = {0, 1};
    NSRange second = {1, 2};
    NSUInteger y = [[identifier substringWithRange:first] integerValue];
    NSUInteger x = [[identifier substringWithRange:second] integerValue];
    ResourceTile *tile = (ResourceTile *)[_board getTileAtPoint:CGPointMake(x, y)];
    [tile setBigTile:_centerButton];
    NSUInteger resource = [tile getResourceType];
    UIImage *image;
    if(resource == STONE_RESOURCE) {
        image = [UIImage imageNamed:@"stonetile.png"];
    } else if(resource == LUMBER_RESOURCE) {
        image = [UIImage imageNamed:@"woodtile.png"];
    } else if(resource == CLAY_RESOURCE) {
        image = [UIImage imageNamed:@"bricktile.png"];
    } else if(resource == LIVESTOCK_RESOURCE) {
        image = [UIImage imageNamed:@"sheeptile.png"];
    } else if(resource == BARLEY_RESOURCE) {
        image = [UIImage imageNamed:@"wheattile.png"];
    } else if(resource == NORESOURCE) {
        image = [UIImage imageNamed:@"desert.png"];
    }
    [_centerButton setImage:image forState:UIControlStateNormal];
    NSArray *surroundingTiles = [tile getSurroundingTiles];
    for(UIButton *button in _surroundingButtons) {
        NSUInteger buttonNumber = [[button titleForState:UIControlStateNormal] integerValue];
        Tile *tmpTile = [surroundingTiles objectAtIndex:buttonNumber - 1];
        if([tmpTile isMemberOfClass:[ResourceTile class]]) {
            ResourceTile *newTile = (ResourceTile *)tmpTile;
            resource = [newTile getResourceType];
            if(resource == STONE_RESOURCE) {
                image = [UIImage imageNamed:@"stonetile.png"];
            } else if(resource == BARLEY_RESOURCE) {
                image = [UIImage imageNamed:@"wheattile.png"];
            } else if(resource == LIVESTOCK_RESOURCE) {
                image = [UIImage imageNamed:@"sheeptile.png"];
            } else if(resource == LUMBER_RESOURCE) {
                image = [UIImage imageNamed:@"woodtile.png"];
            } else if(resource == CLAY_RESOURCE) {
                image = [UIImage imageNamed:@"bricktile.png"];
            } else if(resource == NORESOURCE) {
                image = [UIImage imageNamed:@"desert.png"];
            }
        } else {
            OceanTile *newTile = (OceanTile *)tmpTile;
            if([newTile isPortTile]) {
                NSUInteger portType = [newTile getPortType];
                if(portType == ORE_PORT) {
                    image = [UIImage imageNamed:@"oreport.png"];
                } else if(portType == BRICK_PORT) {
                    image = [UIImage imageNamed:@"brickport.png"];
                } else if(portType == WHEAT_PORT) {
                    image = [UIImage imageNamed:@"wheatport.png"];
                } else if(portType == SHEEP_PORT) {
                    image = [UIImage imageNamed:@"sheepport.png"];
                } else if(portType == WOOD_PORT) {
                    image = [UIImage imageNamed:@"woodport.png"];
                }
            } else {
                image = [UIImage imageNamed:@"oceantile.png"];
            }
        }
        [button setImage:image forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end