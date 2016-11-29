//
//  DelegateWeakController.m
//  RetainCycleDemo
//
//  Created by sharejoy_lx on 16-11-25.
//  Copyright © 2016年 wlx. All rights reserved.
//

#import "DelegateWeakController.h"
#import "DelegateWeakView.h"

@interface DelegateWeakController () <DelegateWeakViewDelegate>

@end

@implementation DelegateWeakController

- (void)dealloc {
    NSLog(@"DelegateWeakController被释放");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DelegateWeakView *testView = [[DelegateWeakView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    testView.delegate = self;
    [self.view addSubview:testView];
}

- (void)clickDelegateWeakView {
    self.view.backgroundColor = [UIColor colorWithRed:random()%256/255.0 green:random()%256/255.0 blue:random()%256/255.0 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
