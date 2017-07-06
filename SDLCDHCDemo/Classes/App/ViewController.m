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
#import <FMDB/FMDB.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    MasonryViewAnimTest *masonryAnimTestV = [[MasonryViewAnimTest alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:masonryAnimTestV];
//    masonryAnimTestV.testNumber = 10;
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [masonryAnimTestV startAnimation];
//    });

    UIImageView *testImageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, CGRectGetWidth(self.view.bounds) - 40.f, 300.f)];
    [self.view addSubview:testImageV];
    
    [testImageV sd_setImageWithURL:[NSURL URLWithString:@"http://www.fuhaodq.com/d/file/201706/16/2uucyj1vlhyvjjr2779.jpg"]];
    
    NSString *docsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *dbPath   = [docsPath stringByAppendingPathComponent:@"test.db"];
    FMDatabase *db     = [FMDatabase databaseWithPath:dbPath];
    if ([db open]) {
        NSString *sqlCreateTable =  [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' ('%@' INTEGER PRIMARY KEY AUTOINCREMENT, '%@' TEXT, '%@' INTEGER, '%@' INTEGER)",@"testTable",@"id",@"name",@"age",@"address"];
        BOOL res = [db executeUpdate:sqlCreateTable];
        if (!res) {
            NSLog(@"error when creating db table");
        } else {
            NSLog(@"success to creating db table");
        }
        [db close];
    }
    [db open];
//    [db executeUpdate:@"ALTER TABLE testTable ADD only_son BOOL"];
    
    [db executeUpdate:@"CREATE TABLE IF NOT EXISTS teacher (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)"];
    [db executeUpdate:@"DROP TABLE IF EXISTS testTable"];
    
    [db close];
    
    [db open];
    [db executeUpdate:@"ALTER TABLE teacher RENAME TO student"];
    [db close];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
