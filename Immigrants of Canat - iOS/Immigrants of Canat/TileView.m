//
//  TileView.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/29/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "TileView.h"

@implementation TileView

- (void)setup {
    [self setNeedsDisplay];
}

- (void)awakeFromNib {
    
    [self setup];
    
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self setup];
    
    return self;
}


- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint start = CGPointMake(0, self.bounds.size.height / 4);
    [path moveToPoint:start];
    CGPoint next = CGPointMake(self.bounds.size.width / 4, 0);
    [path addLineToPoint:next];
    [path stroke];
}


@end
