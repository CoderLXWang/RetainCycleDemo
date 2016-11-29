//
//  BlockWeakController.m
//  RetainCycleDemo
//
//  Created by sharejoy_lx on 16-11-25.
//  Copyright © 2016年 wlx. All rights reserved.
//

#import "BlockWeakController.h"
#import "BlockWeakView.h"

#define WeakSelf(weakSelf)  __weak __typeof(&*self) weakSelf = self

@interface BlockWeakController ()

@property (nonatomic, strong) BlockWeakView *testView;

@end

@implementation BlockWeakController

- (void)dealloc {
    NSLog(@"BlockWeakController被释放");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    BlockWeakView *testView = [[BlockWeakView alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    self.testView = testView;
    
    WeakSelf(ws);
    testView.testBlock = ^(void){
        
        //可将ws替换为self，观察控制器是否被释放
        ws.view.backgroundColor = [UIColor colorWithRed:random()%256/255.0 green:random()%256/255.0 blue:random()%256/255.0 alpha:1];
    };
    
    
    [self.view addSubview:testView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.view.backgroundColor = [UIColor colorWithRed:random()%256/255.0 green:random()%256/255.0 blue:random()%256/255.0 alpha:1];
    
    //这里传入一个block，和masonry类似的，方法内部并没有引用，只是执行了一下，所以出了作用域就会被释放，不会循环引用
    [self.testView changeLabelText:^(UILabel *testLabel) {
        testLabel.text = @"通过block改变了文字颜色";
        testLabel.textColor = self.view.backgroundColor;
    }];
    

    
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
