import QtQuick 2.0

Image {
    source: "images/clock_face1.png"
    scale: 1.2
    rotation: 1

    property alias sekuntiLukema: sekuntiviisari12.seconds
    property alias minuuttiLukema: minuuttiviisari1.minutes
    property alias tuntiLukema: tuntiviisari12.hours

    property int propertyTimeInSeconds

    Rectangle{
        id: sekuntiviisari12
        height: 60
        width: 2
        radius: 50
        color: "darkred"
        x: parent.width*0.51; y: parent.height*0.165
        transformOrigin: Item.Bottom
        rotation: 0

        property double seconds: 0.0

        transform: Rotation {
            origin.x: sekuntiviisari12.width*0.5; origin.y: sekuntiviisari12.height;
            angle: -1 * sekuntiviisari12.seconds * 6
            Behavior on angle {
                SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
            }
        }
    }


//    Image{
//        id:sekuntiviisari1
//        source: "images/iso_viisari.png"
//        rotation: 2.0;
//        scale: 1.0
//        x: parent.width*0.5; y: parent.height*0.2
//        transform: Rotation {
//            origin.x: sekuntiviisari1.width*0.5; origin.y: sekuntiviisari1.height*0.9;
//            angle: -1 * clock1.seconds * 6
//            Behavior on angle {
//                SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
//            }
//        }
//    }

    Image{
        id:minuuttiviisari1
        source: "images/iso_viisari.png"
        rotation: 2.0;
        scale: 1.0
        x: parent.width*0.5; y: parent.height*0.2

        property int minutes: 0

        transform: Rotation {
            origin.x: minuuttiviisari1.width*0.5; origin.y: minuuttiviisari1.height*0.9;
            angle: -1 * (minuuttiviisari1.minutes/60) * 6
            Behavior on angle {
                SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
            }
        }
    }

//    Image{
//        id:tuntiviisari1
//        source: "images/iso_viisari.png"
//        rotation: 2.0;
//        scale: 1.0
//        height: 20
//        x: parent.width*0.5; y: parent.height*0.2
//        transform: Rotation {
//            origin.x: tuntiviisari1.width*0.5; origin.y: tuntiviisari1.height*0.9;
//            angle: -1 * (clock1.time_in_seconds/3600) * 30
//            Behavior on angle {
//                SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
//            }
//        }
//    }

    Rectangle{
        id: tuntiviisari12
        height: 40
        width: 3
        radius: 100
        color: "black"
        x: parent.width*0.518; y: parent.height*0.285
        transformOrigin: Item.Bottom
        rotation: 0

        property int hours

        transform: Rotation {
            origin.x: tuntiviisari12.width*0.5; origin.y: tuntiviisari12.height;
            angle: -1 * (tuntiviisari12.hours/3600) * 30
            Behavior on angle {
                SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
            }
        }
    }



}
