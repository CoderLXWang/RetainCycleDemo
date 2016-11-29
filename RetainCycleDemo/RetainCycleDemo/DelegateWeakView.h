//
//  DelegateWeakView.h
//  RetainCycleDemo
//
//  Created by sharejoy_lx on 16-11-25.
//  Copyright © 2016年 wlx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DelegateWeakViewDelegate <NSObject>

- (void)clickDelegateWeakView;

@end

@interface DelegateWeakView : UIView

//可以把weak替换成strong, 测试循环引用
@property (nonatomic, weak) id<DelegateWeakViewDelegate> delegate;

@end
