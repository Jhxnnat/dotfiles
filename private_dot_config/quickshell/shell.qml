import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Services.UPower
import Quickshell.Services.Pipewire
import Quickshell.Services.Mpris

// TODO: rename Volume.qml to Audio.qml

PanelWindow {
    color: "transparent"
    anchors {
        bottom: true
        left: true
        right: true
    }
    margins {
        bottom: 12
        left: 12
        right: 12
    }

    implicitHeight: 32

    Rectangle {
        id: rect_right
        height: parent.height
        color: "black"

        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        border.color: "#444444"
        border.width: 2

        Row {
            id: container_right
            spacing: 10
            anchors {
                left: parent.left
                right: parent.right
                verticalCenter: parent.verticalCenter
                fill: parent
                rightMargin: 12
                leftMargin: 12
                bottomMargin: 6
                topMargin: 6
            }

            Clock {
                id: clock
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
            }

            Power {
                id: power
                anchors.right: clock.left
                anchors.verticalCenter: parent.verticalCenter
            }

            Volume {
                id: volume
                anchors.right: power.left
                anchors.verticalCenter: parent.verticalCenter
            }

            /*Text {
                id: mpris
                color: "white"
                font.family: "Iosevka NF"
                font.pointSize: 12
                font.bold: true
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                readonly property var activePlayer: MprisController.activePlayer

                function set_text(): string {
                    return "[" + activePlayer.trackArtist + "]"
                }
                text: set_text()
            }*/
        }
    }
}

