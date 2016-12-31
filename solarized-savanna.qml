import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Controls.Styles 1.3
import QtGraphicalEffects 1.0
//import SddmComponents 2.0

Rectangle { // Full Window
    id: origin
    width: 1200
    height: 750
    FontLoader { id: fontSans ; source: "fonts/ChampagneLimousines.ttf" }
    property bool showLogo: false

    Rectangle {
        id: backgroundColor
        color: "#073642"
        width: parent.width
        height: parent.height
    }
    Image {
        id: backgroundImage
        anchors.bottom: parent.bottom
        source: "images/hills.png"
        visible: false
    }
    Blend {
        id: background
        anchors.fill: backgroundImage
        source: backgroundColor
        foregroundSource: backgroundImage
        mode: "screen"
    }

    Image {
        id: logo
        width: 360
        height: 207
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 10
        source: "images/logo.png"
        visible: showLogo.valueOf()
    }

    Text {
        id: textTime
        x: (parent.width/4) - (this.width/2)
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -32
        color: "#EEE8D5"
        font.family: fontSans.name
        font.pointSize: 48
        horizontalAlignment: Text.AlignHCenter
        text: new Date().toLocaleTimeString(Qt.locale(),"h:mm AP")
    }
    Text {
        id: textDate
        width: textTime.width
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: (this.height)/2
        anchors.horizontalCenter: textTime.horizontalCenter
        leftPadding: 2
        color: "#EEE8D5"
        font.family: fontSans.name
        font.pointSize: 26
        fontSizeMode: Text.HorizontalFit
        horizontalAlignment: Text.AlignHCenter
        text: new Date().toLocaleDateString(Qt.locale(),"ddd MMM d, yyyy")
    }

    Image {
        id: mane
        width: 255
        height: 97
        anchors.verticalCenter: loginBox.top
        anchors.horizontalCenter: loginBox.horizontalCenter
        source: "images/mane.png"
        visible: !showLogo.valueOf()

    }

    Rectangle {
        id: loginBox
        width: 400
        height: 230
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: (this.width/2)
        anchors.verticalCenter: parent.verticalCenter
        color: "#002B36"
        radius: 10

        Text {
            id: loginHeader
            y: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -15
            font.family: fontSans.name
            font.pointSize: 40
            color: "#EEE8D5"
            text: "welcome"
        }

        TextField {
            id: userField
            width: 200
            height: 26
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -15
            anchors.top: loginHeader.bottom
            anchors.topMargin: 15
            font.family: "Verdana"
            font.pointSize: 13
            placeholderText: "username"
            style: TextFieldStyle  {
                padding.left: 10
                textColor: "#073642"
                placeholderTextColor: "#93A1A1"
                background: Rectangle {
                    border.width: 0
                    color: "#EEE8D5"
                }
            }
        }
        TextField {
            id: passField
            x: userField.x
            width: 200
            height: 26
            anchors.top: userField.bottom
            anchors.topMargin: 10
            font.family: "Verdana"
            font.pointSize: 13
            echoMode: 2
            placeholderText: "password"
            style: TextFieldStyle {
                padding.left: 10
                textColor: "#073642"
                placeholderTextColor: "#93A1A1"
                background: Rectangle {
                    border.width: 0
                    color: "#EEE8D5"
                }
            }
        }
        Button {
            id: loginButton
            width: 10
            height: 26
            anchors.left: passField.right
            anchors.leftMargin: 10
            anchors.top: passField.top
            isDefault: true
            style: ButtonStyle {
                background: Image {
                    source: "images/login.png"
                }
            }
        }
        ComboBox {
            id: sessionField
            width: 100
            height: 26
            anchors.top: passField.bottom
            anchors.topMargin: 10
            anchors.right: userField.right
            model: ["KDE Plasma","Something Else"]
            style: ComboBoxStyle {
                selectionColor: "#657B83"
                selectedTextColor: "#073642"
                textColor: "#93A1A1"
                font.family: "Verdana"
                font.pointSize: 8
                background: Rectangle {
                    border.width: 0
                    color: "#073642"
                }
            }
        }

        Image {
            id: decoration
            source: "images/bar.png"
            width: parent.width
            height: 8
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
        }
    }

    Button {
        id: restartButton
        width: 32
        height: 32
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: standbyButton.left
        anchors.rightMargin: 10
        style: ButtonStyle {
            background: Image {
                source: "images/btn-restart.png"
            }
        }
    }
    Button {
        id: standbyButton
        width: 32
        height: 32
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: shutdownButton.left
        anchors.rightMargin: 10
        style: ButtonStyle {
            background: Image {
                source: "images/btn-standby.png"
            }
        }
    }
    Button {
        id: shutdownButton
        width: 32
        height: 32
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        style: ButtonStyle {
            background: Image {
                source: "images/btn-shutdown.png"
            }
        }
    }

    Component.onCompleted: if (userField.text == "") userField.focus = true; else passField.focus = true
}
