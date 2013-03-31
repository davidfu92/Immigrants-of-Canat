//
//  TileModifyingViewController.h
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/31/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ResourceTile;
@class OceanTile;
@class Board;
@class HumanPlayer;

@interface TileModifyingViewController : UIViewController

@property (strong, nonatomic) UIButton *sentButton;
@property (strong, nonatomic) Board *board;
@property (strong, nonatomic) HumanPlayer *player;
@property (strong, nonatomic) NSArray *resourceDecks;

@end
