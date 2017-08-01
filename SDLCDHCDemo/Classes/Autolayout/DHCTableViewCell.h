//
//  DHCTableViewCell.h
//  SDLCDHCDemo
//
//  Created by runsheng on 2017/7/31.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHCTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, assign) NSInteger index;

- (void)test;

@end
