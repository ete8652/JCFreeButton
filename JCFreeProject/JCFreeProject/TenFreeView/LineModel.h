//
//  LineModel.h
//  test
//
//  Created by Ten on 2018/4/27.
//  Copyright © 2018年 Ten. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    StraightLine,//直线
    CurveLine,//曲线
} LineType;

@interface LineModel : NSObject

@property(nonatomic,assign)CGPoint startPoint;
@property(nonatomic,assign)CGPoint endPoint;
@property(nonatomic,assign)CGPoint controlPoint;
@property(nonatomic,assign)LineType lineType;

@end
