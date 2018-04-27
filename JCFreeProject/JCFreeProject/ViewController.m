//
//  ViewController.m
//  JCFreeProject
//
//  Created by Ten on 2018/4/27.
//  Copyright © 2018年 Ten. All rights reserved.
//

#import "ViewController.h"
#import "FreeView.h"

@interface ViewController ()
@property(nonatomic,strong)FreeView *freeView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //划线
    CGFloat offsetX = 0.0;
    NSMutableArray *modelArray = [[NSMutableArray alloc]init];
    
    LineModel *model1 = [[LineModel alloc]init];
    model1.startPoint = CGPointMake(0+offsetX, 80);
    model1.endPoint = CGPointMake(140+offsetX, 80);
    
    LineModel *model2 = [[LineModel alloc]init];
    model2.startPoint = CGPointMake(140+offsetX, 80);
    model2.endPoint = CGPointMake(110+offsetX, 180);
    model2.controlPoint = CGPointMake(90+offsetX, 130);
    model2.lineType = CurveLine;
    
    LineModel *model3 = [[LineModel alloc]init];
    model3.startPoint = CGPointMake(140+offsetX, 180);
    model3.endPoint = CGPointMake(40+offsetX, 180);
    
    LineModel *model4 = [[LineModel alloc]init];
    model4.startPoint = CGPointMake(40+offsetX, 180);
    model4.endPoint = CGPointMake(90+offsetX, 130);
    
    LineModel *model5 = [[LineModel alloc]init];
    model5.startPoint = CGPointMake(90+offsetX, 130);
    model5.endPoint = CGPointMake(0+offsetX, 80);
    
    [modelArray addObject:model1];
    [modelArray addObject:model2];
    [modelArray addObject:model3];
    [modelArray addObject:model4];
    [modelArray addObject:model5];
    
    
    //设置图形
    _freeView = [[FreeView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:_freeView];
    _freeView.contentColor = [UIColor yellowColor];
    _freeView.lineModeArray = modelArray;
    [_freeView drawLine];
    
    __weak typeof(self) weakSelf = self;
    _freeView.viewClick = ^(id cropView) {
        [UIView animateWithDuration:1 animations:^{
            NSLog(@"移动了");
            weakSelf.freeView.center = weakSelf.view.center;
            
        }];
    };
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
