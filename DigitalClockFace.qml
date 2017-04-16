import QtQuick 2.0
import QtQuick.Layouts 1.0

//Second element
GridLayout {
    id: subgrid2
    columns: 3
    anchors.horizontalCenter: parent.horizontalCenter

    Rectangle {
        id: rect1
        width: 300 //clock1_label.width
        height: clock1_label.height
        color: "steelblue"
        Text {
            id: clock1_label
            anchors.horizontalCenter: parent.horizontalCenter
            text: pad(clock1.hours,2) + ":" + pad(clock1.minutes,2) + ":" + pad(clock1.seconds,2) //+ "." + clock1.centiseconds;
            font.pointSize: 50
            font.bold: true
        }
    }

    Rectangle {
        id: rect2
        width: 300// clock2_label.width
        height: clock2_label.height
        color: "steelblue"
        anchors.leftMargin: 10
        anchors.left: rect1.right
        Text {
            id: clock2_label
            anchors.horizontalCenter: parent.horizontalCenter
            text: pad(clock2.hours,2) + ":" + pad(clock2.minutes,2) + ":" + pad(clock2.seconds,2) //+ "." + clock2.centiseconds;
            font.pointSize: 50
            font.bold: true
        }
    }
}
