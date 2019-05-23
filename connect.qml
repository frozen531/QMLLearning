import QtQuick 2.2

Rectangle{
    id:forwarder
    width: 100
    height: 100

    signal send2() // 使用QML信号处理器
    onSend2: console.log("send2 clicked")

    function send1(){ // 使用响应函数
        console.log("send1 clicked")
    }

    MouseArea{
        id: mousearea
        anchors.fill: parent
        onClicked: console.log("MouseArea clicked")
    }

    Component.onCompleted: {
        mousearea.clicked.connect(send1) // 信号.connect(函数)
        mousearea.clicked.connect(send2) // 信号.connect(信号)
    }
}
