// 接受 左击：颜色变化；右击：退出程序；双击：灰色
import QtQuick 2.2

Rectangle{
    width:320
    height:240

    MouseArea{
        anchors.fill:parent
        acceptedButtons:Qt.LeftButton | Qt.RightButton // 接受 左击 和 右击
        onClicked:{
            if(mouse.button == Qt.RightButton) // mouse为MouseEvent类型
                Qt.quit();
            else if(mouse.button == Qt.LeftButton){
                color = Qt.rgba((mouse.x%255)/255.0, (mouse.y%255)/255.0, 0.6, 1.0) // 根据鼠标位置计算颜色
            }
        }
        onDoubleClicked:{
            color = "gray"
        }
    }
}
