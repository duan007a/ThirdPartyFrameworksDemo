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
#import <objc/runtime.h>

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
    
    Class workspace = objc_getClass("CNLSApplicationWorkspace");
//    Class LSApplicationProxy_class = objc_getClass("LSApplicationProxy");
//    //获取不到成员变量
    unsigned int count = 0;
//    Ivar *members = class_copyIvarList([workspace class], &count);
//    for (int i = 0 ; i < count; i++) {
//        Ivar var = members[i];
//        const char *memberName = ivar_getName(var);
//        const char *memberType = ivar_getTypeEncoding(var);
//        NSLog(@"%s: %s",memberType,memberName);
//    }
//    
//    NSLog(@"count: %d",count);
    //获取不到有用的方法
//    count = 0;
//    Method *memberMethods = class_copyMethodList(workspace, &count);
//    for (int i = 0; i < count; i++) {
//        SEL name = method_getName(memberMethods[i]);
//        NSString *methodName = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
//        NSLog(@"member method:%@", methodName);
//    }
    
    NSLog(@"count: %d",count);
//
//    NSArray *apps = [[[workspace alloc] init] performSelector:@selector(allApplications)];
//    for (LSApplicationProxy_class  in apps) {
//        <#statements#>
//    }
//    NSLog(@"");
    unsigned int outCount;
    Class *classes = objc_copyClassList(&outCount);
    for (int i = 0; i < outCount; i++) {
        NSLog(@"%s", class_getName(classes[i]));
    }
    free(classes);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
