//
//  DrawView.m
//  CAD定时器
//
//  Created by liuxingchen on 16/10/24.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "DrawView.h"

static CGFloat _snowY = 0;

@implementation DrawView
- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"雪花"];
    [image drawAtPoint:CGPointMake(50, _snowY)];
    _snowY += 10;
    if (_snowY > rect.size.height) {
        _snowY = 0;
    }
}
-(void)awakeFromNib
{
    // CADisplayLink:每次屏幕刷新的时候就会调用，屏幕一般一秒刷新60次
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeChange)];
    // 添加主运行循环
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}
-(void)timeChange
{
    //这个方法并不会马上调用drawRect，只是给当前控件添加刷新标记，等下一次屏幕刷新的时候才会调用drawRect
    [self setNeedsDisplay];
}
@end
