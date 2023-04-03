import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Week 3 Lesson 1")

    color: "#04223f"

    // population in milions
    ListModel {
        id: countriesModel

        ListElement {
            name: "Poland"
            capital: "Warsaw"
            population: 37.95
        }
        ListElement {
            name: "Greece"
            capital: "Atens"
            population: 10.72
        }
        ListElement {
            name: "France"
            capital: "Paris"
            population: 212.6
        }
    }

    ListView {
        id: countriesListView

        anchors {
            fill: parent
            margins: 20
        }

        clip: true
        spacing: 10

        model: countriesModel

        delegate: Rectangle {
            id: listViewDelegate

            width: countriesListView.width
            height: 50

            color: "#1068bf"

            TextField {
                id: countryNameAndCapitalText

                background: Qt.transparent

                anchors {
                    left: parent.left
                    leftMargin: 10
                    verticalCenter: parent.verticalCenter
                }

                text: (index + 1) + ". " + name + " - " + capital
                color: "white"

                font.bold: true
            }

            TextField {
                id: populationText

                background: Qt.transparent

                anchors {
                    right: parent.right
                    rightMargin: 20
                    verticalCenter: parent.verticalCenter
                }

                text: "Population: " + population + " milions"
                color: "white"
            }

            Button {
                text: "Delete"
                anchors.right: parent.right
                onClicked: {
                    countriesModel.remove(index)
                }
            }
        }
    }



    Button {
        text: "Add"
        anchors {
            top: listViewDelegate.bottom
            margins: 20
        }
        onClicked: {
            countriesModel.append({ "name": "Russia" , "capital": "Moscow" , "population": 143.4 })

        }
    }


}

