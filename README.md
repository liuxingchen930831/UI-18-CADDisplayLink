```
// CADisplayLink:每次屏幕刷新的时候就会调用，屏幕一般一秒刷新60次
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeChange)];
    // 添加主运行循环
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    //这个方法并不会马上调用drawRect，只是给当前控件添加刷新标记，等下一次屏幕刷新的时候才会调用drawRect
    [self setNeedsDisplay];
    ```