//
//  BlockWeakView.h
//  RetainCycleDemo
//
//  Created by sharejoy_lx on 16-11-25.
//  Copyright © 2016年 wlx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockWeakView : UIView


@property (nonatomic, copy) void(^testBlock)(void);


- (void)changeLabelText:(void(^)(UILabel *testLabel))labelBlock;


@end
