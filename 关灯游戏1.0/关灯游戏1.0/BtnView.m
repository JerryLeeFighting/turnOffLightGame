//
//  BtnView.m
//  关灯游戏1.0
//
//  Created by 萨斯辈的呼唤 on 14-6-11.
//  Copyright (c) 2014年 萨斯辈的呼唤. All rights reserved.
//

#import "BtnView.h"

@implementation BtnView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame array:(NSArray *)array;
{
    self = [super initWithFrame:frame];
    if (self) {
        //        NSLog(@"%@", array);
        
        int row = 0; //行
        int cow = 0; //列
        for (int i = 0; i < [array count]; i ++) {
            row = i / 3;
            cow = i % 3;
//            NSLog(@"创建按钮行%d 列%d", row, cow);
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            if ([array objectAtIndex:i] == 0) {
                [btn setBackgroundColor:[UIColor blackColor]];
            } else {
                [btn setBackgroundColor:[UIColor whiteColor]];
            }
            btn.frame = CGRectMake(20 + cow * 55, 30 + row * 55, 50, 50);
            btn.tag = i + 10000;
            [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
    }
    return self;
}

- (void)buttonClick:(UIButton *)btn
{
    NSString *index = [NSString stringWithFormat:@"%lu", btn.tag];
//    NSLog(@"按钮%@", index);
    [self.target performSelector:self.action withObject:index];
}


- (void)changeViewColor:(NSArray *)array
{
    NSLog(@"%@", array);
    for (int i = 0; i < [array count]; i ++) {
        UIButton *btn = (UIButton *)[self viewWithTag:i + 10000];
        NSString *value = [array objectAtIndex:i];
        if ([value intValue] == 1) {
            btn.backgroundColor = [UIColor whiteColor];
        } else {
            btn.backgroundColor = [UIColor blackColor];
        }
    }
    self.backgroundColor = [UIColor orangeColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
