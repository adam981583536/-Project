//
//  DrawingBord.h
//  简易画板
//
//  Created by 汇文教育 on 15/12/23.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingBord : UIView{
    
    CGMutablePathRef _path;
    CGPoint _point;
    CGPoint _pastPoint;
    CGPoint _previousP;
    
}
@property (nonatomic , strong) NSMutableArray *pathArr;
@property (nonatomic , strong) NSMutableArray *colorArr;
@property (nonatomic , strong) NSMutableArray *widthArr;
@property (nonatomic , assign) int width;
@property (nonatomic , strong) UIColor *color;
@property (nonatomic , strong)NSTimer *timer;
@property (nonatomic , assign) int del;
@property (nonatomic , assign) int all;
@end
