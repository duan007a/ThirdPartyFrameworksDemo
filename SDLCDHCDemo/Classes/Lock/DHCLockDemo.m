//
//  DHCLockDemo.m
//  SDLCDHCDemo
//
//  Created by runsheng on 2017/7/28.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import "DHCLockDemo.h"

@implementation DHCLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupDemo];
    }
    return self;
}

- (void)setupDemo
{
    NSLock *lock = [[NSLock alloc] init];
    lock.name = @"";
    
    dispatch_queue_t queque = dispatch_queue_create(NULL, DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queque, ^{
        [lock lock];sleep(1);
        NSLog(@"1");
        [lock unlock];
    });
    
    dispatch_async(queque, ^{
        [lock lock];
        sleep(2);
        NSLog(@"2");
        [lock unlock];
    });
}

@end
