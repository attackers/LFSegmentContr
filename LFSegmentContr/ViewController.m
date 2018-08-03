//
//  ViewController.m
//  LFSegmentContr
//
//  Created by OS X10_12_6 on 2018/8/2.
//  Copyright © 2018年 OS X10_12_6. All rights reserved.
//

#import "ViewController.h"
#import "LFSegmentContrController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    LFSegmentContrController *segment = [LFSegmentContrController initBeeMessageTypeSegmentedControllerItems:@[@"待付款",@"抢购中",@"待收货",@"已完成",@"退换货",@"待付款",@"抢购中",@"待收货",@"已完成",@"退换货",@"待付款",@"抢购中",@"待收货",@"已完成",@"退换货"] frame:CGRectMake(10, 60, CGRectGetWidth(UIScreen.mainScreen.bounds) - 20, 200) inBounds:false];
    [self addChildViewController:segment];
    [self.view addSubview:segment.view];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
