//
//  CatanViewController.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "CatanViewController.h"
#import "Board.h"

@interface CatanViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tileArray;

@end

@implementation CatanViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for(UIButton *button in _tileArray) {
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
