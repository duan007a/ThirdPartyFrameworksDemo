//
//  MasonryViewAnimTest.m
//  SDLCDHCDemo
//
//  Created by 段洪春 on 2017/7/1.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import "MasonryViewAnimTest.h"
#import <Masonry/Masonry.h>

@interface MasonryViewAnimTest ()
{
    NSInteger _testNumber;
}

@property (nonatomic, strong) UIView *animV;

@end

@implementation MasonryViewAnimTest

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    _animV = [UIView new];
    _animV.backgroundColor = [UIColor redColor];
    [self addSubview:_animV];
    
    [_animV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(5, 5));
        make.center.equalTo(self);
    }];
}

- (void)startAnimation
{
    [_animV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
    }];
    
    [UIView animateWithDuration:1.f animations:^{
        [self layoutIfNeeded];
    }];
}

@end
