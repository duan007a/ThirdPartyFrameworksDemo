//
//  DHCNotificationCenter.h
//  SDLCDHCDemo
//
//  Created by 段洪春 on 2017/7/25.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DHCNotificationCenter : NSObject

+ (instancetype)defaultCenter;

- (void)addObserver:(id)observer selector:(nonnull SEL)aSelector name:(nullable NSNotificationName)aName object:(nullable id)anObject;
- (void)postNotification:(NSNotification *)notification;
- (void)removeObserver:(id)observer;
- (void)removeObserver:(id)observer name:(nullable NSNotificationName)aName object:(nullable id)anObject;

@end

NS_ASSUME_NONNULL_END
