import Quickshell // for PanelWindow
import Quickshell.Io
import QtQuick
import Quickshell.Services.UPower
import Quickshell.Services.Pipewire

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
            bottomMargin: 6
            topMargin: 6
        }

        Text {
            id: clock
            color: "white"
            font.family: "Iosevka NF"
            font.pointSize: 12
            font.bold: true
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter

            Process {
                id: dateProc
                command: ["date", "+%a %d %b, %I:%M %p"]
                running: true
                stdout: StdioCollector {
                    onStreamFinished: clock.text = this.text
                }
            }

            Timer {
                interval: (1000 * 60 * 1) // 1000 = 1 sec
                running: true
                repeat: true
                onTriggered: dateProc.running = true
            }
        }

        Text {
            id: battery
            color: "white"
            font.family: "Iosevka NF"
            font.pointSize: 12
            font.bold: true
            anchors.right: clock.left
            anchors.verticalCenter: parent.verticalCenter
            readonly property string sufix: "% | "
            readonly property string prefix: "BAT: "
            property string profile: PowerProfiles.profile.toString()

            function set_text(): string {
                var values = ["powersave", "balanced", "poerformance"]
                this.profile = PowerProfiles.profile.toString() 
                return "[" + values[this.profile] + "] " + prefix + Math.round(UPower.displayDevice.percentage*100) + sufix
            }
            text: set_text()
        }

        Text {
            id: volume
            color: "white"
            font.family: "Iosevka NF"
            font.pointSize: 12
            font.bold: true
            anchors.right: battery.left
            anchors.verticalCenter: parent.verticalCenter
            readonly property string sufix: " | "
            readonly property string prefix: "VOL: "

            property PwNode node: Pipewire.defaultAudioSink
            PwObjectTracker { objects: [volume.node] }
            function set_text(): string {
                if (node.audio.muted) {
                return "Silent" + sufix
                }
                return prefix + Math.round(node.audio.volume*100) + "%" + sufix
            }
            text: set_text()
            }
        }
    }
}

