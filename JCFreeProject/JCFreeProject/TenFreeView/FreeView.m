//
//  FreeView.m
//  test
//
//  Created by Ten on 2018/4/27.
//  Copyright © 2018年 Ten. All rights reserved.
//

#import "FreeView.h"

@interface FreeView()

@property(nonatomic,strong)UIBezierPath *marginalPath;
@property(nonatomic,strong)UIButton *button;

@end

@implementation FreeView

-(void)drawLine{
    
    if (!self.borderColor) self.borderColor = [UIColor greenColor];
    if (!self.contentColor) self.contentColor = [UIColor yellowColor];
    if (!self.imageBtn) self.imageBtn = [self creatImageWithColor:[UIColor greenColor]];
    
    _marginalPath = [[UIBezierPath alloc]init];
    [self.lineModeArray enumerateObjectsUsingBlock:^(LineModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            [_marginalPath moveToPoint:model.startPoint];
        }
        if (model.lineType == StraightLine) {
            [_marginalPath addLineToPoint:model.endPoint];
        }else{
            [_marginalPath addQuadCurveToPoint:model.endPoint controlPoint:model.controlPoint];
        }
    }];
    
    CAShapeLayer *borderLLayer = [[CAShapeLayer alloc]init];
    borderLLayer.path = _marginalPath.CGPath;
    borderLLayer.frame = self.bounds;
    borderLLayer.fillColor = [UIColor redColor].CGColor;
    self.layer.mask = borderLLayer;
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc]init];
    shapeLayer.path = _marginalPath.CGPath;
    shapeLayer.fillColor = self.contentColor.CGColor;
    shapeLayer.strokeColor = self.borderColor.CGColor;
    shapeLayer.lineWidth = 2.0;
    
    [self.layer addSublayer:shapeLayer];
    
    _button = [[UIButton alloc]initWithFrame:self.bounds];
    [_button setBackgroundImage:self.imageBtn forState:UIControlStateHighlighted];
    [self addSubview:_button];
    _button.userInteractionEnabled = NO;
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = (UITouch *)[touches anyObject];
    CGPoint point = [touch locationInView:self];
    if ([_marginalPath containsPoint:point]) {
        if (self.viewClick) self.viewClick(self);
        NSLog(@"包含");
        _button.highlighted = YES;
    }else{
        NSLog(@"不包含");
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    _button.highlighted = NO;
}

-(UIImage *)creatImageWithColor:(UIColor *)color{
    
    CGRect rect = CGRectMake(0, 0, 100, 100);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
    
}

@end
