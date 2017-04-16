import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

/*
  - ToDo 10.04.2017:
        - put background
        - animated buttons
        - fancier time chooser
  */

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 400
    title: qsTr("Chess Clock")
    background: Image{
        source: "images/uusin_taustapaneeli.jpg"
        scale: 2.0
    }

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

    GridLayout {
        id: mainGrid
        columns: 1
        anchors.horizontalCenter: parent.horizontalCenter

        GridLayout{
            anchors.horizontalCenter: parent.horizontalCenter
            columns: 3
            columnSpacing: 20

            ClockWhole{
                id:clockWhole1
                anchors.right: stopButton.left
                Connections{
                    target: clockWhole2
                    onStartButtonClicked: {
                        clockWhole1.clock.timer.start()
                        clockWhole2.clock.timer.stop()
                        clockWhole2.startButton.enabled = false
                        if(stopButton.state == "down"){
                            stopButton.state = "up"
                            if(stopButton.enabled == false){
                                stopButton.enabled = true
                            }
                        }
                        if(clockWhole1.startButton.state == "down" && clockWhole2.startButton.state == "down"){
                            clockWhole1.startButton.state = "up"
//                            clockWhole2.startButton.state = "down"
                        }
                    }
                }
            }

            StopButton{
                id: stopButton
//                source: "images/stop_nappula_pun.png"
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.5
                scale: 1.0
                onClicked: {
                    clockWhole1.clock.timer.stop()
                    clockWhole2.clock.timer.stop()
                    clockWhole1.startButton.state = "up"
                    clockWhole2.startButton.state = "up"
                    clockWhole1.startButton.enabled = true
                    clockWhole2.startButton.enabled = true
                    stopButton.enabled = false
                }
            }

            ClockWhole{
                id:clockWhole2
                Connections{
                    target: clockWhole1
                    onStartButtonClicked: {
                        clockWhole2.clock.timer.start()
                        clockWhole1.clock.timer.stop()
                        clockWhole1.startButton.enabled = false
                        if(stopButton.state == "down"){
                            stopButton.state = "up"
                            if(stopButton.enabled == false){
                                stopButton.enabled = true
                            }
                        }
                        if(clockWhole1.startButton.state == "down" && clockWhole2.startButton.state == "down"){
//                            clockWhole1.startButton.state = "down"
                            clockWhole2.startButton.state = "up"
                        }
                    }
                }
            }

        }
    }
}
