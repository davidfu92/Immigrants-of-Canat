//
//  Card.h
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/28/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

- (NSUInteger)getType;
- (void)setVisibleTile:(UIButton *)tile;

@end
