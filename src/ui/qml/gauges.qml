import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    width: 400
    height: 380

    Rectangle {
        id : backgroundcarbon
        width: 400
        height:380
    }

    function setBatteryLevelmAh(mah,percentage) {
        var parsedPercentage = percentage.toFixed(2);
        parsedPercentage = parsedPercentage.substring(2);
        batterygauge.setBatteryGauge(mah,parsedPercentage);
        //console.log(mah + ' ' + parsedPercentage);
        return true;
    }

    function setSpeed(speedinMMs) {
        //console.log(speedinMMs);
        speedgauge.setSpeedGauge(speedinMMs/10);
        return true;
    }

    function setDistance(totalDistance) {
        speedgauge.setSpeedGaugeDistance(totalDistance);
        return true;
    }

    function setDirection(direction) {
        //onsole.log(direction);
        directiongauge.setDirection(direction);

        return true;
    }

    function setTemperature(temperature) {
        //console.log(deltaDistance);
        thermogauge.setTemperature(temperature);
    }


    Rectangle {
        id: speedgauge
        property int needlezero : -120
        property int needle100 : 117
        property int needleangle : needlezero
        width: 200
        height: 200
        anchors.left : parent.left
        anchors.leftMargin: 2
        color : "transparent"

        function setSpeedGauge(speed) {
            speedText.text = speed + ' cm/s';
            speedgauge.needleangle = needlezero + ((needlezero*-1 + needle100)/100 )*speed;
        }

        function setSpeedGaugeDistance(distance) {
            distanceText.text = distance + ' m';

        }

        Image {
            anchors.fill: parent
            source: "defaultgauge"
            sourceSize.width: 200
            sourceSize.height: 200
        }
        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -30

            source: "needle"
            sourceSize.width: 28
            sourceSize.height: 93

            transform:
                Rotation {
                id:rot
                // Transform origin is the middle point of the lower border
                origin {
                    x: 14
                    y: 80
                }

                //angle: -117
                angle: speedgauge.needleangle
                Behavior on angle { SpringAnimation { spring: 10; damping: 0.1 } }
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                //rot.angle = (speedgauge.needle100 + -1*(speedgauge.needlezero))*0.85 + speedgauge.needlezero
//                rot.angle += 10;

//                if(rot.angle >= speedgauge.needle100) {
//                    rot.angle = speedgauge.needlezero;
//                }
            }
        }

        Text {
            anchors.top: parent.top
            anchors.topMargin: parent.width*0.6
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 1
            color : "white"
            text: "Speed"
        }
        Text {
            id: speedText
            anchors.top: parent.top
            anchors.topMargin: parent.width*0.68
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 1
            color : "white"
            text: "- cm/s"
        }
        Text {
            id: distanceText
            anchors.top: parent.top
            anchors.topMargin: parent.width*0.76
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 1
            color : "white"
            text: "- m"
        }

    }

    Rectangle {
        id: directiongauge
        color: "transparent"
        width: 200
        height: 200
        anchors.right: parent.right
        anchors.rightMargin: 2
        property int needlezero : 0
        property int needle100 : 123
        property int needleangle : needlezero

        function setDirection(angle) {
            var newangle = angle + 90;

            rotationcompass.angle = newangle;

            compassdegreeText.text = angle + ' deg'
            return true;
        }


        Image {
            anchors.fill: parent
            source: "compass"
            sourceSize.width: 200
            sourceSize.height: 200
        }
        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -30

            source: "needle"
            sourceSize.width: 28
            sourceSize.height: 93

            transform:
                Rotation {
                id:rotationcompass
                // Transform origin is the middle point of the lower border
                origin {
                    x: 14
                    y: 80
                }

                //angle: -117
                angle: directiongauge.needleangle
                //Behavior on angle { SpringAnimation { spring: 10; damping: 0.1 } }

                //Behavior on angle { SmoothedAnimation { velocity: 100; } }
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                //rotationcompass.angle += 90; Debug
            }
        }

        Text {
            anchors.top: parent.top
            anchors.topMargin: parent.width*0.6
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 1
            color : "white"
            text: "Compass"
        }
        Text {
            id: compassdegreeText
            anchors.top: parent.top
            anchors.topMargin: parent.width*0.68
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 1
            color : "white"
            text: "- Deg"
        }
    }

    Rectangle {
        id: thermogauge
        color: "transparent"
        width: 180
        height: 180
        anchors.bottom: parent.bottom
        anchors.bottomMargin : 4
        anchors.right: parent.right
        anchors.rightMargin: 21
        property int temperature : 0
        property int needlezero : -115
        property int needle100 : 115
        property int needleangle : needlezero

        function setTemperature(temperature) {

            thermogauge.temperature = temperature;

            temperaturemeter.angle = needlezero + 2*((needlezero*-1 + needle100)/100 )*temperature;
            return true;
        }

        Image {
            anchors.fill: parent
            source: "thermometer"
            sourceSize.width: 200
            sourceSize.height: 200
        }
        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -30

            source: "needle"
            sourceSize.width: 28
            sourceSize.height: 93

            transform:
                Rotation {
                id:temperaturemeter
                // Transform origin is the middle point of the lower border
                origin {
                    x: 14
                    y: 80
                }

                //angle: -117
                angle: thermogauge.needleangle
                Behavior on angle { SpringAnimation { spring: 10; damping: 0.1 } }
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {

                //thermogauge.setTemperature(thermogauge.temperature + 10);
            }
        }
        Text {
            anchors.top: parent.top
            anchors.topMargin: parent.width*0.6
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 1
            color : "white"
            text: "Temperature"
        }
        Text {
            id : temperatureText;
            anchors.top: parent.top
            anchors.topMargin: parent.width*0.67
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 1
            color : "white"
            text: thermogauge.temperature + ' C';
        }
    }

    Rectangle {
        id: batterygauge
        color: "transparent"
        width: 180
        height: 180
        anchors.bottom: parent.bottom
        anchors.bottomMargin : 4
        anchors.left: parent.left
        anchors.leftMargin: 21
        property int needlezero : -117
        property int needle100 : 123
        property int needleangle : needlezero

        function setBatteryGauge(mah, percentage) {
            batteryleveltext.text = mah + ' mAh';

            if(percentage > 100) {
                percentage = 100;
            }
            if(percentage < 0 ) {
                percentage = 0;
            }

            batterygauge.needleangle = needlezero + 2*needle100*percentage/100



            return true;
        }

        Image {
            anchors.fill: parent
            source: "defaultgauge"
            sourceSize.width: 200
            sourceSize.height: 200
        }
        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -30

            source: "needle"
            sourceSize.width: 28
            sourceSize.height: 93

            transform:
                Rotation {
                id:rotationbattery
                // Transform origin is the middle point of the lower border
                origin {
                    x: 14
                    y: 80
                }

                //angle: -117
                angle: batterygauge.needleangle
                Behavior on angle { SpringAnimation { spring: 10; damping: 0.1 } }
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {

                //rotationbattery.angle += 10;
            }
        }
        Text {
            anchors.top: parent.top
            anchors.topMargin: parent.width*0.6
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 1
            color : "white"
            text: "Battery %"
        }
        Text {
            id: batteryleveltext
            anchors.top: parent.top
            anchors.topMargin: parent.width*0.68
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 1
            color : "white"
            text: "- mAh"
        }

    }
}
