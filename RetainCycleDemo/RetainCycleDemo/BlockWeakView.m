//
//  BlockWeakView.m
//  RetainCycleDemo
//
//  Created by sharejoy_lx on 16-11-25.
//  Copyright © 2016年 wlx. All rights reserved.
//

#import "BlockWeakView.h"

@interface BlockWeakView ()

@property (nonatomic, strong) UILabel *testLabel;


@end

@implementation BlockWeakView

- (UILabel *)testLabel {
    if (!_testLabel) {
        _testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
        _testLabel.font = [UIFont systemFontOfSize:16];
    }
    return _testLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 2.0;
        
        [self addSubview:self.testLabel];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)click {
    if (self.testBlock) {
        self.testBlock();
    }
    
}

- (void)changeLabelText:(void(^)(UILabel *testLabel))labelBlock {
    if (labelBlock) {
        
        labelBlock(self.testLabel);
    }
    
    
}




@end



