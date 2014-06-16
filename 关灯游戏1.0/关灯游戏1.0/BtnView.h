//
//  BtnView.h
//  关灯游戏1.0
//
//  Created by 萨斯辈的呼唤 on 14-6-11.
//  Copyright (c) 2014年 萨斯辈的呼唤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BtnView : UIView

- (instancetype)initWithFrame:(CGRect)frame array:(NSArray *)array;

@property (nonatomic, assign) id target;
@property (nonatomic, assign) SEL action;

@end
