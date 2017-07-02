//
//  ViewController.m
//  SDLCDHCDemo
//
//  Created by 段洪春 on 2017/7/1.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import "ViewController.h"
#import "MasonryViewAnimTest.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
    MasonryViewAnimTest *masonryAnimTestV = [[MasonryViewAnimTest alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:masonryAnimTestV];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [masonryAnimTestV startAnimation];
    });
     */
    UIImageView *testImageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, CGRectGetWidth(self.view.bounds) - 40.f, 400.f)];
    [self.view addSubview:testImageV];
    
    [testImageV sd_setImageWithURL:[NSURL URLWithString:@"http://www.fuhaodq.com/d/file/201706/16/2uucyj1vlhyvjjr2779.jpg"]];
    
    kCFRunLoopDefaultMode
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
