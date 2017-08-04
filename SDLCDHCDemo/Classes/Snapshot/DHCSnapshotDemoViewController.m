//
//  DHCSnapshotDemoViewController.m
//  SDLCDHCDemo
//
//  Created by runsheng on 2017/8/4.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import "DHCSnapshotDemoViewController.h"
#import <Masonry/Masonry.h>
#import "UIView+DHCSnapshot.m"

@interface DHCSnapshotDemoViewController ()

@end

@implementation DHCSnapshotDemoViewController

- (void)loadView
{
    self.view = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    UILabel *pLabel = [[UILabel alloc] init];
    pLabel.text = @"这是截屏的开始";
    pLabel.textColor = UIColor.blackColor;
    pLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:pLabel];
    [pLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_greaterThanOrEqualTo(1);
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 100, 40);
    [btn setTitle:@"生成图片" forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UILabel *pLabel1 = [[UILabel alloc] init];
    pLabel1.text = @"这是截屏的结束";
    pLabel1.textColor = UIColor.blackColor;
    pLabel1.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:pLabel1];
    pLabel1.frame = CGRectMake(0, 700, 375, 40);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 740);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)share:(UIButton *)button
{
    UIImage *image = [self.view dhc_toImage];
    NSLog(@"%@",image);
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image
didFinishSavingWithError:(NSError *)error
  contextInfo:(void *)contextInfo
{
    
}

@end
