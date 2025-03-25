import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World - Qt WebAssembly Test")

    Rectangle {
        id: background
        anchors.fill: parent
        anchors.rightMargin: 5
        color: "red"

        Text {
            anchors.centerIn: parent
            text: "Qt WebAssembly Test"
            font.pixelSize: 24
            color: "white"
        }

        // Вариант 1: Только Button (удалите MouseArea и Text внутри Rectangle)
        Button {
            width: 100
            height: 50
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 20
            text: "Click me"
            onClicked: {
                background.color = background.color === "red" ? "green" : "red"
            }
        }
    }
}
