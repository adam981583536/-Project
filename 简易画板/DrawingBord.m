//
//  DrawingBord.m
//  简易画板
//
//  Created by 汇文教育 on 15/12/23.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "DrawingBord.h"

@implementation DrawingBord
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _width = 5;
        _color = [UIColor blackColor];
        _pathArr = [[NSMutableArray alloc] init];
        _colorArr = [[NSMutableArray alloc] init];
        _widthArr = [[NSMutableArray alloc] init];
        _del = 0;
        _all = 0;
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef myPath = CGPathCreateMutable();
    if (_del == 0 && _all == 0) {
        if (_pathArr != nil) {
            
            
            if (_pathArr.count != 0) {
                for (int i = 0; i < _pathArr.count; i++) {
                    myPath = (__bridge CGMutablePathRef)(_pathArr[i]);
                    NSString *wid = _widthArr[i];
                    int MyWid =[wid intValue];
                    UIColor *Mycolor =_colorArr[i];
                    
                    CGContextSetStrokeColorWithColor(context, Mycolor.CGColor);
                    
                    CGContextSetLineWidth(context, MyWid);
                    
                    CGContextAddPath(context, myPath);
                    CGContextDrawPath(context, kCGPathStroke);
                }
            }
        }
        [self drawLines:context];
    }
    
    else if (_del == 1 && _all == 0){
    
        if (_pathArr != nil) {
            
            
            if (_pathArr.count != 0) {
                for (int i = 0; i < _pathArr.count; i++) {
                    myPath = (__bridge CGMutablePathRef)(_pathArr[i]);
                    NSString *wid = _widthArr[i];
                    int MyWid =[wid intValue];
                    UIColor *Mycolor =_colorArr[i];
                    
                    CGContextSetStrokeColorWithColor(context, Mycolor.CGColor);
                    
                    CGContextSetLineWidth(context, MyWid);
                    
                    CGContextAddPath(context, myPath);
                    CGContextDrawPath(context, kCGPathStroke);
                }
            }
        }
        
        _del = 0;
    }
    else {
    
        _all = 0;
        
    }
    
    
  
    
}
- (void)drawLines:(CGContextRef)context {
   
    
    
    CGPathMoveToPoint(_path, NULL, _previousP.x, _previousP.y);
    //终点并连接起点和终点
    CGPathAddLineToPoint(_path, NULL, _point.x, _point.y);
   
    
    //    (4)把路径交给图形上下文显示
    CGContextAddPath(context, _path);
    //    (5)设置图形上下文的属性（如线条颜色，线宽等）
    CGContextSetStrokeColorWithColor(context, _color.CGColor);
    
    CGContextSetLineWidth(context, _width);
    
    //(6)绘制
    CGContextDrawPath(context, kCGPathStroke);
    
    //(7)对路径做一次release
//    CGPathRelease(_path);
    
}
- (void)drawing:(CGContextRef )context{

    
    _path = CGPathCreateMutable();
    
    CGPathMoveToPoint(_path, NULL, _pastPoint.x, _pastPoint.y);
    
    CGPathAddLineToPoint(_path, NULL, _point.x, _point.y);
    
    CGContextAddPath(context, _path);
    
    CGContextSetLineWidth(context, _width);
    CGContextSetStrokeColorWithColor(context, _color.CGColor);
      CGContextDrawPath(context, kCGPathStroke);
    
}

- (void)setColor:(UIColor *)color{
    if (_color != color) {
        _color = color;
        
    }


}

- (void)setWidth:(int)width{

    if (_width != width) {
        _width = width;
    }
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    _path = CGPathCreateMutable();
    _pastPoint = [touch locationInView:self ];
   
    
    
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    [self setNeedsDisplay ];
    self.timer.fireDate = [NSDate distantPast];
    _point = [touch locationInView:self];
     _previousP = [touch previousLocationInView:self];
    

}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

   
    [_pathArr addObject:CFBridgingRelease(_path)];
    [_colorArr addObject:_color];
    NSString *s = [NSString stringWithFormat:@"%d",_width];
    [_widthArr addObject:s];
    
    
    
  self.timer.fireDate = [NSDate distantFuture];
}
- (NSTimer *)timer{
    
    if (!_timer ) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(drawRect:) userInfo:nil repeats:YES];
    }
    return _timer;

}
- (void)setDel:(int)del{
    if (_del != del) {
        _del = del;
       
        [self _remove];
    }
    
}
- (void)_remove{
    if (_del != 0) {
        NSLog(@"%d",_del);
        [_pathArr removeLastObject];
        [_widthArr removeLastObject];
        [_colorArr removeLastObject];
        [self setNeedsDisplay];
//        [self drawRect:self.frame];
}
}
- (void)setAll:(int)all{
    
    if (_all != all) {
        _all = all;
        NSLog(@"%d",all);
        [_pathArr removeAllObjects];
        [_widthArr removeAllObjects];
        [_colorArr removeAllObjects];
        [self setNeedsDisplay];
        
    }
   
    
}

@end
