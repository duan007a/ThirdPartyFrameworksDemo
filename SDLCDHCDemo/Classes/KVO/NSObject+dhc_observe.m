//
//  NSObject+dhc_observe.m
//  SDLCDHCDemo
//
//  Created by runsheng on 2017/7/14.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import "NSObject+dhc_observe.h"
#import <objc/runtime.h>
#import <objc/message.h>

static void defaultImpForSetterMethod(id self,SEL _cmd,void* value)
{
    NSString *selectorName = NSStringFromSelector(_cmd);
    NSRange prefix = [selectorName rangeOfString:@"set"];
    if (prefix.location != NSNotFound)
    {
        NSUInteger location = NSMaxRange(prefix);
        NSString *key = [selectorName substringFromIndex:location];
        key = [[key substringWithRange:NSMakeRange(0, key.length - 1)] lowercaseString];
        [self willChangeValueForKey:key];
        Class subCls = object_getClass(self);
        Class supCls = class_getSuperclass(subCls);
        struct objc_super superInfo = {
            self,
            supCls
        };
        ((void (*) (void * , SEL, ...))objc_msgSendSuper)(&superInfo, _cmd, value);
        
        [self didChangeValueForKey:key];
    }
}

@implementation NSObject (dhc_observe)

- (void)dhc_observe:(id)observed keyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void*)context
{
    // isa swizzling implementation
    NSString *subClassName = [NSString stringWithFormat:@"dhc_KVONotifying_%@",[self class]];
    NSString *setterName = [NSString stringWithFormat:@"set%@%@:",[[keyPath substringToIndex:1] uppercaseString],[keyPath substringFromIndex:1]];
    Class subCls = objc_allocateClassPair(object_getClass(self), [subClassName UTF8String], 0);
    class_addMethod(subCls, NSSelectorFromString(setterName), (IMP)defaultImpForSetterMethod, "v@:@");
    objc_registerClassPair(subCls);
    object_setClass(self, subCls);
}

@end
