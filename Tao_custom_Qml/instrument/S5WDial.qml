import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0
import QtGraphicalEffects 1.0
import "TaoQuick"
CircularGauge {
    id: gauge
    property string unittxt: "Mpa"
    style: CircularGaugeStyle {
        labelStepSize: 5
        labelInset: outerRadius / 2.2
        tickmarkInset: outerRadius / 4.2
        minorTickmarkInset: outerRadius / 4.2
        minimumValueAngle: -144
        maximumValueAngle: 144

        background: Rectangle {
            implicitHeight: gauge.height
            implicitWidth: gauge.width
         //   color: "black"
             color: CusConfig.themeColor
            anchors.centerIn: parent
            radius: 360

            Image {
                anchors.fill: parent
                source: "qrc:/img/background.svg"
                asynchronous: true
                sourceSize {
                    width: width
                }
            }

            Canvas {
                property int value: gauge.value

                anchors.fill: parent
                onValueChanged: requestPaint()

                function degreesToRadians(degrees) {
                  return degrees * (Math.PI / 180);
                }

                onPaint: {
                    var ctx = getContext("2d");
                    ctx.reset();
                    ctx.beginPath();
                    ctx.strokeStyle = "black"
                    ctx.lineWidth = outerRadius
                    ctx.arc(outerRadius,
                          outerRadius,
                          outerRadius - ctx.lineWidth / 2,
                          degreesToRadians(valueToAngle(gauge.value) - 90),
                          degreesToRadians(valueToAngle(gauge.maximumValue + 1) - 90));
                    ctx.stroke();
                }
            }
        }

        needle: Item {
            y: -outerRadius * 0.78
            height: outerRadius * 0.27
            Image {
                id: needle
                source: "qrc:/img/needle.svg"
                height: parent.height
                width: height * 0.1
                asynchronous: true
                antialiasing: true
            }

            Glow {
              anchors.fill: needle
              radius: 5
              samples: 10
              color: "white"
              source: needle
          }
        }

        foreground: Item {
            Text {
                id: speedLabel
                anchors.centerIn: parent
               // anchors.horizontalCenter: Qt.Horizontal
               // anchors.bottom: parent.bottom
                text: gauge.value.toFixed(1)
                font.pixelSize: outerRadius * 0.5
               // color: "white"
                color: CusConfig.controlBorderColor
                antialiasing: true
            }
            Text {
                id: unit
               // anchors.centerIn: parent
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                text: unittxt
                font.pixelSize: outerRadius * 0.3
               // color: "white"
                 color: CusConfig.controlBorderColor
                antialiasing: true
            }
        }

        tickmarkLabel:  Text {
            font.pixelSize: Math.max(6, outerRadius * 0.15)
            text: styleData.value
            color: styleData.value <= gauge.value ? "white" : "#777776"
            antialiasing: true
        }

        tickmark: Image {
            source: "qrc:/img/tickmark.svg"
            width: outerRadius * 0.018
            height: outerRadius * 0.15
            antialiasing: true
            asynchronous: true
        }

        minorTickmark: Rectangle {
            implicitWidth: outerRadius * 0.01
            implicitHeight: outerRadius * 0.03

            antialiasing: true
            smooth: true
            color: styleData.value <= gauge.value ? "white" : "darkGray"
        }
    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:480;width:640}
}
##^##*/
