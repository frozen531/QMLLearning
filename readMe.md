1. basicElement.qml (4)
2. my_signal.qml (6.1.3)
     Component：组件
       Loader：动态创建组件
       Connections：专用的信号处理
3. connect.qml (6.1.4)
     connect：类似信号处理器onSignal     信号.connect(信号)  信号.connect(函数)

### handle_mouse(6.2.1) - 鼠标事件

### handle_key(6.3.1) - 键盘事件

### countdown(6.4.1) - 定时器

# 7. 组件

ColorPicker.qml 是文件类型的组件；

component_file.qml 是使用文件类型组件，类QML对象加载方式；



loader_component_file.qml 是使用内嵌的Component，Loader加载组件。



上面两种方式实现同样的功能。要注意的是多次加载组件时，焦点的转换问题。