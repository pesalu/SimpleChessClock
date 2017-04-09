import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

GridLayout {
//    id: comboboxGrid
    property alias hours: hoursChooser.textAt(currentIndex)*1
    property alias minutes: minutesChooser.textAt(currentIndex)*1
    property alias seconds: secondsChooser.textAt(currentIndex)*1

    columns: 3
    anchors.horizontalCenter: parent.horizontalCenter
    ComboBox{
        id:hoursChooser
        model: createIntegerList(0,24)
        onActivated: {
            emit
//            clock1.hours = textAt(currentIndex)*1;
//            clock2.hours = textAt(currentIndex)*1;
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

