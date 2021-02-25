import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.11

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QML Signals and slots example - Raymii.org")

    MenuBar {
        width: parent.width
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 20

        Text {
            id: info
            width: parent.width * 0.9
            wrapMode: Text.WordWrap
            text: "QML / C++ binding via signals and slots example program, by Raymii.org. License: GNU GPLv3"
        }


        Text {
            id: labelCount
            // C++ method Counter::value(). Bound via Q_PROPERTY, updates automatically on change
            text: "Counter: " + MyCounter.value + "."
        }

        Text {
            property int changeCount: 0
            id: labelChanged
            text: "Count has changed " + changeCount + " times."
            // Receive the valueChanged NOTIFY
            Connections {
                target: MyCounter
                onValueChanged: {
                    ++labelChanged.changeCount
                }
            }
        }

        Row {
            spacing: 20
            Button {
                text: qsTr("Increase Counter")
                onClicked: ++MyCounter.value
            }

            Button {
                text: qsTr("Set counter to 10")
                // C++ method Counter::setValue(int), bound via Q_PROPERTY
                onClicked: MyCounter.setValue(10)

            }
            Button {
                text: qsTr("Reset")
                onClicked: {
                    // C++ method Counter::setValue(int), bound via Q_PROPERTY
                    MyCounter.setValue(0)
                }
            }
        }

        Row {
            spacing: 20

            Text {
                id: setText
                text: qsTr("Enter counter value: ")
            }
            Rectangle {
                width: setText.width
                height: setText.height
                border.width: 1
                border.color: "black"

                TextInput {
                    id: counterInput
                    focus: true
                    text: MyCounter.value
                }
            }
            // Bi-directional binding, entering a number in the textarea updates the
            // C++ class, if the C++ class is updated, the textarea is updated as well.
            Binding {
                target: MyCounter
                property: "value"
                value: counterInput.text
            }
        }
    }
}

