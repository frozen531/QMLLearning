// 按键、回车、空格 都可以改变字体颜色
// 左、右、tab 变化焦点位置

import QtQuick 2.2

Rectangle{
    width: 320
    height: 240
    color: "gray"

    Text {
        id: coloredText
        text: qsTr("hello world")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 4
        font.pixelSize: 32
    }

    ColorPicker{
        id:redColor
        color: "red"
        focus: true // 初始的焦点在redColor上
        anchors.left: parent.left
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4

        KeyNavigation.right: blueColor // 按键变化焦点
        KeyNavigation.tab: blueColor

        onColorPicked: {
            coloredText.color = clr
        }
    }

    ColorPicker{
        id:blueColor
        color: "blue"
        anchors.left: redColor.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4

        KeyNavigation.left: redColor
        KeyNavigation.right: pinkColor
        KeyNavigation.tab: pinkColor

        onColorPicked: {
            coloredText.color = clr
        }
    }

    ColorPicker{
        id:pinkColor
        color: "pink"
        anchors.left: blueColor.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4

        KeyNavigation.left: blueColor
        KeyNavigation.tab: redColor

        onColorPicked: {
            coloredText.color = clr
        }
    }
}
