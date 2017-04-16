import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
Item {

    signal startButtonClicked()

    width: 300
    property alias clock: clock
    property alias startButton: startButton

    Clock{
        id: clock
//        Connections {
//            target:startButton
//            onClicked: {
//                if(clock.timer.running == true){
//                    clock.timer.stop()
//                }else if(clock.timer.running == false){
//                    clock.timer.start()
//                }

//                clock.clockStateChanged()
//            }
//        }
    }

    GridLayout{
        id: gridLayout
        rows: 3
        columns: 1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 100

        //First element
        GridLayout {
            id: comboboxGrid
            scale: 0.7
            columns: 3
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: startButton.top
            ComboBox{
                id:hoursChooser
                model: createIntegerList(0,24)
            }

            ComboBox{
                id:minutesChooser
                model: createIntegerList(0,60)
            }

            ComboBox{
                id:secondsChooser
                model: createIntegerList(0,60)
            }
        }


        StartButton{
            id: startButton
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: clockFace.top
            anchors.margins: 20
            onClicked: {
                startButtonClicked()
            }
        }


        ClockFace{
            id: clockFace
            anchors.horizontalCenter: parent.horizontalCenter
            Connections{
                target: clock
                onTimeChanged: {
                    clockFace.sekuntiLukema = clock.time_in_seconds
                    clockFace.minuuttiLukema = clock.time_in_seconds
                    clockFace.tuntiLukema = clock.time_in_seconds
                }
            }

            Connections {
                target:hoursChooser
                onActivated: {
                    clock.hours = hoursChooser.textAt(hoursChooser.currentIndex)*1;
                    clock.setTime(clock.hours, clock.minutes, clock.seconds)
                    clock.timeChanged()
                }
            }
            Connections {
                target:minutesChooser
                onActivated: {
                    clock.minutes = minutesChooser.textAt(minutesChooser.currentIndex)*1;
                    clock.setTime(clock.hours, clock.minutes, clock.seconds)
                    clock.timeChanged()
                }
            }
            Connections {
                target:secondsChooser
                onActivated: {
                    clock.seconds = secondsChooser.textAt(secondsChooser.currentIndex)*1;
                    clock.setTime(clock.hours, clock.minutes, clock.seconds)
                    clock.timeChanged()
                }
            }
        }

    }

}
