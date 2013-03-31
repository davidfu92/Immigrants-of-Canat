//
//  CatanViewController.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "CatanViewController.h"
#import "Board.h"
#import "Tile.h"
#import "TileModifyingViewController.h"
#import "ResourceTile.h"
#import "Dice.h"
#import "HumanPlayer.h"
#import "Settlement.h"
#import "Village.h"
#import "Metropolis.h"
#import "ResourceDeck.h"
#import "ResourceCard.h"

@interface CatanViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tileArray;

@property (strong, nonatomic) Board *board;
@property (strong, nonatomic) UIButton *segueButton;
@property (strong, nonatomic) NSInputStream *input;
@property (strong, nonatomic) NSOutputStream *output;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *rollNumbers;
@property (strong, nonatomic) ResourceDeck *stoneDeck, *livestockDeck, *clayDeck, *lumberDeck, *barleyDeck;
@property (strong, nonatomic) Dice *dice;
@property (weak, nonatomic) IBOutlet UIImageView *die1;
@property (weak, nonatomic) IBOutlet UIImageView *die2;
@property (strong, nonatomic) HumanPlayer *player;

@end

@implementation CatanViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    _dice = [[Dice alloc] init];
    
    _board = [[Board alloc] init];
    
    _stoneDeck = [[ResourceDeck alloc] initWithResource:STONE_RESOURCE];
    _barleyDeck = [[ResourceDeck alloc] initWithResource:BARLEY_RESOURCE];
    _livestockDeck = [[ResourceDeck alloc] initWithResource:LIVESTOCK_RESOURCE];
    _lumberDeck = [[ResourceDeck alloc] initWithResource:LUMBER_RESOURCE];
    _clayDeck = [[ResourceDeck alloc] initWithResource:CLAY_RESOURCE];
    
    for(UIButton *button in _tileArray) {
        NSString *identifier = [button titleForState:UIControlStateNormal];
        NSRange first = {0, 1};
        NSRange second = {1, 2};
        NSUInteger y = [[identifier substringWithRange:first] integerValue];
        NSUInteger x = [[identifier substringWithRange:second] integerValue];
        [[_board getTileAtPoint:CGPointMake(x, y)] setCorrespondingButton:button];
    }
    for(UILabel *label in _rollNumbers) {
        NSString *identifier = label.text;
        NSRange first = {0, 1};
        NSRange second = {1, 2};
        NSUInteger y = [[identifier substringWithRange:first] integerValue];
        NSUInteger x = [[identifier substringWithRange:second] integerValue];
        ResourceTile *tmpTile = (ResourceTile *)[_board getTileAtPoint:CGPointMake(x, y)];
        [tmpTile setCorrespondingLabel:label];
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"modalSegue"]) {
        TileModifyingViewController *controller = (TileModifyingViewController *)segue.destinationViewController;
        controller.sentButton = _segueButton;
        controller.board = _board;
    }
}

- (IBAction)tileWasTapped:(UIButton *)sender {
    
    _segueButton = sender;
    [self performSegueWithIdentifier:@"modalSegue" sender:self];
    
}

- (IBAction)cheat:(UIButton *)sender {
    for(NSUInteger i = 0; i < 100; i++) {
        if(i < 20) {
            [_player addResourceCard:[[ResourceCard alloc] initWithResource:BARLEY_RESOURCE]];
        } else if(i < 40) {
            [_player addResourceCard:[[ResourceCard alloc] initWithResource:LIVESTOCK_RESOURCE]];
        } else if(i < 60) {
            [_player addResourceCard:[[ResourceCard alloc] initWithResource:STONE_RESOURCE]];
        } else if(i < 80) {
            [_player addResourceCard:[[ResourceCard alloc] initWithResource:CLAY_RESOURCE]];
        } else {
            [_player addResourceCard:[[ResourceCard alloc] initWithResource:LUMBER_RESOURCE]];
        }
    }
}


- (IBAction)rollDice:(UIButton *)sender {
    CGPoint diceRoll = [_dice roll];
    NSUInteger die1Roll = diceRoll.x;
    NSUInteger die2Roll = diceRoll.y;
    NSUInteger total = die1Roll + die2Roll;
    UIImage *image;
    if(die1Roll == 1) {
        image = [UIImage imageNamed:@"die1.png"];
    } else if(die1Roll == 2) {
        image = [UIImage imageNamed:@"die2.png"];
    } else if(die1Roll == 3) {
        image = [UIImage imageNamed:@"die3.png"];
    } else if(die1Roll == 4) {
        image = [UIImage imageNamed:@"die4.png"];
    } else if(die1Roll == 5) {
        image = [UIImage imageNamed:@"die5.png"];
    } else if(die1Roll == 6) {
        image = [UIImage imageNamed:@"die6.png"];
    }
    [_die1 setImage:image];
    if(die2Roll == 1) {
        image = [UIImage imageNamed:@"die1.png"];
    } else if(die2Roll == 2) {
        image = [UIImage imageNamed:@"die2.png"];
    } else if(die2Roll == 3) {
        image = [UIImage imageNamed:@"die3.png"];
    } else if(die2Roll == 4) {
        image = [UIImage imageNamed:@"die4.png"];
    } else if(die2Roll == 5) {
        image = [UIImage imageNamed:@"die5.png"];
    } else if(die2Roll == 6) {
        image = [UIImage imageNamed:@"die6.png"];
    }
    [_die2 setImage:image];
    NSArray *tiles;
    if(total == 2) {
        tiles = [_board getTilesWithRollNumber:2];
    } else if(total == 3) {
        tiles = [_board getTilesWithRollNumber:3];
    } else if(total == 4) {
        tiles = [_board getTilesWithRollNumber:4];
    } else if(total == 5) {
        tiles = [_board getTilesWithRollNumber:5];
    } else if(total == 6) {
        tiles = [_board getTilesWithRollNumber:6];
    } else if(total == 8) {
        tiles = [_board getTilesWithRollNumber:8];
    } else if(total == 9) {
        tiles = [_board getTilesWithRollNumber:9];
    } else if(total == 10) {
        tiles = [_board getTilesWithRollNumber:10];
    } else if(total == 11) {
        tiles = [_board getTilesWithRollNumber:11];
    } else if(total == 12) {
        tiles = [_board getTilesWithRollNumber:12];
    }
    NSMutableArray *tilesToBeAdded = [[NSMutableArray alloc] init];
    for(ResourceTile *tmpTile in tiles) {
        NSArray *settlements = [tmpTile getSettlements];
        BOOL hasBeenAdded = NO;
        for(Settlement *settlement in settlements) {
            if([[settlement getOwner] isEqual:_player] && !hasBeenAdded) {
                [tilesToBeAdded addObject:tmpTile];
                hasBeenAdded = YES;
            }
        }
    }
    for(ResourceTile *tmpTile in tilesToBeAdded) {
        if([tmpTile getResourceType] == CLAY_RESOURCE) {
            [_player addResourceCard:(ResourceCard *)[_clayDeck drawCardAtIndex:0]];
        } else if([tmpTile getResourceType] == STONE_RESOURCE) {
            [_player addResourceCard:(ResourceCard *)[_stoneDeck drawCardAtIndex:0]];
        } else if([tmpTile getResourceType] == LUMBER_RESOURCE) {
            [_player addResourceCard:(ResourceCard *)[_lumberDeck drawCardAtIndex:0]];
        } else if([tmpTile getResourceType] == BARLEY_RESOURCE) {
            [_player addResourceCard:(ResourceCard *)[_barleyDeck drawCardAtIndex:0]];
        } else if([tmpTile getResourceType] == LIVESTOCK_RESOURCE) {
            [_player addResourceCard:(ResourceCard *)[_livestockDeck drawCardAtIndex:0]];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
