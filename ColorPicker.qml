// 文件形式的组件
// 回车 和 空格 都可以相应颜色变化

import QtQuick 2.2

Rectangle{
    id:colorPicker

    width: 50
    height: 30
    signal colorPicked(color clr)

    function configureBorder(){
        colorPicker.border.width = colorPicker.focus ? 2 : 0
        colorPicker.border.color = colorPicker.focus ? "#90d750" : "#808080"
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            colorPicker.focus = true // 点击时，给焦点
            colorPicker.colorPicked(colorPicker.color)
        }
    }

    Keys.onReturnPressed: { // 回车 按键，要置位accept = true
        colorPicker.colorPicked(colorPicker.color)
        event.accept = true
    }

    Keys.onSpacePressed: { // 空格 按键，要置位accept = true
        colorPicker.colorPicked(colorPicker.color)
        event.accept = true
    }

    onFocusChanged: { // focus状态变化，响应configureBorder()
        configureBorder()
    }
}
