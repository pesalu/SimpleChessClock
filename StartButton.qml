import QtQuick 2.0
import QtQuick.Controls 2.0

Image{
    id: customButton
    property string stateImg1: "images/kaynnistysnappulat.png"
    property string stateImg2: "images/kaynnistysnappulat2.png"
    property string stateImg: stateImg2
    width: 20

    state: "up"

    signal clicked

    function clickedBtn(){
        mouseArea.clicked(0)
    }

//    signal clicked2

//    property MouseArea mouseArea {
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked:  {
            parent.state == "up" ? parent.state = "down" : parent.state = 'up';
        }
    }

    //Make mousearea's 'clicked'-signal to emit customButton's 'clicked'-signal
    Component.onCompleted: {
        mouseArea.clicked.connect(customButton.clicked)
//        customButton.clicked2.connect(mouseArea.clicked)
    }


    states: [
        State {
            name: "down"
            PropertyChanges { target: customButton; source: stateImg1 }
        },
        State {
            name: "up"
            PropertyChanges { target: customButton; source: stateImg2 }
        }
    ]
}

//Item {
//    Button {
//        onClicked: {
//            clock1.timer.stop()
//            clock2.timer.start()
//            startButton1.enabled = false
//            startButton2.enabled = true
//            stopButton.enabled = true
//        }
//    }
//}
