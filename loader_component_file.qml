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

    Component{
        id:colorComponent
        Rectangle{
            id:colorPickerComponent
            width: 50
            height: 30
            signal colorPicked(color clr)

//            property Item loader // 新添加，用于转换焦点

            function configureBorder(){
                colorPickerComponent.border.width = colorPickerComponent.focus ? 2 : 0
                colorPickerComponent.border.color = colorPickerComponent.focus ? "#90d750" : "#808080"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    colorPickerComponent.focus = true // 点击时，给焦点
                    colorPickerComponent.colorPicked(colorPickerComponent.color)
//                    loader.focus = true // loader转换焦点 ##2
                }
            }

            Keys.onReturnPressed: { // 回车 按键，要置位accept = true
                colorPickerComponent.colorPicked(colorPickerComponent.color)
                event.accept = true
            }

            Keys.onSpacePressed: { // 空格 按键，要置位accept = true
                colorPickerComponent.colorPicked(colorPickerComponent.color)
                event.accept = true
            }

            onFocusChanged: { // focus状态变化，响应configureBorder()
                configureBorder()
            }
        }
    }

    Loader{
        id:redColor
        // 出错，因为使用loader必须使用 item 属性访问组件的 Item
//        color: "red"
        focus: true // 初始的焦点在redColor上
        anchors.left: parent.left
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4

        KeyNavigation.right: blueColor // 按键变化焦点
        KeyNavigation.tab: blueColor

        // 出错：原因同上
//        onColorPicked: {
//            coloredText.color = clr
//        }

        sourceComponent: colorComponent
        onLoaded: {
            item.color = "red"
            item.focus = true // iten初始的焦点,这里不光Loader.focus = item.focus = true
//            item.loader = redColor // loader转换焦点 ##2
        }
        onFocusChanged: { // item.focus 与 Loader.focus一致
            item.focus = focus
        }
    }

    Loader{
        id:blueColor
        //color: "blue"
        anchors.left: redColor.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4

        KeyNavigation.left: redColor
        KeyNavigation.right: pinkColor
        KeyNavigation.tab: pinkColor

//        onColorPicked: {
//            coloredText.color = clr
//        }

        sourceComponent: colorComponent
        onLoaded: {
            item.color = "blue"
//            item.loader = blueColor // loader转换焦点 ##2
        }
        onFocusChanged: {
            item.focus = focus
        }
    }

    Loader{
        id:pinkColor
//        color: "pink"
        anchors.left: blueColor.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4

        KeyNavigation.left: blueColor
        KeyNavigation.tab: redColor

//        onColorPicked: {
//            coloredText.color = clr
//        }

        sourceComponent: colorComponent
        onLoaded: {
            item.color = "pink"
//            item.loader = pinkColor // loader转换焦点 ##2
        }
        onFocusChanged: {
            item.focus = focus
        }
    }

    Connections{
        target: redColor.item
        onColorPicked:{
            coloredText.color=clr
            if(!redColor.focus){
                redColor.focus = true
                blueColor.focus = false
                pinkColor.focus = false
            }
        }
    }

    Connections{
        target: blueColor.item
        onColorPicked:{
            coloredText.color=clr
            if(!blueColor.focus){
                blueColor.focus = true
                redColor.focus = false
                pinkColor.focus = false
            }
        }
    }

    Connections{
        target: pinkColor.item
        onColorPicked:{
            coloredText.color=clr
            if(!pinkColor.focus){
                pinkColor.focus = true
                redColor.focus = false
                blueColor.focus = false
            }
        }
    }
}
