//
//  ViewB.m
//  SDLCDHCDemo
//
//  Created by runsheng on 2017/8/15.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import "ViewB.h"

@implementation ViewB

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if (CGRectContainsPoint(self.bounds, point) && self.alpha > 0.01 && self.hidden == NO && self.userInteractionEnabled)
    {
        return YES;
    }
    return NO;
}

@end
