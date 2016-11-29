//
//  DelegateWeakView.m
//  RetainCycleDemo
//
//  Created by sharejoy_lx on 16-11-25.
//  Copyright © 2016年 wlx. All rights reserved.
//

#import "DelegateWeakView.h"

@implementation DelegateWeakView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)click {
    if ([self.delegate respondsToSelector:@selector(clickDelegateWeakView)]) {
        [self.delegate clickDelegateWeakView];
    }
}

@end
