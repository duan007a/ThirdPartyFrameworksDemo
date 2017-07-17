//
//  KVOTest.m
//  SDLCDHCDemo
//
//  Created by runsheng on 2017/7/14.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import "KVOTest.h"
#import <objc/runtime.h>
#import "NSObject+dhc_observe.h"

@implementation KVOTest

- (instancetype)init
{
    self = [super init];
    if (self) {
        _kvoValue = 10;
    }
    return self;
}

- (void)testForKVO
{
    [self printDebugInfo];
//    [self addObserver:self forKeyPath:@"kvoValue" options:NSKeyValueObservingOptionNew context:nil];
    [self dhc_observe:self keyPath:@"kvoValue" options:NSKeyValueObservingOptionNew context:nil];
    [self printDebugInfo];
//    [self removeObserver:self forKeyPath:@"kvoValue"];
//    [self printDebugInfo];
}

- (void)printDebugInfo
{
    Class class = object_getClass((id)self);
    Class superClass = class_getSuperclass(class);
    IMP methodImp = class_getMethodImplementation(class, @selector(setKvoValue:));
    NSLog(@"isa:%@,superClass:%@,kvoValue setter function pointer:%p",class,superClass,methodImp);
}

- (void)setKvoValue:(NSInteger)kvoValue
{
    _kvoValue = kvoValue;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    
}

- (void)dealloc
{
//    [self removeObserver:self forKeyPath:@"kvoValue"];
}

@end
