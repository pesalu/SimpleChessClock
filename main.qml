import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
//import "Clock.qml"
/*
  - ToDo: make combobox to show running time
  - make separate file for clock -object
  */

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 400
    title: qsTr("Chess Clock")

    //JavaScript for creating a list of integers
    function createIntegerList(lowEnd, highEnd){
        var list = [];
        for (var i = lowEnd; i <= highEnd; i++) {
            list.push(i);
        }
            return list
    }

    //JavaScript function for zero padding
    function pad(num, size) {
        var s = num+"";
        while (s.length < size) s = "0" + s;
        return s;
    }

    //Non-visible objects
    Clock{
        id: clock1
    }

    Clock{
        id: clock2
    }

    GridLayout {
        id: mainGrid
        columns: 1
        anchors.horizontalCenter: parent.horizontalCenter

        //First element
        GridLayout {
            id: comboboxGrid
            columns: 3
            anchors.horizontalCenter: parent.horizontalCenter
            ComboBox{                
                id:hoursChooser
                model: createIntegerList(0,24)
                onActivated: {
                    clock1.hours = textAt(currentIndex)*1;
                    clock2.hours = textAt(currentIndex)*1;
                }
            }

            ComboBox{
                id:minutesChooser
                model: createIntegerList(0,60)
                onActivated: {
                    clock1.minutes = textAt(currentIndex)*1;
                    clock2.minutes = textAt(currentIndex)*1;
                }
            }

            ComboBox{
                id:secondsChooser
                model: createIntegerList(0,60)
                onActivated: {
                    clock1.seconds = textAt(currentIndex)*1;
                    clock2.seconds = textAt(currentIndex)*1;
                }
            }
        }


        Button{
            id: start_stop_button
            text: "Start"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
//                    clock1.timer.running == false ? clock1.timer.start() : clock1.timer.stop()
//                    text == "Start" ? text = "Stop" : text = "Start"
                if (!clock1.timer.running && text == "Start") {
                    text = "Stop"
                    clock1.timer.start()
                } else {
                    text = "Start"
                    clock1.timer.stop()
                    clock2.timer.stop()
                }
            }
        }

        Button{
            id: switch_button
            text: "Switch"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                if (clock1.timer.running == true){
                    clock2.timer.start()
                    clock1.timer.stop()
                } else {
                    clock1.timer.start()
                    clock2.timer.stop()
                }
            }
        }

        Button{
            id: reset_button
            text: "Reset"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                clock1.timer.stop()
                clock2.timer.stop()
                clock1.time_in_seconds = 0
                clock1.seconds = 0
                clock1.minutes = 0
                clock1.hours = 0
                clock2.time_in_seconds = 0
                clock2.seconds = 0
                clock2.minutes = 0
                clock2.hours = 0
            }
        }

        //Second element
        GridLayout {
            id: subgrid2
            columns: 2
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
//                    anchors.leftMargin: 20
                    text: pad(clock2.hours,2) + ":" + pad(clock2.minutes,2) + ":" + pad(clock2.seconds,2) //+ "." + clock2.centiseconds;
                    font.pointSize: 50
                    font.bold: true
                }
            }
        }


    }
}
