import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import FramelessWindow 1.0
/*
Window {
    id:root
    width: 1640
    height: 780
    visible: true
   // title: qsTr("Hello World")
     property bool isMoveWindow: false
    property point winpos: Qt.point(x,y)

    //flags:  Qt.WindowSystemMenuHint| Qt.Window
    flags:  Qt.WindowTitleHint|Qt.Window|Qt.FramelessWindowHint
    ColumnLayout{
    id:root1
    anchors.fill: parent
    Rectangle{
        id:title
    Layout.fillWidth: true
    Layout.preferredHeight: 60
    border.width: 2

    RowLayout{

    id:mme
   width: 150
height:parent.height
anchors.right: parent.right


Label{
    color: "#ddcfcdcd"
     font.pointSize: 24
    font.family: "iconfont"
Layout.fillHeight: true
Layout.fillWidth: true
 text: "\uE6C6"
}
Label{
     color: "#ddcfcdcd"
     font.pointSize: 24
    font.family: "iconfont"
Layout.fillHeight: true
Layout.fillWidth: true
  text: "\uE6BB"
}
Label{
     color: "#ddcfcdcd"
     font.pointSize: 24
font.family: "iconfont"
Layout.fillHeight: true
Layout.fillWidth: true
 text: "\uE633"

}

    }
MouseArea{
anchors.fill: title
//只接收鼠标左键
acceptedButtons: Qt.LeftButton
// 接收鼠标按下事件
onPressed: {
root.winpos=Qt.point(mouseX,mouseY)

}
onMouseXChanged: {




        root.x += mouseX - root.winpos.x;

}
onMouseYChanged: {

    root.y += mouseY - root.winpos.y;
}

}
    }
    Rectangle{
         id:content
    Layout.fillWidth: true
    Layout.fillHeight: true
    }


    }


}
*/

FramelessWindow{
    id: root
    visible: true
    width: 1640
    height: 980
    minimumWidth: 480
    minimumHeight: 320

 property bool isMaximized : false

    ColumnLayout{
    id:root1
    anchors.fill: parent
    Rectangle{
        id:title

    Layout.fillWidth: true
    Layout.preferredHeight: 60
    border.width: 2

    RowLayout{

    id:mme
   width: 150
height:parent.height
anchors.right: parent.right


Text{
id:minbt
    color: "#ddcfcdcd"
     font.pointSize: 24
    font.family: "iconfont"
Layout.fillHeight: true
Layout.fillWidth: true
text: "\uE6C6"
horizontalAlignment: Text.AlignHCenter
verticalAlignment: Text.AlignVCenter
MouseArea{
anchors.fill: parent
onClicked: {
    root.showMinimized()
}
}
}
Text{
     color: "#ddcfcdcd"
     font.pointSize: 24
    font.family: "iconfont"
Layout.fillHeight: true
Layout.fillWidth: true
  text: "\uE6BB"
  horizontalAlignment: Text.AlignHCenter
  verticalAlignment: Text.AlignVCenter
  MouseArea{anchors.fill: parent
  onClicked:  if(isMaximized){
                  isMaximized = false;
                  root.showNormal();
                //  normBtnBg.source = "qrc:/res/maximinze_btn.png"
              }else{
                  isMaximized = true;
                  root.showMaximized();
                  //normBtnBg.source = "qrc:/res/norm_btn.png"
              }

  }
}
Text{
     color: "#ddcfcdcd"
     font.pointSize: 24
font.family: "iconfont"
Layout.fillHeight: true
Layout.fillWidth: true
 text: "\uE633"
 horizontalAlignment: Text.AlignHCenter
 verticalAlignment: Text.AlignVCenter
 MouseArea{
 anchors.fill: parent
 onClicked: {
     root.close()
 }
 }
}

    }
  }
    Rectangle{
        id:content

    Layout.fillWidth: true
    Layout.fillHeight: true
    }


    }

}
/*##^##
Designer {
    D{i:0;formeditorZoom:0.25}
}
##^##*/
