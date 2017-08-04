//
//  UIView+DHCSnapshot.m
//  SDLCDHCDemo
//
//  Created by runsheng on 2017/8/4.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import "UIView+DHCSnapshot.h"

@implementation UIView (DHCSnapshot)

- (UIImage *)dhc_toImage
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
