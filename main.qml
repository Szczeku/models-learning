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

            AbstractButton {
                id: delButton

                height: 16;
                width: 15;

                background: Qt.transparent

                anchors.right: parent.right
                onClicked: {
                    countriesModel.remove(index)
                }
                Text {
                    text: "x"

                    anchors {
                        centerIn: parent
                        verticalCenter: parent.verticalCenter
                    }
                }
            }

            AbstractButton  {
                id: ediButton

                height: 16;
                width: 30;
                anchors{
                    right: parent.right
                    bottom:  parent.bottom

                }
                onClicked:
                    popup.open()
                Popup {
                    id: popup
                    anchors.centerIn: parent
                    parent: Overlay.overlay
                    width: 300
                    height: 100
                    TextField {
                        id: popupText1

                        anchors{
                            top: parent.top
                        }
                    }

                    TextField {
                        id: popupText2
                        anchors{
                            top: popupText1.bottom
                        }
                    }
                    TextField {
                        id: popupText3
                        anchors{
                            top: popupText2.bottom
                        }
                    }
                    AbstractButton {
                        id: delButton2

                        height: 16;
                        width: 15;

                        background: Qt.transparent

                        anchors.right: parent.right
                        onClicked: {
                            popup.close()
                        }
                        Text {
                            text: "x"

                            anchors {
                                centerIn: parent
                                verticalCenter: parent.verticalCenter
                            }
                        }
                    }

                    AbstractButton {
                        id: enterButton

                        height: 16;
                        width: 30;

                        background: Qt.transparent

                        anchors{
                            left: parent.left
                            bottom:  parent.bottom

                        }

                        onClicked: {
                            name = popupText1.text
                            capital = popupText2.text
                            population = popupText3.text
                        }
                        Text {
                            text: "Accept"

                            anchors {
                                centerIn: parent
                                verticalCenter: parent.verticalCenter
                            }
                        }
                    }


                }
                Text {
                    text: "Edit"

                    anchors {
                        centerIn: parent
                        verticalCenter: parent.verticalCenter
                    }

                }
            }
        }
    }



    Button {
        text: "Add"

        onClicked: {
            countriesModel.append({ "name": "Russia" , "capital": "Moscow" , "population": 143.4 })

        }
    }


}

