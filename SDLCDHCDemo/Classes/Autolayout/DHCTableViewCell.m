//
//  DHCTableViewCell.m
//  SDLCDHCDemo
//
//  Created by runsheng on 2017/7/31.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import "DHCTableViewCell.h"
#import <Masonry/Masonry.h>

@interface DHCTableViewCell ()

@end

@implementation DHCTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setup];
        self.contentView.backgroundColor = UIColor.purpleColor;
    }
    return self;
}

- (void)setup
{
    _nameLabel = [UILabel new];
    _nameLabel.numberOfLines = 0;
    _nameLabel.textColor = UIColor.blackColor;
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    _nameLabel.backgroundColor = UIColor.redColor;
    
    _nameLabel.preferredMaxLayoutWidth = CGRectGetWidth([UIScreen mainScreen].bounds) - 20;
    [self.contentView addSubview:_nameLabel];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(10));
        make.left.equalTo(@(10));
        make.right.equalTo(@(-10));
//        make.bottom.equalTo(@(-10));
    }];
    
    UIView *bottomLine = [UIView new];
    bottomLine.backgroundColor = UIColor.blackColor;
    [self.contentView addSubview:bottomLine];
    
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.bottom.equalTo(@(0));
        make.height.mas_equalTo(1);
    }];
    
    _icon = [UIImageView new];
    [self.contentView addSubview:_icon];
    
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.nameLabel);
        make.left.equalTo(self.nameLabel);
        make.height.mas_equalTo(100);
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(20);
        make.bottom.equalTo(bottomLine.mas_top).with.offset(-15.f);
    }];
    
    
}

- (void)test{
    self.icon.backgroundColor = UIColor.redColor;
}

- (void)setIndex:(NSInteger)index{
    if (index == 0)
    {
        [_icon mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }
    else if (index == 1)
    {
        [_icon mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(100);
        }];
    }else
    {
        [_icon mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(200);
        }];
    }
}

@end
