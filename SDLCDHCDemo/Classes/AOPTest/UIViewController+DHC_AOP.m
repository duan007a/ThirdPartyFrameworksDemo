//
//  UIViewController+DHC_AOP.m
//  SDLCDHCDemo
//
//  Created by 段洪春 on 2017/7/1.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import "UIViewController+DHC_AOP.h"
#import <Aspects/Aspects.h>

@implementation UIViewController (DHC_AOP)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self aspect_hookSelector:@selector(viewDidAppear:) withOptions:AspectPositionAfter usingBlock:^(id instance, NSArray *args) {
            NSLog(@"[UIViewController viewDidAppear:] has been swizzled");
        } error:nil];
    });
}

@end
