//
//  ViewController.m
//  简易画板
//
//  Created by 汇文教育 on 15/12/23.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"
#import "DrawingBord.h"
static float hight = 120;
@interface ViewController ()
{
    DrawingBord *draw;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HeaderView *header = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, hight)];
    
    draw = [[DrawingBord alloc] initWithFrame:CGRectMake(0, hight, kScreenWidth, kScreenHeight-hight)];
    
    
    header.backgroundColor = [UIColor lightGrayColor];
    
    draw.backgroundColor = [UIColor whiteColor];
    header.MyColorBlock = ^(UIColor *color){
    
        NSLog(@"%@",color);
        [self MyColor:color];
    };
    

    
    header.MyWidthBlock = ^(int width){
        [self MyWidth:width];
    };
    header.MyDeleteBlock = ^(int del){
        [self MyDelete:del];
    
    };
    header.AllDeleteBlock = ^(int all){
    
        [self allDelete:all];
    };
    
    [self.view addSubview:header];
    
    [self.view addSubview:draw];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void )MyColor:(UIColor *)color{
    
    
    if (_color != color) {
        _color = color;
        draw.color = _color;
        
    }  NSLog(@"%@",_color);
    
    
}
- (void)MyWidth:(int )width{
    if (_width != width) {
        _width = width;
        draw.width = _width;
    }NSLog(@"%d",_width);

}
- (void)MyDelete:(int )del{
    draw.del = del;
    NSLog(@"%d",del);
}
- (void)allDelete:(int )del{
    draw.all = del;
    
    NSLog(@"%d",del);

}
@end
