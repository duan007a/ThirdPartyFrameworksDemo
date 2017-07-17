//
//  MasonryViewAnimTest.h
//  SDLCDHCDemo
//
//  Created by 段洪春 on 2017/7/1.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProtocolTest <NSObject>

@property (nonatomic, assign) NSInteger testNumber;

@end

@interface MasonryViewAnimTest : UIView<ProtocolTest>

@property (nonatomic, assign) NSInteger kvoValue;

- (void)startAnimation;

@end
