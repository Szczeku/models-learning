import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")



    Rectangle {
        id:root
        width: 640;
        height: 90;
        color: "#202020"
        anchors.centerIn: parent

        Text {
            id: countryNameAndCapitalText
            text: qsTr("text")
            color: "white"
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }
        }

        Text {
            id: populationText
            text: qsTr("text")
            color: "white"
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
        }
    }


}

