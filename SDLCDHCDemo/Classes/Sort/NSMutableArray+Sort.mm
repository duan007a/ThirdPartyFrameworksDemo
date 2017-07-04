//
//  NSMutableArray+Sort.m
//  SDLCDHCDemo
//
//  Created by runsheng on 2017/7/4.
//  Copyright © 2017年 蘑菇街. All rights reserved.
//

#import "NSMutableArray+Sort.h"

void bubble_sort(int arr[], int len)
{
    for (int i = 0; i < len - 1; i++)
    {
        for (int j = len - 1; j > i; j--)
        {
            if (arr[j] < arr[j - 1])
            {
                int temp = arr[j];
                arr[j] = arr[j - 1];
                arr[j - 1] = temp;
            }
        }
    }
}

void select_sort(int arr[], int len)
{
    for (int i = 0; i < len; i++)
    {
        int index = i;
        for (int j = i + 1; j < len; j++)
        {
            if (arr[j] < arr[index])
                index = j;
        }
        if (index != i)
        {
            int temp = arr[i];
            arr[i] = arr[index];
            arr[index] = temp;
        }
    }
}

void insert_sort(int arr[], int len)
{
    for (int i = 1; i < len; i ++)
    {
        int j = i - 1;
        int k = arr[i];
        while (j > -1 && k < arr[j] )
        {
            arr[j + 1] = arr[j];
            j --;
        }
        arr[j + 1] = k;
    }
}

void fast_sort(int arr[], int left, int right)
{
    if (left < right)
    {
        int i = left, j = right, target = arr[left];
        while (i < j)
        {
            while (i < j && arr[j] > target)
                j--;
            if (i < j)
                arr[i++] = arr[j];
            
            while (i < j && arr[i] < target)
                i++;
            if (i < j)
                arr[j] = arr[i];
        }
        arr[i] = target;
        fast_sort(arr, left, i - 1);
        fast_sort(arr, i + 1, right);
    }
}

/**
 * 将数组arr构建大根堆
 * @param arr 待调整的数组
 * @param i   待调整的数组元素的下标
 * @param len 数组的长度
 */
void heap_adjust(int arr[], int i, int len)
{
    int child;
    int temp;
    
    for (; 2 * i + 1 < len; i = child)
    {
        child = 2 * i + 1;  // 子结点的位置 = 2 * 父结点的位置 + 1
        // 得到子结点中键值较大的结点
        if (child < len - 1 && arr[child + 1] > arr[child])
            child ++;
        // 如果较大的子结点大于父结点那么把较大的子结点往上移动，替换它的父结点
        if (arr[i] < arr[child])
        {
            temp = arr[i];
            arr[i] = arr[child];
            arr[child] = temp;
        }
        else
            break;
    }
}

/**
 * 堆排序算法
 */
void heap_sort(int arr[], int len)
{
    int i;
    // 调整序列的前半部分元素，调整完之后第一个元素是序列的最大的元素
    for (int i = len / 2 - 1; i >= 0; i--)
    {
        heap_adjust(arr, i, len);
    }
    
    for (i = len - 1; i > 0; i--)
    {
        // 将第1个元素与当前最后一个元素交换，保证当前的最后一个位置的元素都是现在的这个序列中最大的
        int temp = arr[0];
        arr[0] = arr[i];
        arr[i] = temp;
        // 不断缩小调整heap的范围，每一次调整完毕保证第一个元素是当前序列的最大值
        heap_adjust(arr, 0, i);
    }
}
