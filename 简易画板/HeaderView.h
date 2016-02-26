//
//  HeaderView.h
//  简易画板
//
//  Created by 汇文教育 on 15/12/23.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UIView
{
    BOOL _color;
    BOOL _font;
    NSArray *colorArr;
    
    
}
@property(nonatomic, copy) void(^MyColorBlock)(UIColor *color);
@property (nonatomic, copy) void(^MyWidthBlock)(int width);
@property (nonatomic, copy) void(^MyDeleteBlock)(int MyDelete);
@property (nonatomic, copy) void(^AllDeleteBlock)(int AllDelete);
@end
