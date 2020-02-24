import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.12

Window {
    id: window
    visible: true
    width: 1024
    height: 768
    title: qsTr("Hello World")
    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
    Image {
        id: permanent_background
        source: "img/background/background.jpg"
        anchors.fill: parent
        AnimatedImage{
            id:spinner
            width: 150
            height: 150
            anchors.verticalCenterOffset: 30
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/icon/Spinner.gif"
        }
    }
    Image {
        id: brand
        z:99
        source: "img/icon/brand.png"
        width: 300
        height: 300
        anchors.verticalCenterOffset: -280
        anchors.horizontalCenterOffset: -5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
    Image {
        id: home
        z:99
        source: "img/button/HOME.png"
        width: 75
        height: 75
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        MouseArea{
            anchors.fill: parent
            onClicked: ui.reset()
            onPressed: parent.opacity = 0.3
            onReleased: parent.opacity = 1
        }
    }
    Image {
        id: welcome
        source: "img/background/background.jpg"
        anchors.fill: parent
        state: ui.welcome
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: welcome
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: welcome
                    opacity: 1
                    enabled: true
                }
            }
        ]
        transitions: [
            Transition {
                NumberAnimation {
                    property: "opacity";
                    easing.type: Easing.InOutQuad;
                    duration: 1000;
                }
            }
        ]

        Image {
            id: welcome_text
            width: 628
            height: 230
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/word/welcome.png"
        }
        AnimatedImage {
            id: start_text
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 130
            anchors.horizontalCenter: parent.horizontalCenter
            source: "img/word/start.gif"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: ui.start()
        }
    }

    Image {
        id: chooseFunction
        source: "img/background/background.jpg"
        anchors.fill: parent
        state: ui.chooseFunction
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: chooseFunction
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: chooseFunction
                    opacity: 1
                    enabled: true
                }
            }
        ]
        transitions: [
            Transition {
                NumberAnimation {
                    property: "opacity";
                    easing.type: Easing.InOutQuad;
                    duration: 1000;
                }
            }
        ]
        Image {
            id: choose_perchase
            source: "img/button/perchase.png"
            width: 200
            height: 200
            anchors.verticalCenterOffset: -50
            anchors.horizontalCenterOffset: -150
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            MouseArea{
                anchors.fill: parent
                onClicked: ui.perchase()
                onPressed: parent.opacity=0.3
                onReleased: parent.opacity=1
            }
        }
    }
    Image {
        id: chooseChannel
        source: "img/background/background.jpg"
        anchors.fill: parent
        state: ui.chooseChannel
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: chooseChannel
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: chooseChannel
                    opacity: 1
                    enabled: true
                }
            }
        ]
        transitions: [
            Transition {
                NumberAnimation {
                    property: "opacity";
                    easing.type: Easing.InOutQuad;
                    duration: 1000;
                }
            }
        ]
        onStateChanged: {
            if(state=="1"){
                ui.setChannel()
            }
        }
        Image {
            id: ch01
            source: "img/channel/ch01.jpg"
            width: 100
            height: 100
            state: ui.ch01
            states: [
                State {
                    name: "0"
                    PropertyChanges {
                        target: ch01
                        opacity: 0.3
                        enabled: false
                    }
                },
                State {
                    name: "1"
                    PropertyChanges {
                        target: ch01
                        opacity: 1
                        enabled: true
                    }
                }
            ]
            anchors.verticalCenterOffset: -300
            anchors.horizontalCenterOffset: -450
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            MouseArea{
                anchors.fill: parent
                onClicked: ui.execFuntion()
                onPressed: parent.opacity=0.3
                onReleased: parent.opacity=1
            }
        }
    }
    Image {
        id: paying
        source: "img/background/background.jpg"
        anchors.fill: parent
        state: ui.paying
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: paying
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: paying
                    opacity: 1
                    enabled: true
                }
            }
        ]
        transitions: [
            Transition {
                NumberAnimation {
                    property: "opacity";
                    easing.type: Easing.InOutQuad;
                    duration: 1000;
                }
            }
        ]
        Image {
            id: qrcode
            width: 200
            height: 200
            anchors.verticalCenterOffset: 150
            anchors.horizontalCenterOffset: 350
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "image://qrcode/"+123123
            sourceSize.width: 200
            sourceSize.height: 200
        }
    }
}
