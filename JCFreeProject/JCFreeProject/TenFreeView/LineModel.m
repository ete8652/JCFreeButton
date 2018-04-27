//
//  LineModel.m
//  test
//
//  Created by Ten on 2018/4/27.
//  Copyright © 2018年 Ten. All rights reserved.
//

#import "LineModel.h"

@implementation LineModel

-(instancetype)init{
    if (self = [super init]) {
        self.startPoint = CGPointMake(0, 0);
        self.endPoint = CGPointMake(0, 0);
        self.controlPoint = CGPointMake(0, 0);
        self.lineType = StraightLine;
    }
    return self;
}

@end
