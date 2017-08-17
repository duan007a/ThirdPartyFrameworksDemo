//
//  DHCRunLoopDemo.m
//  SDLCDHCDemo
//
//  Created by runsheng on 2017/8/7.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import "DHCRunLoopDemo.h"

@interface DHCRunLoopDemo ()
{
    NSTimeInterval p_interval;
}

@property (nonatomic, strong) NSThread *thread;

@end

@implementation DHCRunLoopDemo

- (void)testDemo1
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"线程开始");
        //获取到当前线程
        self.thread = [NSThread currentThread];
        
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        //添加一个Port，同理为了防止runloop没事干直接退出
        [runloop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        
        //运行一个runloop，[NSDate distantFuture]：很久很久以后才让它失效
        [runloop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        
        NSLog(@"线程结束");
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //在我们开启的异步线程调用方法
        [self performSelector:@selector(recieveMsg) onThread:self.thread withObject:nil waitUntilDone:NO];
    });
}

- (void)recieveMsg
{
    NSLog(@"收到消息了，在这个线程：%@",[NSThread currentThread]);
}

- (void)dealloc
{
    
}

@end
