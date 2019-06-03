// 通过按键上、下、左、右移动文本位置
// esc 退出程序
// 空格 复选框选中或取消

import QtQuick 2.2
import QtQuick.Controls 1.2 // CheckBox

Rectangle{
    width: 320
    height: 480
    color: "gray"

    focus: true
    Keys.enabled: true
    Keys.onEscapePressed: Qt.quit() // esc退出
    Keys.forwardTo: [moveText, likeQt] // 按键传递列表

    Text{
        id:moveText
        x:20
        y:20
        width: 200
        height: 30
        text: "moving test"
        color: "blue"
        font: {bold:true;pixelSize:24;}

        Keys.enabled: true
        Keys.onPressed: {
            switch(event.key){ // event.key
            case Qt.Key_Left:
                x-=10
                break
            case Qt.Key_Right:
                x+=10
                break
            case Qt.Key_Down:
                y+=10
                break
            case Qt.Key_Up:
                y-=10
                break
            }
            event.accept=true
        }
    }

    CheckBox{
        id:likeQt
        text: "like Qt Quick"
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        z:1
    }
}
