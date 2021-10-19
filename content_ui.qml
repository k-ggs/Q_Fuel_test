import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import custom_plot 1.0
import CustomPlot 1.0
Rectangle {
    implicitWidth: 1600
    implicitHeight: 980

    property bool isMaximized : false

       ColumnLayout{
       id:root1
       anchors.fill: parent
       Rectangle{
           id:title

       Layout.fillWidth: true
       Layout.preferredHeight: 60
/*
       RowLayout{

       id:it
      width: 300
   height:parent.height
   anchors.left : parent.left


   Image {



   Layout.fillHeight: true
   Layout.fillWidth: true
   source: "qrc:/img/Resur/construction2.jpg"
   horizontalAlignment: Text.AlignHCenter
   verticalAlignment: Text.AlignVCenter
   }
   Text{
        color: "#e91c1111"
        font.pointSize: 30

   Layout.fillHeight: true
   Layout.fillWidth: true
     text: "--#--"
     horizontalAlignment: Text.AlignHCenter
     verticalAlignment: Text.AlignVCenter
     font.italic: true
     font.bold: true
     MouseArea{
         anchors.fill: parent
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

       }

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

*/
    Taotitle_ui{
        anchors.fill: parent

    }

       }



       Rectangle{
       id:content
       color: Qt.darker(title.color)
       Layout.fillWidth: true
       Layout.fillHeight: true
      // border.width: 1
       ColumnLayout{
       spacing: 1
       anchors.fill: parent
       Item {

       Layout.preferredHeight:content.height*0.7
       Layout.fillWidth: true
          Layout.margins: 1
       RowLayout{
           spacing: 0
       anchors.fill: parent
        Rectangle{
            id:contenplot
       Layout.preferredHeight:content.height*0.7
       Layout.preferredWidth : content.width*0.7
      GridLayout{
          anchors.fill: parent
          columns: 2

       Qcustom{
           id:qcplot
           Layout.fillHeight: true
           Layout.fillWidth: true




       }
       Qcustom{
           id:qcplot2
     Layout.fillHeight: true
     Layout.fillWidth: true

       }
       Qcustom{
           id:qcplot3
     Layout.fillHeight: true
     Layout.fillWidth: true

       }
       Qcustom{
           id:qcplot4
     Layout.fillHeight: true
     Layout.fillWidth: true

       }
       Qcustom{
           id:qcplot5
     Layout.fillHeight: true
     Layout.fillWidth: true

       }
       Qcustom{
           id:qcplot6
     Layout.fillHeight: true
     Layout.fillWidth: true

       }
       Qcustom{
           id:qcplot7
     Layout.fillHeight: true
     Layout.fillWidth: true

       }
       Qcustom{
           id:qcplot8
     Layout.fillHeight: true
     Layout.fillWidth: true

       }
       Qcustom{
           id:qcplot9
     Layout.fillHeight: true
     Layout.fillWidth: true

       }
       Qcustom{
           id:qcplot10
     Layout.fillHeight: true
     Layout.fillWidth: true

       }
       Qcustom{
           id:qcplot11
     Layout.fillHeight: true
     Layout.fillWidth: true

       }
       CustomPlotItem{
           Layout.fillHeight: true
           Layout.fillWidth: true
           id: customPlot

                    background : "white"
                    legend: Legend{ font: "helvetica,-1,8,5,0,0,0,0,0,0"}
                    graphs : [
                        Graph {
                            name : "sin"
                            pen : Pen { color : "blue"; width : 1.0 }
                            scatter : ScatterStyle {
                                brush : "white"
                               // type : Scatter.ssCircle
                                size : 1
                                pen : Pen {	color : "black"; width: 1.0	}
                            }
                            xAxis : Axis {
                                useDefault : true
                                visible : false
                                label : Label {
                                    text : "domain"
                                    font : "helvetica,-1,30,5,0,0,0,0,0,0"
                                    color: "blue"
                                }
                            }
                            yAxis : Axis
                            { visible : false
                                label : Label {
                                    text : "sin"
                                    font : "helvetica,-1,15,5,0,0,0,0,0,0"
                                    color : "red"
                                }
                            }
                        },
                        Graph {
                            name : "parabola"
                            pen : Pen { color : "red"; width : 1.0 }
                            xAxis : Axis {
                            useDefault : true

                            }
                         //   yAxis : Axis
                         //   {
                           //     useDefault : false
                          //  }
                        }
                    ]

                     Timer {
                         interval: 150; running: true; repeat: true

                         property double xCurr: 0.0

                         onTriggered: {

                             var newX = 0.0;
                             var newY =0.0;
                             var newY2=0.0 ;
                         //    for (var i = 0; i < 5; i++)
                          //   {
                                 newX = xCurr;
                                 newY = Math.sin(xCurr*Math.PI/100.0);
                                  newY2 = Math.cos(xCurr*Math.PI/100.0);
                                 xCurr += 1;
                                  customPlot.addData(0,  xCurr,  newY);
                                    customPlot.addData(1,  xCurr,  newY2);
                             console.log(xCurr)
                          //   }



                         }
                     }


                }






      }


        }
        Rectangle{
            id:contentmsg
            Layout.fillWidth: true
            Layout.fillHeight: true


        }
             }


       }
       Rectangle{
       Layout.fillWidth: true
       Layout.fillHeight: true

       Layout.leftMargin: 1
       Layout.rightMargin: 1
       Layout.bottomMargin: 1
       Layout.alignment: Qt.AlignTop
       }
       }

       }


       }
       Component.onCompleted: {

             qcplot.initCustomPlot()
             qcplot2.initCustomPlot()
             qcplot3.initCustomPlot()
             qcplot4.initCustomPlot()
             qcplot5.initCustomPlot()
             qcplot6.initCustomPlot()
             qcplot7.initCustomPlot()
             qcplot8.initCustomPlot()
             qcplot9.initCustomPlot()
             qcplot10.initCustomPlot()
             qcplot11.initCustomPlot()

  //  var domain = [];
  //  var y = [];
  //  var y2 = [];

   // for (var i=0; i<20; ++i)
   // {
   //  domain[i] = i/20.0*10.0;
   //  y[i] = Math.cos(domain[i]*0.8+Math.sin(domain[i]*0.16+1.0))*Math.sin(domain[i]*0.54)+1.4;
   //  y2[i] = domain[i]*domain[i];
  //  }

   // customPlot.addData(0, domain, y);
   //  customPlot.addData(1, domain, y2);
   //  customPlot.setYRange(1, {"lo":-10});
       }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.25}
}
##^##*/
