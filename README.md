# JCFreeButton
可自定义不规则形状的按钮。

### 简介
里面有FreeView和LineModel

FreeView：在它上面绘制了图形。

LineModel：线条的模型。

### 使用
1. 创建LineModel对象，并对其赋值，并加入模型数组
2. 初始化FreeView，并用模型数组给其lineModeArray熟悉赋值
3. 调用drawLine方法。
4. 设置viewClick点击回调。


