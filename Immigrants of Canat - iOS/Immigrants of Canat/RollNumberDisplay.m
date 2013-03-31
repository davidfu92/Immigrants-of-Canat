//
//  RollNumberDisplay.m
//  Immigrants of Canat
//
//  Created by Christopher Fretz on 3/31/13.
//  Copyright (c) 2013 Christopher Fretz. All rights reserved.
//

#import "RollNumberDisplay.h"

@implementation RollNumberDisplay

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    UIRectFill(self.bounds);
    self.backgroundColor = [UIColor clearColor];
    [path addClip];
    [[UIColor whiteColor] setFill];
    [path fill];
}

- (void)setOpaque:(BOOL)opaque {
    //do nothing
}

@end
