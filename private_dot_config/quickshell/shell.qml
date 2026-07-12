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

  implicitHeight: 26

  Rectangle {
    id: rect_right
    height: parent.height
    color: "black"
    
    anchors {
      left: parent.left
      right: parent.right
      verticalCenter: parent.verticalCenter
    }

    Row {
      id: container_right
      spacing: 10
      anchors {
        left: parent.left
        right: parent.right
        verticalCenter: parent.verticalCenter
        //centerIn: parent.right
        fill: parent
      }

      Text {
        id: clock
        color: "white"
        font.family: "Iosevka NF"
        font.pointSize: 12
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        Process {
          id: dateProc
          command: ["date", "+%a %d %b  %I:%M %p"]
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
        anchors.right: clock.left
        anchors.verticalCenter: parent.verticalCenter
        //text: UPower.onBattery
        readonly property string sufix: "% | "
        readonly property string prefix: "Bat: "

        function set_text(): string {
            return prefix + Math.round(UPower.displayDevice.percentage*100) + sufix
        }
        text: set_text()

        Timer {
          interval: (1000 * 60) * 5 // 5 min
          running: true
          repeat: true
          onTriggered: baterry.text = set_text()
        }
      }
      
      Text {
        id: volume
        color: "white"
        font.family: "Iosevka NF"
        font.pointSize: 12
        anchors.right: battery.left
        anchors.verticalCenter: parent.verticalCenter
        readonly property string sufix: " | "
        readonly property string prefix: "Vol: "

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

