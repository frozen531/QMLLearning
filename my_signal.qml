import QtQuick 2.2

Rectangle{
    width: 320
    height: 240
    color: "#c0c0c0"

    Text{
        id: coloredText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 4
        text: "Hello world!"
        font.pixelSize: 32
    }

    Component{ // 组件定义，可重复使用
        id : colorComponent
        Rectangle{
            id: colorPicker
            width: 50
            height: 30

            signal colorPicked(color clr) // 自定义信号

            MouseArea{
                anchors.fill: parent
                onPressed: colorPicker.colorPicked(colorPicker.color)
            }
        }
    }

    Loader{ // Loader专门用来动态创建组件
        id:redLoader
        anchors.left: parent.left
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4

        sourceComponent: colorComponent // 组件源

        onLoaded: {
            item.color = "red" // item : Component中的对象，这里是Rectangle
        }
    }

    Loader{ // Loader专门用来动态创建组件
        id:blueLoader
        anchors.left: redLoader.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        sourceComponent: colorComponent
        onLoaded: {
            item.color = "blue"
        }
    }

    Connections{ // 当对象发出信号，需要多个对象做出相应的操作，可以用这种专用的信号处理器
        target: redLoader.item // 对象指向redLoader.item，这里是Component中的Rectangle
        onColorPicked:{
            coloredText.color = clr // 信号参数
        }
    }

    Connections{
        target: blueLoader.item
        onColorPicked:{
            coloredText.color = clr
        }
    }
}
