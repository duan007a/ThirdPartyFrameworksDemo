//
//  DHCNotificationCenter.m
//  SDLCDHCDemo
//
//  Created by 段洪春 on 2017/7/25.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import "DHCNotificationCenter.h"

@interface DHCNotificationCenter (){
    NSMutableDictionary *mapTable1;
    NSMutableDictionary *mapTable2;
}

@end

@implementation DHCNotificationCenter

+ (instancetype)defaultCenter
{
//    NSNotificationCenter
    static DHCNotificationCenter *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[DHCNotificationCenter alloc] init];
    });
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        mapTable1 = [NSMutableDictionary dictionary];
        mapTable2 = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(nullable NSNotificationName)aName object:(nullable id)anObject
{
    if (!observer || !aSelector) {
        return;
    }
    
    NSString *firstValue = [NSString stringWithFormat:@"%p_%@",observer,NSStringFromSelector(aSelector)];
    
    NSMutableSet *mutableSet = [mapTable1 objectForKey:aName];
    if (!mutableSet) {
        mutableSet = [NSMutableSet set];
    }
    [mutableSet addObject:firstValue];
    [mapTable1 setObject:mutableSet forKey:aName];
    [mapTable2 setObject:observer forKey:firstValue];
}

- (void)postNotification:(NSNotification *)notification
{
    NSMutableSet *mutableSet = [mapTable1 objectForKey:notification.name];
    for (NSString *firstValue in mutableSet) {
        NSRange _range = [firstValue rangeOfString:@"_"];
        SEL selector = NSSelectorFromString([firstValue substringFromIndex:NSMaxRange(_range)]);
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        
        [[mapTable2 objectForKey:firstValue] performSelector:selector withObject:notification.object];
        
#pragma clang diagnostic pop
    }
}

- (void)removeObserver:(id)observer
{
    NSArray *keys = [mapTable2 allKeysForObject:observer];
    NSArray *values = [mapTable1 allValues];
    for (NSString *firstValue in keys) {
        [mapTable2 removeObjectForKey:firstValue];
        for (NSMutableSet *set in values) {
            [set removeObject:firstValue];
        }
    }
}

- (void)removeObserver:(id)observer name:(nullable NSNotificationName)aName object:(nullable id)anObject
{
    NSArray *keys = [mapTable2 allKeysForObject:observer];
    NSMutableSet *allKeys = [NSMutableSet setWithArray:keys];
    NSMutableSet *mutableSet = [mapTable1 objectForKey:aName];
    [allKeys intersectSet:mutableSet];
    for (NSString *key in allKeys) {
        [mapTable2 removeObjectForKey:key];
        [mutableSet removeObject:key];
    }
}

@end
