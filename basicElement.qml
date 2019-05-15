import QtQuick 2.2

Rectangle{
    width: 660
    height: 500

    Item{
        id:item

        width: 320
        height: 480

        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10

        clip: false // true:裁剪掉超出parent的部分；false：随意孩子超出父Item

        Rectangle{
            x:160
            width: parent.width
            height: parent.height
            color: "pink"

            focus: true // 设置按键，focus必须为true
            Keys.enabled: true
            Keys.onPressed: {
                switch(event.key){ // event.key直接用就行
                case Qt.Key_0:
                case Qt.Key_1:
                case Qt.Key_2:
                case Qt.Key_3:
                case Qt.Key_4:
                case Qt.Key_5:
                case Qt.Key_6:
                case Qt.Key_7:
                case Qt.Key_8:
                case Qt.Key_9:
                    event.accepted = true // 如果一个按键被处理，则设定event.accepted为true，以免它被继续传递
                    keyView.text = event.key - Qt.Key_0
                    break
                }
            }

            Text {
                id: keyView
                text: qsTr("text")
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 24
                font.bold: true

            }
        }

        Rectangle{
            id:rect

            anchors.fill: parent // 填充到parent

            color: "grey"

            //z:1.5 // Z序，real，值越大，越靠近我们
            opacity: 0.3 // 透明度设定，范围0到1

            Rectangle{
                id: subrect1
                width: 100
                height:60

                anchors.centerIn: parent

                //z:0.5
                opacity: 0.6

                gradient: Gradient{ // 只有垂直方向可使用渐变，不过其他方向可通过指定rotation实现
                    GradientStop{
                        position: 0.0
                        color: "red"
                    }
                    GradientStop{
                        position: 0.33
                        color: "yellow"
                    }
                    GradientStop{
                        position: 1.0
                        color: "blue"
                    }
                }

                rotation: 90 // 整个矩形旋转，但是视图效果不好

                border.color: "grey"
                border.width: 2
                radius: 12
            }
        }

    }

    Component.onCompleted: {
        console.log("visible children:",item.visibleChildren.length)
    }
}
