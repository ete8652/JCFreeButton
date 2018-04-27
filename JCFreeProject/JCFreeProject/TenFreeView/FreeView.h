//
//  FreeView.h
//  test
//
//  Created by Ten on 2018/4/27.
//  Copyright © 2018年 Ten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LineModel.h"

typedef void(^ViewClick)(id cropView);

@interface FreeView : UIView
//模型数组
@property(nonatomic,strong)NSArray *lineModeArray;
//点击回调
@property(nonatomic,copy)ViewClick viewClick;
//边线颜色
@property(nonatomic,strong)UIColor *borderColor;
//内容颜色
@property(nonatomic,strong)UIColor *contentColor;
//按钮图片
@property(nonatomic,strong)UIImage *imageBtn;
//画线
-(void)drawLine;

@end
