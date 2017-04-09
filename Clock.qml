import QtQuick 2.0

Item {
//    id: /*clock1*/
    property alias timer: timer1

    property bool stopped: false
    property int hours
    property int minutes
    property int seconds
    property int centiseconds
    property double time_in_seconds: hours*3600 + minutes*60 + seconds

    Timer {
        id: timer1
        interval: 1000; running: false; repeat: true
        onTriggered: {
            if (parent.time_in_seconds <= 0.0){
                stop()
            } else {
                parent.time_in_seconds -= 1.00 //time2.text = Date().toString()
                parent.centiseconds = (parent.time_in_seconds % 1) / 0.01
                parent.seconds = (parent.time_in_seconds % 3600) % 60
                parent.minutes = (parent.time_in_seconds % 3600) / 60
                parent.hours = (parent.time_in_seconds - parent.minutes*60 - parent.seconds) / 3600
            }
        }
    }

}
