//
//  ViewA.m
//  SDLCDHCDemo
//
//  Created by runsheng on 2017/8/15.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import "ViewA.h"
#import "ViewB.h"

@implementation ViewA

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    ViewB *viewB = [[ViewB alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    viewB.backgroundColor = UIColor.redColor;
    [self addSubview:viewB];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect unionRect = CGRectMake(0, 0, 100, 30);
    if (self.alpha > 0.01 && self.userInteractionEnabled && (CGRectContainsPoint(self.bounds, point) || CGRectContainsPoint(unionRect, point)))
    {
        return YES;
    }
    return NO;
}

@end
