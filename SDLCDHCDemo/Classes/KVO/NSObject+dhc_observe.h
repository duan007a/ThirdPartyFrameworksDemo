//
//  NSObject+dhc_observe.h
//  SDLCDHCDemo
//
//  Created by runsheng on 2017/7/14.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (dhc_observe)

- (void)dhc_observe:(id)observed keyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void*)context;

@end
