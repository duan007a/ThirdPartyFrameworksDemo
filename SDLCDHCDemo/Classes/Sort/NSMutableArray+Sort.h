//
//  NSMutableArray+Sort.h
//  SDLCDHCDemo
//
//  Created by runsheng on 2017/7/4.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <string.h>
#include <stdlib.h>

void bubble_sort(int arr[], int len);

void select_sort(int arr[], int len);

void insert_sort(int arr[], int len);

void fast_sort(int arr[], int left, int right);

void heap_sort(int arr[], int len);
