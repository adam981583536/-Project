//
//  HeaderView.m
//  简易画板
//
//  Created by 汇文教育 on 15/12/23.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "HeaderView.h"


@implementation HeaderView
{
    UIView *_select;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self _creatView];
        if (_select == nil) {
            _select = [[UIView alloc] initWithFrame:CGRectMake(0, 48, kScreenWidth/5-5, 2)];
            _select.backgroundColor = [UIColor redColor];
            [self addSubview:_select];
        }
        
    }
    return self;
}

- (void)_creatView{
    CGFloat width = kScreenWidth/5;
    NSArray *arr = @[@"颜色",@"线条",@"橡皮",@"撤销",@"删除"];
    
    for (int i = 0;  i < 5; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*width, 10, width-5, 40)];
        NSString *title = arr[i];
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        button.tag = 100 +i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
    }

}
- (void)buttonAction:(UIButton *)sender{
    CGFloat width = kScreenWidth/5;
    UIButton *button = [self viewWithTag:200];//判断自身有没有创建
    
    UIButton *button1 = [self viewWithTag:300];//判断宽度判断有没有创建
   
    [UIView animateWithDuration:0.2 animations:^{
        long i =  sender.tag - 100;
       
        
        _select.frame = CGRectMake(i*width, 48, kScreenWidth/5-5, 2);
    }];
//    if (button != nil) {
//        for (int i = 0; i < 9; i++) {
//            UIButton *button2 = [self viewWithTag:200+i];
//            button2.hidden = YES;
//        }
//    }
// 
//    
//    
//    if (button1 != nil) {
//        for (int i = 0; i < 8; i++) {
//            UIButton *button2 = [self viewWithTag:300 +i ];
//            button2.hidden = YES;
//        }
//    }
    if (sender.tag == 100) {
        
        if (button1 != nil) {
            for (int i = 0; i < 8; i++) {
                UIButton *button2 = [self viewWithTag:300 +i ];
                button2.hidden = YES;
            }
        }
        if (button != nil) {
            for (int i = 0; i < 9; i++) {
                UIButton *button2 = [self viewWithTag:200+i];
                button2.hidden = NO;
            }
        }
        
        
        if (button == nil) {
            CGFloat width = kScreenWidth/9;
            colorArr = [[NSArray alloc] init];
             colorArr = @[[UIColor blackColor],[UIColor redColor],[UIColor orangeColor],[UIColor grayColor],[UIColor greenColor],[UIColor blueColor],[UIColor purpleColor],[UIColor magentaColor],[UIColor yellowColor]];
            
            for (int i = 0; i < 9; i++) {
                
                UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(i*width, 50, width, 70)];
                button2.tag = 200 +i;
                UIColor *color = colorArr[i];
                [button2 addTarget:self action:@selector(selectorColor:) forControlEvents:UIControlEventTouchUpInside];
                
                
                button2.backgroundColor = color;
                [self addSubview:button2];
            }
            
        
            
        }else{
        
        }
        
        _color = !_color;
        
    }
    if (sender.tag == 101) {
        
        if (button != nil) {
            for (int i = 0; i < 9; i++) {
                UIButton *button2 = [self viewWithTag:200+i];
                button2.hidden = YES;
            }
        }
        if (button1 != nil) {
            for (int i = 0; i < 8; i++) {
                UIButton *button2 = [self viewWithTag:300 +i ];
                button2.hidden = NO;
            }
        }
        
        NSArray *arr =@[@"宽5",@"宽10",@"宽15",@"宽20",@"宽25",@"宽30",@"宽35",@"宽40"];
        
        CGFloat width = kScreenWidth/8;
        if (button1 == nil) {
            for (int i = 0; i < 8 ; i++) {
                NSString *s = arr[i];
                UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(i*width, 50, width, 70)];
                button3.tag = 300 +i;
                
                [button3 setTitle:s forState:UIControlStateNormal];
                [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                 [button3 addTarget:self action:@selector(selectorWidth:) forControlEvents:UIControlEventTouchUpInside];
                
                [self addSubview:button3];
            }
        }
        
        _font = !_font;
        
    }
    if (sender.tag == 102) {
        if (button != nil) {
            for (int i = 0; i < 9; i++) {
                UIButton *button2 = [self viewWithTag:200+i];
                button2.hidden = YES;
            }
        }
        
        
        
        if (button1 != nil) {
            for (int i = 0; i < 8; i++) {
                UIButton *button2 = [self viewWithTag:300 +i ];
                button2.hidden = YES;
            }
        }
        UIColor *selectColor = [UIColor whiteColor];
        
        self.MyColorBlock(selectColor) ;
        
    }
    if (sender.tag == 103) {
        if (button != nil) {
            for (int i = 0; i < 9; i++) {
                UIButton *button2 = [self viewWithTag:200+i];
                button2.hidden = YES;
            }
        }
        
        
        
        if (button1 != nil) {
            for (int i = 0; i < 8; i++) {
                UIButton *button2 = [self viewWithTag:300 +i ];
                button2.hidden = YES;
            }
        }
        int a = 1;
        self.MyDeleteBlock(a);
        
        //删除最后一位数组
    }
    if (sender.tag == 104) {
        if (button != nil) {
            for (int i = 0; i < 9; i++) {
                UIButton *button2 = [self viewWithTag:200+i];
                button2.hidden = YES;
            }
        }
        
        
        
        if (button1 != nil) {
            for (int i = 0; i < 8; i++) {
                UIButton *button2 = [self viewWithTag:300 +i ];
                button2.hidden = YES;
            }
        }
        int a = 2;
        self.AllDeleteBlock (a);
    }

}
- (void)selectorColor:(UIButton *)sender{
    UIColor *selectColor = colorArr[sender.tag-200];
    
   self.MyColorBlock(selectColor) ;
    

}
- (void)selectorWidth:(UIButton *)sender{
    NSArray *select =@[@5,@10,@15,@20,@25,@30,@35,@40];
    
    NSString *width = select[sender.tag - 300];
    int myWidth = [width intValue];
    
    self.MyWidthBlock(myWidth);
    
    
}
@end
