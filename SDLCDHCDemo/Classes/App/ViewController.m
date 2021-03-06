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
#import <Masonry/Masonry.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import "MyViewController.h"
#import "KVOTest.h"
#import "DHCNotificationCenter.h"
#import "DHCLockDemo.h"
#import "DHCTableViewCell.h"
#import <UITableView+FDTemplateLayoutCell/UITableView+FDTemplateLayoutCell.h>
#import "DHCRunLoopDemo.h"
#import "NSObject+dhc_observe.h"
#import "ViewA.h"

@interface ViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UIStackView *containerView;
}

@property (nonatomic, strong) KVOTest *kvoTest;

@end

static void testForRunLoopMethod()
{
    
}

@implementation ViewController

+(void)load
{
    Class klass = NSClassFromString(@"NSNotificationCenter");
//    Method targetMethod = class_getInstanceMethod(klass, @selector(viewDidAppear:));
//    Method destMethod = class_getInstanceMethod(klass, @selector(customViewDidAppear:));
//    IMP targetMethodIMP = method_getImplementation(targetMethod);
//    IMP destMethodIMP = method_getImplementation(destMethod);
//    if (targetMethodIMP != _objc_msgForward)
//    {
//        BOOL isExist = class_addMethod(klass, @selector(viewDidAppear:), destMethodIMP, method_getTypeEncoding(destMethod));
//        if (!isExist)
//        {
//            method_exchangeImplementations(destMethod, targetMethod);
//        }
//    }
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList(klass, &outCount);
    for (unsigned int index = 0; index < outCount; index++)
    {
        Ivar ivar = ivars[index];
        const char *ivar_name = ivar_getName(ivar);
        const char *ivar_type = ivar_getTypeEncoding(ivar);
        printf("%s,%s\n",ivar_name,ivar_type);
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"OriginalViewDidAppear has been defined");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    /*
    BOOL res1 = [[NSObject class] isKindOfClass:[NSObject class]];
    BOOL res2 = [[NSObject class] isMemberOfClass:[NSObject class]];
    BOOL res3 = [[ViewController class] isKindOfClass:[ViewController class]];
    BOOL res4 = [[ViewController class] isMemberOfClass:[ViewController class]];
    
    NSLog(@"%d,%d,%d,%d",res1,res2,res3,res4);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"打开新页面" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(100, 100, 200, 30);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
     */
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
//    [self testForStackView];
//    [self testForMasonry];
//    [self testForMasonryAnimation];
//    [self testForSDWebImage];
//    [self testForSQLite];
//    [self testForKVO];
//    [self testForSet];
//    [self testForNotificationCenter];
//    [self testForLock];
//    [self testForCellAutolayout];
//    [self testForGCD];
//    [self testForRunloop];
    [self testForEventHandlingAndResponderChains];
}

- (void)btnClicked:(id)sender
{
    MyViewController *mvc = [MyViewController new];
    [self presentViewController:mvc animated:YES completion:nil];
}

- (void)customViewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"customViewDidAppear has been involked!");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testForCategory
{
    Class klass = NSClassFromString(@"NSString");
    
    unsigned int methodCount = 0;
    Method *methods = class_copyMethodList(klass, &methodCount);
    for (int i = 0; i < methodCount; ++i)
    {
        Method method = methods[i];
        SEL methodSEL = method_getName(method);
        NSLog(@"%@",NSStringFromSelector(methodSEL));
    }
}

- (void)testForStackView{
    CGFloat SCREEN_WIDTH = CGRectGetWidth([UIScreen mainScreen].bounds);
    containerView = [[UIStackView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 200)];
    containerView.axis = UILayoutConstraintAxisHorizontal;
    containerView.distribution = UIStackViewDistributionFillEqually;
    containerView.spacing = 100;
    containerView.alignment = UIStackViewAlignmentFill;
    
    for (NSInteger i = 0; i < 4; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithRed:random()%256/255.0 green:random()%256/255.0 blue:random()%256/255.0 alpha:1];
        [containerView addArrangedSubview:view];
    }
    
    [self.view addSubview:containerView];
}

- (void)testForMasonry{
    NSMutableArray<UIView *> *views = [NSMutableArray array];
    for (NSInteger index = 0; index < 3; index++)
    {
        [views addObject:[UIView new]];
        views[index].backgroundColor = UIColor.redColor;
        [self.view addSubview:views[index]];
    }
    
    CGFloat itemLength = 80;
    CGFloat SCREEN_WIDTH = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat padding = (SCREEN_WIDTH - itemLength * 3) / 4;
    
    // 1.固定item尺寸
//    [views mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:itemLength leadSpacing:padding tailSpacing:padding];
//    [views mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(60.f);
//        make.height.mas_equalTo(views[0].mas_width);
//    }];
    
    // 2.固定间隔
    [views mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:80 tailSpacing:80];
    [views mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(60);
        make.height.equalTo(views[0].mas_width);
    }];
}

- (void)testForMasonryAnimation
{
    MasonryViewAnimTest *masonryAnimTestV = [[MasonryViewAnimTest alloc] initWithFrame:self.view.bounds];
    id hihao = [masonryAnimTestV valueForKey:@"hihao"];
    NSLog(@"%@",hihao);
    [self.view addSubview:masonryAnimTestV];
    masonryAnimTestV.testNumber = 10;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [masonryAnimTestV startAnimation];
    });
    
    Class originClass = object_getClass(masonryAnimTestV);
    
    [masonryAnimTestV addObserver:self forKeyPath:@"kvoValue" options:NSKeyValueObservingOptionNew context:nil];
    Class intermediateClass = object_getClass(masonryAnimTestV);
}

- (void)testForSDWebImage{
    UIImageView *testImageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, CGRectGetWidth(self.view.bounds) - 40.f, 300.f)];
    [self.view addSubview:testImageV];
    
    [testImageV sd_setImageWithURL:[NSURL URLWithString:@"http://www.fuhaodq.com/d/file/201706/16/2uucyj1vlhyvjjr2779.jpg"]];
    
    NSURL *imageURL1 = [NSURL URLWithString:@"http://www.fuhaodq.com/d/file/201706/16/2uucyj1vlhyvjjr2779.jpg"];
    NSURL *imageURL2 = [NSURL URLWithString:@"http://img.zcool.cn/community/018a97577cb81e0000018c1b08b395.gif"];
    
    testImageV.animationDuration = 5.f;
    [testImageV sd_setAnimationImagesWithURLs:@[imageURL1,imageURL2]];
}

- (void)testForSQLite{
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
    [db executeUpdate:@"ALTER TABLE testTable ADD only_son BOOL"];
    
    [db executeUpdate:@"CREATE TABLE IF NOT EXISTS teacher (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)"];
    [db executeUpdate:@"DROP TABLE IF EXISTS testTable"];
    
    [db close];
    
    [db open];
    [db executeUpdate:@"ALTER TABLE teacher RENAME TO student"];
    [db close];
}

- (void)testForKVO
{
    _kvoTest = [KVOTest new];
//    [_kvoTest testForKVO];
    
    [self dhc_observe:_kvoTest keyPath:@"kvoValue" options:NSKeyValueObservingOptionNew context:nil];
    
    [_kvoTest setKvoValue:100];
    
//    [[UIApplication sharedApplication] setAlternateIconName:@"newIcon.png" completionHandler:^(NSError * _Nullable error) {
//        NSLog(@"%@",error.description);
//    }];
}

- (void)testForSet
{
    NSMutableSet *testSet = [NSMutableSet set];
    
    MasonryViewAnimTest *testV1 = [MasonryViewAnimTest new];
    testV1.testNumber = 10;
    
    MasonryViewAnimTest *testV2 = [MasonryViewAnimTest new];
    testV2.testNumber = 10;
    
    MasonryViewAnimTest *testV3 = [MasonryViewAnimTest new];
    testV3.testNumber = 10;
    
    [testSet addObject:testV1];
    [testSet addObject:testV2];
    [testSet addObject:testV3];
}

- (void)testForNotificationCenter
{
    [[DHCNotificationCenter defaultCenter] addObserver:self selector:@selector(testForKVO) name:@"testForNotificationCenter" object:nil];
    [[DHCNotificationCenter defaultCenter] addObserver:self selector:@selector(testForSQLite) name:@"anotherTestForNotificationCenter" object:nil];
    [[DHCNotificationCenter defaultCenter] addObserver:self selector:@selector(testForSet) name:@"testForNotificationCenter" object:nil];
    
    [[DHCNotificationCenter defaultCenter] postNotification:[[NSNotification alloc] initWithName:@"testForNotificationCenter" object:nil userInfo:nil]];
    
    [[DHCNotificationCenter defaultCenter] removeObserver:self name:@"testForNotificationCenter" object:nil];
    
    [[DHCNotificationCenter defaultCenter] removeObserver:self];
}

- (void)testForLock
{
    DHCLockDemo *lockDemo = [[DHCLockDemo alloc] init];
}

- (void)testForCellAutolayout
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 80;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView registerClass:[DHCTableViewCell class] forCellReuseIdentifier:@"DHCTableViewCell"];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DHCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DHCTableViewCell" forIndexPath:indexPath];
    cell.nameLabel.text = @"apsodijaposdjq[w0ejfqw0ijvas;dlcmxasijvav;lamscoiajsdvas;ldmvasdkvjas[odijvmals;dvmasdjieorvma;lksdvmapoerjgiorqewgvmal;sdkvmaso;dvjoewrpvals;kdvmas;ovjieaowprvasl;kdvmas;odivjawerj";
    cell.index = indexPath.row;
    [cell test];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:@"DHCTableViewCell" configuration:^(DHCTableViewCell *cell) {
        cell.nameLabel.text = @"apsodijaposdjq[w0ejfqw0ijvas;dlcmxasijvav;lamscoiajsdvas;ldmvasdkvjas[odijvmals;dvmasdjieorvma;lksdvmapoerjgiorqewgvmal;sdkvmaso;dvjoewrpvals;kdvmas;ovjieaowprvasl;kdvmas;odivjawerj";
        cell.index = indexPath.row;
        [cell test];
    }];
}

- (void)testForGCD
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (int i = 0; i < 10; i++)
    {
        long value = dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"value:%ld",value);
        dispatch_group_async(group, queue, ^{
            NSLog(@"%i",i);
            sleep(1);
            dispatch_semaphore_signal(semaphore);
        });
    }
    long Iret = dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"Iret:%ld",Iret);
}

- (void)testForRunloop
{
    DHCRunLoopDemo *demo = [DHCRunLoopDemo new];
    [demo testDemo1];
    
//    CFRunLoopAddObserver(<#CFRunLoopRef rl#>, <#CFRunLoopObserverRef observer#>, <#CFRunLoopMode mode#>)
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    
}

- (void)testForEventHandlingAndResponderChains
{
    ViewA *viewA = [[ViewA alloc] initWithFrame:CGRectMake(40, 100, 70, 70)];
//    viewA.alpha = 0.001f;
    viewA.backgroundColor = UIColor.cyanColor;
    [self.view addSubview:viewA];
}



@end
