import QtQuick.Shapes
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import Qt5Compat.GraphicalEffects
import Quickshell.Widgets
import Quickshell.Wayland
import QtQuick.Window
import Quickshell.Services.UPower
import Quickshell.Services.SystemTray
import Quickshell.Services.Pipewire
import Quickshell.Services.Mpris
import qs.dark.config
import qs.dark.widgets

Rectangle {
  id: brightnessRoot
  property int columnSpacing: 6
  readonly property int buttonSizes: 40
  readonly property int middleButtonHeight: 100 // extra height that the middle button has
  readonly property int iconSizes: 26
  readonly property int brightnessTextSize: 9
  readonly property int buttonBorderWidth: 0
  readonly property int buttonFloatAmount: 4
  // brightness control stuff (im sleep deprived)
  property bool useDdcutil: false
  property bool brightnessChecked: false

  // brightness is tracked locally so clicks update instantly; the setter only
  // ever sends the latest value and the monitor is polled rarely (DDC is slow)
  property int brightness: -1
  property int pendingBrightness: -1
  property string ddcBus: ""

  // middle button toggles the arrows between monitor brightness and screen vibrance
  // (vibrance is a Hyprland screen shader, see ~/.config/rumda/scripts/vibrance.sh)
  property bool vibranceMode: false
  property int vibrance: 0
  property int pendingVibrance: -1

  function changeValue(delta) {
    if (vibranceMode)
      changeVibrance(delta);
    else
      changeBrightness(delta);
  }

  function changeVibrance(delta) {
    vibrance = Math.max(0, Math.min(100, vibrance + delta));
    pendingVibrance = vibrance;
    if (!vibranceSetter.running)
      applyVibrance();
  }

  function applyVibrance() {
    const value = pendingVibrance;
    pendingVibrance = -1;
    vibranceSetter.command = [Quickshell.env("HOME") + "/.config/rumda/scripts/vibrance.sh", String(value)];
    vibranceSetter.running = true;
  }

  Process {
    id: vibranceSetter
    running: false
    onExited: if (brightnessRoot.pendingVibrance >= 0) brightnessRoot.applyVibrance()
  }

  FileView {
    path: Quickshell.env("HOME") + "/.cache/rumda-vibrance"
    printErrors: false
    onLoaded: brightnessRoot.vibrance = parseInt(text()) || 0
  }

  function changeBrightness(delta) {
    if (brightness < 0)
      return;
    brightness = Math.max(0, Math.min(100, brightness + delta));
    pendingBrightness = brightness;
    if (!brightnessSetter.running)
      applyBrightness();
  }

  function applyBrightness() {
    const value = pendingBrightness;
    pendingBrightness = -1;
    brightnessSetter.command = useDdcutil
      ? ["ddcutil"].concat(ddcBus ? ["--bus", ddcBus] : []).concat(["--sleep-multiplier", "0.1", "--noverify", "setvcp", "10", String(value)])
      : ["brightnessctl", "-c", "backlight", "set", value + "%"];
    brightnessSetter.running = true;
  }

  Process {
    id: brightnessSetter
    running: false
    onExited: if (brightnessRoot.pendingBrightness >= 0) brightnessRoot.applyBrightness()
  }

  Process {
    id: ddcBusDetector
    command: ["sh", "-c", "ddcutil detect --terse 2>/dev/null | grep -oP 'I2C bus:\\s+/dev/i2c-\\K[0-9]+' | head -1"]
    running: false
    stdout: StdioCollector {
      onStreamFinished: {
        brightnessRoot.ddcBus = text.trim();
        brightnessReader.running = true;
      }
    }
  }

  color: Colors.dashModulesColor
  border.width: Config.dashInnerModuleBorderWidth
  border.color: Colors.borderColor
  radius: Config.dashInnerModuleRadius

  Component.onCompleted: {
    brightnessDetector.running = true;
  }

  Process {
    id: brightnessDetector
    command: ["sh", "-c", "brightnessctl -c backlight info 2>/dev/null"]
    running: false

    stdout: SplitParser {
      onRead: data => {
        if (data.trim().length > 0) {
          useDdcutil = false;
          console.log("Using brightnessctl for backlight");
        }
        brightnessChecked = true;
      }
    }

    onExited: code => {
      if (code !== 0) {
        useDdcutil = true;
        console.log("Using ddcutil for external monitor");
        brightnessChecked = true;
      }
        if (useDdcutil)
          ddcBusDetector.running = true;
        else
          brightnessReader.running = true;
    }
  }

  Column {
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    Item {
      id: brightnessControlWrapper
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.verticalCenter: parent.verticalCenter
      width: buttonSizes
      height: ((buttonSizes + buttonFloatAmount) * 2 + brightnessDisplayRect.height + columnSpacing * 2) + 20

      Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: columnSpacing

        Item {
          width: buttonSizes
          height: buttonSizes + buttonFloatAmount

          Rectangle {
            id: brightnessUpButton
            width: buttonSizes
            height: buttonSizes
            anchors.top: parent.top
            anchors.topMargin: mouseAreaBrightnessUp.containsMouse ? -buttonFloatAmount : 0
            anchors.horizontalCenter: parent.horizontalCenter
            radius: Config.dashInnerModuleRadius
            color: mouseAreaBrightnessUp.containsMouse ? Colors.accentColor : Colors.powerButtons
            border.width: buttonBorderWidth
            border.color: Colors.borderColor
            scale: mouseAreaBrightnessUp.containsMouse ? 0.95 : 1.0

            Behavior on scale {
              NumberAnimation {
                duration: 200
              }
            }

            Behavior on color {
              ColorAnimation {
                duration: 200
              }
            }

            Behavior on anchors.topMargin {
              NumberAnimation {
                duration: 200
              }
            }

            MouseArea {
              id: mouseAreaBrightnessUp
              anchors.fill: parent
              cursorShape: Qt.PointingHandCursor
              hoverEnabled: true
              onClicked: {
                brightnessRoot.changeValue(10);
              }
            }

            Image {
              anchors.centerIn: parent
              width: iconSizes - 2
              height: iconSizes - 2
              fillMode: Image.PreserveAspectFit
              antialiasing: true
              smooth: true
              mipmap: true
            }
          }
        }

        Rectangle {
          id: brightnessDisplayRect
          width: buttonSizes
          height: buttonSizes + middleButtonHeight  // i could use a layout but im too sleep deprived imma hardcode this rq (sorry)
          radius: Config.dashInnerModuleRadius
          color: mouseAreaBrightnessDisplay.containsMouse ? Colors.accentColor : Colors.powerButtons
          border.width: buttonBorderWidth
          border.color: Colors.borderColor
          scale: mouseAreaBrightnessDisplay.containsMouse ? 1.05 : 1.0

          Behavior on scale {
            NumberAnimation {
              duration: 200
            }
          }
          Behavior on color {
            ColorAnimation {
              duration: 200
            }
          }

          MouseArea {
            id: mouseAreaBrightnessDisplay
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            onWheel: wheel => brightnessRoot.changeValue(wheel.angleDelta.y > 0 ? 5 : -5)
            onClicked: brightnessRoot.vibranceMode = !brightnessRoot.vibranceMode
          }

          Column {
            anchors.centerIn: parent
            spacing: 5

            Image {
              visible: !brightnessRoot.vibranceMode
              anchors.horizontalCenter: parent.horizontalCenter
              width: iconSizes
              height: iconSizes
              source: `file://${Config.configPath}/light/icons/dashboard/brightness.svg`
              fillMode: Image.PreserveAspectFit
              antialiasing: true
              smooth: true
              mipmap: true
            }
            Text {
              anchors.horizontalCenter: parent.horizontalCenter
              visible: brightnessRoot.vibranceMode
              text: String.fromCodePoint(0xF03D8)
              color: mouseAreaBrightnessDisplay.containsMouse ? Colors.dashModulesColor : Colors.accent2Color
              font.family: "Terminess Nerd Font Propo"
              font.pixelSize: iconSizes
            }

            Text {
              id: brightnessText
              anchors.horizontalCenter: parent.horizontalCenter
              text: brightnessRoot.vibranceMode ? brightnessRoot.vibrance + "%" : brightnessRoot.brightness >= 0 ? brightnessRoot.brightness + "%" : "--"
              color: mouseAreaBrightnessDisplay.containsMouse ? Colors.dashModulesColor : Colors.accent2Color
              font.pixelSize: brightnessTextSize
              font.bold: false

              Behavior on color {
                ColorAnimation {
                  duration: 200
                }
              }

              Process {
                id: brightnessReader
                command: brightnessRoot.useDdcutil
                  ? ["sh", "-c", "ddcutil " + (brightnessRoot.ddcBus ? "--bus " + brightnessRoot.ddcBus : "") + " --sleep-multiplier 0.1 getvcp 10 2>/dev/null | grep -oP 'current value =\\s+\\K[0-9]+'"]
                  : ["sh", "-c", "brightnessctl -c backlight 2>/dev/null | grep -oP '\\(\\K[0-9]+(?=%\\))'"]
                running: false

                stdout: SplitParser {
                  onRead: data => {
                    // don't clobber a value the user is still sending
                    if (!brightnessSetter.running && brightnessRoot.pendingBrightness < 0)
                      brightnessRoot.brightness = parseInt(data.trim());
                  }
                }
              }

              Timer {
                interval: 15000
                running: brightnessRoot.brightnessChecked
                repeat: true
                onTriggered: if (!brightnessSetter.running) brightnessReader.running = true
              }
            }
          }
        }

        Item {
          width: buttonSizes
          height: buttonSizes + buttonFloatAmount

          Rectangle {
            id: brightnessDownButton
            width: buttonSizes
            height: buttonSizes
            anchors.bottom: parent.bottom
            anchors.bottomMargin: mouseAreaBrightnessDown.containsMouse ? -buttonFloatAmount : 0
            anchors.horizontalCenter: parent.horizontalCenter
            radius: Config.dashInnerModuleRadius
            color: mouseAreaBrightnessDown.containsMouse ? Colors.accentColor : Colors.powerButtons
            border.width: buttonBorderWidth
            border.color: Colors.borderColor
            scale: mouseAreaBrightnessDown.containsMouse ? 0.95 : 1.0

            Behavior on scale {
              NumberAnimation {
                duration: 200
              }
            }

            Behavior on color {
              ColorAnimation {
                duration: 200
              }
            }

            Behavior on anchors.bottomMargin {
              NumberAnimation {
                duration: 200
              }
            }

            MouseArea {
              id: mouseAreaBrightnessDown
              anchors.fill: parent
              cursorShape: Qt.PointingHandCursor
              hoverEnabled: true
              onClicked: {
                brightnessRoot.changeValue(-10);
              }
            }

            Image {
              anchors.centerIn: parent
              width: iconSizes - 2
              height: iconSizes - 2
              source: `file://${Config.configPath}/light/icons/dashboard/chevronDOWN.svg`
              fillMode: Image.PreserveAspectFit
              antialiasing: true
              smooth: true
              mipmap: true
            }
          }
        }
      }
    }
  }
}
