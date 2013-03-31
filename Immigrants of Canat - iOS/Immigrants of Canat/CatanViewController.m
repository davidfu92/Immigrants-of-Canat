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

@interface CatanViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tileArray;
@property (strong, nonatomic) Board *board;

@end

@implementation CatanViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _board = [[Board alloc] init];
    
    for(UIButton *button in _tileArray) {
        NSString *identifier = [button titleForState:UIControlStateNormal];
        NSRange first = {0, 1};
        NSRange second = {1, 2};
        NSUInteger y = [[identifier substringWithRange:first] integerValue];
        NSUInteger x = [[identifier substringWithRange:second] integerValue];
        [[_board getTileAtPoint:CGPointMake(x, y)] setCorrespondingButton:button];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
