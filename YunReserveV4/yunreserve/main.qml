import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.4
import QtQuick.VirtualKeyboard 2.4
import QtQuick.VirtualKeyboard.Settings 2.0
import QtQuick.Controls.Styles 1.2

Window {
    id: window
    visible: true
    width: 1024
    height: 768
//    visibility: Window.FullScreen
    color: "#ffffff"
    title: qsTr("新生文創")
    BusyIndicator{
        width: 100
        height: 100
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }



    Image {
        id: choseChannel
        anchors.fill: parent
        source: "img/background.jpg"
        state: ui.choseChannelVisible
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: choseChannel
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: choseChannel
                    opacity: 1
                    enabled: true
                }
            }
        ]
        onStateChanged: {
            if(state=="1"){
                ui.setChannelVisible()
            }
        }

        transitions: [
            Transition {
                NumberAnimation {
                    property: "opacity";
                    easing.type: Easing.InOutQuad;
                    duration: 1000;
                }
            }
        ]
        Item {
            id: choseChannel_Item
            anchors.fill: parent

            Image {
                id: choseChannel_1
                x: 60
                y: 60
                width: 100
                height: 100
                state: ui.ch1State
                anchors.top: parent.top
                enabled: true
                anchors.left: parent.left
                anchors.topMargin: 20
                anchors.leftMargin: 30
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.restart()

                        ui.setBox_ch(1)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_1
                            opacity: 1
                            source: "img/channel/01-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_1
                            opacity: 0.3
                            source: "img/channel/01-01.jpg"
                            enabled: false
                        }
                    }
                ]
            }

            Image {
                id: choseChannel_2
                y: 60
                width: 100
                height: 100
                state: ui.ch2State
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 20
                anchors.leftMargin: 150
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.restart()

                        ui.setBox_ch(2)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_2
                            opacity: 1
                            source: "img/channel/02-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_2
                            opacity: 0.3
                            source: "img/channel/02-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_3
                x: 300
                y: 60
                width: 100
                height: 100
                state: ui.ch3State
                anchors.top: parent.top
                enabled: false
                anchors.left: parent.left
                anchors.topMargin: 20
                anchors.leftMargin: 270
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.restart()

                        ui.setBox_ch(3)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_3
                            opacity: 1
                            source: "img/channel/03-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_3
                            opacity: 0.3
                            source: "img/channel/03-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_4
                width: 100
                height: 100
                visible: true
                state: ui.ch4State
                anchors.top: parent.top
                enabled: false
                anchors.left: parent.left
                anchors.topMargin: 130
                anchors.leftMargin: 30
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.restart()

                        ui.setBox_ch(4)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_4
                            opacity: 1
                            source: "img/channel/04-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_4
                            opacity: 0.3
                            source: "img/channel/04-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_5
                x: -9
                y: -9
                width: 100
                height: 100
                state: ui.ch5State
                anchors.top: parent.top
                enabled: false
                anchors.left: parent.left
                anchors.topMargin: 130
                anchors.leftMargin: 150
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.restart()

                        ui.setBox_ch(5)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_5
                            opacity: 1
                            source: "img/channel/05-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_5
                            opacity: 0.3
                            source: "img/channel/05-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_6
                x: -9
                y: -9
                width: 100
                height: 100
                visible: true
                state: ui.ch6State
                anchors.top: parent.top
                enabled: false
                anchors.left: parent.left
                anchors.topMargin: 130
                anchors.leftMargin: 270
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.restart()

                        ui.setBox_ch(6)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_6
                            opacity: 1
                            source: "img/channel/06-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_6
                            opacity: 0.3
                            source: "img/channel/06-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_7
                x: -9
                y: -9
                width: 167
                height: 120
                state: ui.ch7State
                anchors.top: parent.top
                enabled: false
                anchors.left: parent.left
                anchors.topMargin: 240
                anchors.leftMargin: 30
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(7)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_7
                            opacity: 1
                            source: "img/channel/07-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_7
                            opacity: 0.3
                            source: "img/channel/07-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_8
                x: -9
                y: -9
                width: 167
                height: 120
                visible: true
                state: ui.ch8State
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 240
                anchors.leftMargin: 203
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(8)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_8
                            opacity: 1
                            source: "img/channel/08-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_8
                            opacity: 0.3
                            source: "img/channel/08-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_9
                x: -9
                y: -9
                width: 167
                height: 120
                visible: true
                state: ui.ch9State
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 366
                anchors.leftMargin: 30
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(9)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_9
                            opacity: 1
                            source: "img/channel/09-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_9
                            opacity: 0.3
                            source: "img/channel/09-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_10
                x: -9
                y: -9
                width: 167
                height: 120
                visible: true
                state: ui.ch10State
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 366
                anchors.leftMargin: 203
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(10)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_10
                            opacity: 1
                            source: "img/channel/10-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_10
                            opacity: 0.3
                            source: "img/channel/10-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_11
                x: 30
                width: 167
                height: 120
                visible: true
                state: ui.ch11State
                anchors.rightMargin: 827
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 492
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(11)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_11
                            opacity: 1
                            source: "img/channel/11-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_11
                            opacity: 0.3
                            source: "img/channel/11-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_12
                x: 203
                width: 167
                height: 120
                visible: true
                state: ui.ch12State
                anchors.rightMargin: 654
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 492
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(12)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_12
                            opacity: 1
                            source: "img/channel/12-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_12
                            opacity: 0.3
                            source: "img/channel/12-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_13
                x: 30
                y: 5
                width: 167
                height: 120
                visible: true
                state: ui.ch13State
                anchors.rightMargin: 827
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 618
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(13)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_13
                            opacity: 1
                            source: "img/channel/11-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_13
                            opacity: 0.3
                            source: "img/channel/11-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_14
                x: 203
                y: 5
                width: 167
                height: 120
                visible: true
                state: ui.ch14State
                anchors.rightMargin: 654
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 618
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(14)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_14
                            opacity: 1
                            source: "img/channel/12-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_14
                            opacity: 0.3
                            source: "img/channel/12-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_15
                x: 656
                y: 69
                width: 100
                height: 100
                state: ui.ch15State
                anchors.rightMargin: 268
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 20
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(15)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_15
                            opacity: 1
                            source: "img/channel/02-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_15
                            opacity: 0.3
                            source: "img/channel/02-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_16
                x: 776
                y: 69
                width: 100
                height: 100
                state: ui.ch16State
                anchors.rightMargin: 148
                anchors.top: parent.top
                anchors.right: parent.right
                enabled: false
                anchors.topMargin: 20
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(16)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_16
                            opacity: 1
                            source: "img/channel/03-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_16
                            opacity: 0.3
                            source: "img/channel/03-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_17
                x: 896
                y: 9
                width: 100
                height: 100
                visible: true
                state: ui.ch17State
                anchors.rightMargin: 28
                anchors.top: parent.top
                anchors.right: parent.right
                enabled: false
                anchors.topMargin: 20
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(17)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_17
                            opacity: 1
                            source: "img/channel/04-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_17
                            opacity: 0.3
                            source: "img/channel/04-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_18
                x: 656
                y: 9
                width: 100
                height: 100
                state: ui.ch18State
                anchors.rightMargin: 268
                anchors.top: parent.top
                anchors.right: parent.right
                enabled: false
                anchors.topMargin: 126
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(18)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_18
                            opacity: 1
                            source: "img/channel/05-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_18
                            opacity: 0.3
                            source: "img/channel/05-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_19
                x: 776
                y: 9
                width: 100
                height: 100
                visible: true
                state: ui.ch19State
                anchors.rightMargin: 148
                anchors.top: parent.top
                anchors.right: parent.right
                enabled: false
                anchors.topMargin: 126
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(19)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_19
                            opacity: 1
                            source: "img/channel/06-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_19
                            opacity: 0.3
                            source: "img/channel/06-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_20
                x: 896
                y: 69
                width: 100
                height: 100
                state: ui.ch20State
                anchors.rightMargin: 28
                anchors.top: parent.top
                anchors.right: parent.right
                enabled: true
                anchors.topMargin: 126
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(20)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_20
                            opacity: 1
                            source: "img/channel/01-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_20
                            opacity: 0.3
                            source: "img/channel/01-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_21
                x: -6
                y: -6
                width: 167
                height: 120
                state: ui.ch21State
                anchors.top: parent.top
                enabled: false
                anchors.left: parent.left
                anchors.topMargin: 240
                anchors.leftMargin: 656
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(21)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_21
                            opacity: 1
                            source: "img/channel/07-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_21
                            opacity: 0.3
                            source: "img/channel/07-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_22
                x: -15
                y: -15
                width: 167
                height: 120
                visible: true
                state: ui.ch22State
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 240
                anchors.leftMargin: 829
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(22)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_22
                            opacity: 1
                            source: "img/channel/08-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_22
                            opacity: 0.3
                            source: "img/channel/08-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_23
                x: -15
                y: -15
                width: 167
                height: 120
                visible: true
                state: ui.ch23State
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 366
                anchors.leftMargin: 656
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(23)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_23
                            opacity: 1
                            source: "img/channel/09-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_23
                            opacity: 0.3
                            source: "img/channel/09-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_24
                x: -15
                y: -15
                width: 167
                height: 120
                visible: true
                state: ui.ch24State
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 366
                anchors.leftMargin: 829
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(24)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_24
                            opacity: 1
                            source: "img/channel/10-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_24
                            opacity: 0.3
                            source: "img/channel/10-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_25
                x: 656
                y: -6
                width: 167
                height: 120
                visible: true
                state: ui.ch25State
                anchors.rightMargin: 201
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 492
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(25)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_25
                            opacity: 1
                            source: "img/channel/11-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_25
                            opacity: 0.3
                            source: "img/channel/11-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_26
                x: 829
                y: -6
                width: 167
                height: 120
                visible: true
                state: ui.ch26State
                anchors.rightMargin: 28
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 492
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(26)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_26
                            opacity: 1
                            source: "img/channel/12-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_26
                            opacity: 0.3
                            source: "img/channel/12-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_27
                x: 656
                y: -1
                width: 167
                height: 120
                visible: true
                state: ui.ch27State
                anchors.rightMargin: 201
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 618
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(27)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_27
                            opacity: 1
                            source: "img/channel/11-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_27
                            opacity: 0.3
                            source: "img/channel/11-01.jpg"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_28
                x: 829
                y: -1
                width: 167
                height: 120
                visible: true
                state: ui.ch28State
                anchors.rightMargin: 28
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 618
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        timer_Reset.start()

                        ui.setBox_ch(28)
                        ui.execFunction()
                    }
                }
                states: [
                    State {
                        name: "1"
                        PropertyChanges {
                            target: choseChannel_28
                            opacity: 1
                            source: "img/channel/12-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_28
                            opacity: 0.3
                            source: "img/channel/12-01.jpg"
                            enabled: false
                        }
                    }]
            }

        }
    }

    Image {
        id: perchase_Paying
        anchors.fill: parent
        source: "img/background.jpg"
        state: ui.perchase_PayingVisible
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: perchase_Paying
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: perchase_Paying
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
        Timer{
            id: timer_displayItemInfo
            interval: 150
            repeat: false
            running: false
            triggeredOnStart: false
            onTriggered: {
                ui.displayQRcode()
                ui.displayItemInfo()
            }
        }
        Timer{
            id: timer_CheckPayment
            interval: 5000
            repeat: true
            running: false
            triggeredOnStart: false
            onTriggered: {
                ui.checkPayment()
            }
        }

        onStateChanged: {
            if(state=="1"){
                timer_displayItemInfo.start()
                timer_CheckPayment.start()
            }
            if(state=="0"){
                timer_CheckPayment.stop()
            }
        }
        Image {
            id: displayQRcode
            x: 747
            y: 489
            width: 200
            height: 200
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 80
            anchors.right: parent.right
            anchors.rightMargin: 80
            source: "image://colors/"+ui.itemQRcode
            sourceSize.width: 200
            sourceSize.height: 200
            //            MouseArea{
            //                anchors.fill: parent
            //                onClicked: {
            //                    ui.checkPayment()
            //                }
            //            }
        }

        Text {
            id: itemName
            text: qsTr("商品名稱：")+ui.itemNameDisplay
            anchors.left: parent.left
            anchors.leftMargin: 160
            anchors.top: parent.top
            anchors.topMargin: 180
            font.pixelSize: 36
        }
        Text {
            id: itemPrice
            text: qsTr("價格：")+ui.itemPriceDisplay
            anchors.left: parent.left
            anchors.leftMargin: 160
            anchors.top: parent.top
            anchors.topMargin: 300
            font.pixelSize: 36
        }
        Text {
            id: itemRemark
            text: qsTr("備註：")+ui.itemRemarkDisplay
            anchors.left: parent.left
            anchors.leftMargin: 160
            anchors.top: parent.top
            anchors.topMargin: 420
            font.pixelSize: 36
        }
    }

    Image {
        id: waitForClose
        source: "img/background.jpg"
        state: ui.waitForCloseVisible
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: waitForClose
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: waitForClose
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
                timer_Reset.stop()
                timer_CheckChannel.start()
                logout_button.enabled = false
            }
            if(state=="0"){
                timer_Reset.stop()
                timer_CheckChannel.stop()
                logout_button.enabled = true
            }
        }
    }



    Image {
        id: upload_thankYou
        source: "img/thankForBuying.jpg"
        anchors.fill: parent
        state: ui.upload_thankYouVisible
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: upload_thankYou
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: upload_thankYou
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
                timer_Reset.stop()
                timer_afterTHX.start()
                logout_button.anchors.horizontalCenterOffset = 60
            }
            if(state=="0"){
                logout_button.anchors.horizontalCenterOffset = 0
            }
        }
        Button {
            id: keepChooseChannel2
            text: qsTr("繼續上架")
            anchors.horizontalCenterOffset: -60
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 12
            onClicked: {
                timer_afterTHX.stop()
                timer_Reset.start()
                ui.keepChooseChannel()
            }
        }

    }

    Image {
        id: takeOff_thankYou
        source: "img/thankForBuying.jpg"
        anchors.fill: parent
        state: ui.takeOff_thankYouVisible
        onStateChanged: {
            if(state=="1"){
                timer_Reset.stop()
                timer_afterTHX.start()
                logout_button.anchors.horizontalCenterOffset = 60
            }
            if(state=="0"){
                logout_button.anchors.horizontalCenterOffset = 0
            }
        }
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: takeOff_thankYou
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: takeOff_thankYou
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
        Button {
            id: keepChooseChannel4
            text: qsTr("繼續下架")
            anchors.horizontalCenterOffset: -60
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 12
            onClicked: {
                timer_afterTHX.stop()
                timer_Reset.start()
                ui.keepChooseChannel()
            }
        }

    }
    Image {
        id: updateItem_thankYou
        source: "img/thankForBuying.jpg"
        anchors.fill: parent
        state: ui.updateItem_thankYouVisible
        onStateChanged: {
            if(state=="1"){
                timer_Reset.stop()
                timer_afterTHX.start()
                logout_button.anchors.horizontalCenterOffset = 60
            }
            if(state=="0"){
                logout_button.anchors.horizontalCenterOffset = 0
            }
        }
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: updateItem_thankYou
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: updateItem_thankYou
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
        Button {
            id: keepChooseChannel3
            text: qsTr("繼續更改")
            anchors.horizontalCenterOffset: -60
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 12
            onClicked: {
                timer_afterTHX.stop()
                timer_Reset.start()
                ui.keepChooseChannel()
            }
        }
    }

    Image {
        id: signup_thankYou
        source: "img/thankForBuying.jpg"
        anchors.fill: parent
        state: ui.signup_thankYouVisible
        onStateChanged: {
            if(state=="1"){
                timer_Reset.stop()
                timer_afterTHX.start()
                logout_button.anchors.horizontalCenterOffset = 60
            }
            if(state=="0"){
                logout_button.anchors.horizontalCenterOffset = 0
            }
        }
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: signup_thankYou
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: signup_thankYou
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
        Text {
            id: name
            text: qsTr("請收mail")
        }
    }


    Image {
        id: updateUser_thankYou
        source: "img/thankForBuying.jpg"
        anchors.fill: parent
        state: ui.updateUser_thankYouVisible
        onStateChanged: {
            if(state=="1"){
                timer_Reset.stop()
                timer_afterTHX.start()
                logout_button.anchors.horizontalCenterOffset = 60
            }
            if(state=="0"){
                logout_button.anchors.horizontalCenterOffset = 0
            }
        }
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: updateUser_thankYou
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: updateUser_thankYou
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

    }




    Image {
        id: forgetUser_thankYou
        source: "img/thankForBuying.jpg"
        anchors.fill: parent
        state: ui.forgetUser_thankYouVisible
        onStateChanged: {
            if(state=="1"){
                timer_Reset.stop()
                timer_afterTHX.start()
                logout_button.anchors.horizontalCenterOffset = 60
            }
            if(state=="0"){
                logout_button.anchors.horizontalCenterOffset = 0
            }
        }
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: forgetUser_thankYou
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: forgetUser_thankYou
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
    }



    Timer{
        id: timer_CheckChannel
        interval: 2000
        repeat: true
        running: false
        triggeredOnStart: false
        onTriggered: {
            ui.checkChannel()
        }
    }


    Timer{
        id: timer_afterTHX
        interval: 1000
        repeat: true
        running: false
        triggeredOnStart: false
        property var a;
        onRunningChanged: {
            if(running==true){
                a = 10;
            }
        }
        onTriggered: {
            reset_counter.c = "距離登出剩餘:"+a+"秒"
            a-=1
            if(a<0){
                ui.reset()
                ui.logout();
                running = false
                reset_counter.c = ""
            }
        }
    }

    Timer{
        id: timer_Reset
        interval: 1000
        repeat: true
        running: false
        triggeredOnStart: false
        property var a;
        onRunningChanged: {
            if(running==true){
                a = 120;
            }
        }
        onTriggered: {
            reset_counter.c = "登出、畫面重製時間剩餘:"+a+"秒"
            a-=1
            if(a<0){
                ui.reset()
                ui.logout();

                running = false
                reset_counter.c = ""
            }
        }
    }

    Image {
        id: upload_ItemInfo
        anchors.fill: parent
        source: "img/background.jpg"
        state: ui.upload_ItemInfoVisible
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: upload_ItemInfo
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: upload_ItemInfo
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
            if(state=="0"){
                upload_ItemName_Field.text = ""
                upload_ItemPrice_Field.text = ""
                upload_ItemRemark_Field.text = ""
            }
        }

        Item {
            id: upload_ItemInfo_Item
            x: 160
            y: 169
            width: 715
            height: 430
            anchors.right: parent.right
            anchors.rightMargin: 149
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 169

            Text {
                id: upload_ItemInfo_Text
                y: 38
                text: qsTr("商品資訊")
                anchors.left: parent.left
                anchors.leftMargin: 262
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 376
                font.pixelSize: 48
            }
            Text {
                id: upload_ItemInfo_notify
                x: 430
                y: 129
                color: "#fa1f1f"
                text: ui.upload_ItemInfo_notify
                anchors.horizontalCenterOffset: 0
                verticalAlignment: Text.AlignBottom
                horizontalAlignment: Text.AlignHCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 313
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
            }

            Text {
                id: upload_ItemName_Text
                y: 158
                text: qsTr("名稱:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 266
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                anchors.leftMargin: 136
                font.pixelSize: 38
            }
            TextField{
                id: upload_ItemName_Field
                y: 157
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 265
                anchors.left: parent.left
                anchors.leftMargin: 258
                onPressed: {
                    timer_Reset.restart()
                    inputPanel.active
                }
                onTextChanged: {
                    timer_Reset.restart()
                }
            }

            Text {
                id: upload_ItemPrice_Text
                x: 3
                y: 263
                text: qsTr("價格:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 161
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                anchors.leftMargin: 136
                font.pixelSize: 38
            }

            TextField {
                id: upload_ItemPrice_Field
                x: -9
                y: 261
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 161
                anchors.left: parent.left
                anchors.leftMargin: 258
                onPressed: {
                    timer_Reset.restart()
                    inputPanel.active
                }
                onTextChanged: {
                    timer_Reset.restart()
                }
            }

            Text {
                id: upload_ItemRemark_Text
                x: 8
                y: 362
                text: qsTr("備註:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 62
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                anchors.leftMargin: 136
                font.pixelSize: 38
            }


            TextField {
                id: upload_ItemRemark_Field
                x: -3
                y: 360
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 62
                anchors.left: parent.left
                anchors.leftMargin: 258
                onPressed: {
                    timer_Reset.restart()
                    inputPanel.active
                }
                onTextChanged: {
                    timer_Reset.restart()
                }
            }

            Button {
                id: upload_ItemInfo_submit
                y: 361
                text: qsTr("送出")
                anchors.left: parent.left
                anchors.leftMargin: 493
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 59
                font.pointSize: 18
                onClicked: {
                    timer_Reset.restart()
                    ui.upload_submit(
                                upload_ItemName_Field.text,
                                upload_ItemPrice_Field.text,
                                upload_ItemRemark_Field.text
                                )
                }
            }
        }
    }
    InputPanel {
        id: inputPanel
        z: 99
        x: window.width*0.25*0
        y: window.height
        width: window.width*0.5*2
        onActiveChanged: {
            if(active) {
                upload_ItemInfo_Item.anchors.bottomMargin+=100
                login_signup_Item.anchors.bottomMargin+=100
                signup_Item.anchors.bottomMargin+=100
                login_Item.anchors.bottomMargin+=100
                updateUser_Item.anchors.bottomMargin+=100
                updateItem_Item.anchors.bottomMargin+=100
                forgetUser_Item.anchors.bottomMargin+=100

            }
            if(!active) {
                login_signup_Item.anchors.bottomMargin-=100
                signup_Item.anchors.bottomMargin-=100
                login_Item.anchors.bottomMargin-=100
                upload_ItemInfo_Item.anchors.bottomMargin-=100
                updateUser_Item.anchors.bottomMargin-=100
                updateItem_Item.anchors.bottomMargin-=100
                forgetUser_Item.anchors.bottomMargin-=100
            }
        }
        Component.onCompleted: {
            VirtualKeyboardSettings.activeLocales=["zh_TW","en_US"]
            VirtualKeyboardSettings.styleName
        }
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

    Button {
        id: logout_button
        x: 518
        y: 686
        z: 98
        text: qsTr("主畫面")
        anchors.horizontalCenterOffset: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 12
        onClicked: {
            timer_Reset.restart()
            timer_afterTHX.stop()
            ui.logout();
            ui.reset();
        }
    }


    Text {
        id: reset_counter
        property var c: ""
        x: 429
        y: 705
        z: 98
        text: c
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 70
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 12
    }

    Image {
        id: forgetUser
        anchors.fill: parent
        source: "img/background.jpg"
        state: ui.forgetUserVisible
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: forgetUser
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: forgetUser
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
            if(state=="0"){
                forgetUser_EmailField.text = ""
            }
        }

        Item {
            id: forgetUser_Item
            x: 222
            y: 251
            width: 581
            height: 266
            anchors.right: parent.right
            anchors.rightMargin: 222
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 251
            Text {
                id: forgetUser_notify
                x: 234
                y: 103
                color: "#f43a3a"
                text: ui.forgetUser_notify
                verticalAlignment: Text.AlignBottom
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 12
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

            }
            Text {
                id: forgetUser_Text
                x: 211
                y: 31
                text: qsTr("找回帳號")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 195
                font.pointSize: 24
            }
            Text {
                id: forgetUser_EmailText
                x: 44
                y: 171
                text: qsTr("電子郵件:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 63
                anchors.right: parent.right
                anchors.rightMargin: 396
                font.pointSize: 20
            }
            TextField{
                id: forgetUser_EmailField
                x: 200
                y: 167
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 59
                onPressed: {
                    inputPanel.active
                }
            }

            Button {
                id: forgetUser_submit
                x: 411
                y: 166
                text: qsTr("送出")
                anchors.right: parent.right
                anchors.rightMargin: 70
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 59
                font.pointSize: 18
                onClicked: {
                    logout_button.enabled = false
                    enabled = false
                    ui.forgetUser_submit(forgetUser_EmailField.text)
                    enabled = true
                    logout_button.enabled = true
                }
            }
        }
    }
    Image {
        id: login_signup
        anchors.fill: parent
        source: "img/background.jpg"
        state: ui.login_signupVisible
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: login_signup
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: login_signup
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
            if(state=="0"){
                login_acc_Field.text = ""
                login_pwd_Field.text = ""

                signup_acc_Field.text = ""
                signup_pwd_Field.text = ""
                signup_bankACC_Field.text = ""
                signup_email_Field.text = ""
                signup_ensureEmail_Field.text = ""
                login_button.opacity = 1
                signup_button.opacity = 1

            }
        }

        Item {
            id: login_signup_Item
            y: 71
            width: 715
            height: 194
            //            anchors.verticalCenter: parent.verticalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 500
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: login_signup_Text
                x: 290
                y: 151
                color: "#fa1717"
                text: ui.login_signup_Text
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.horizontalCenterOffset: 0
                font.pointSize: 12
                verticalAlignment: Text.AlignBottom
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Image {
                id: login_button
                width: 150
                height: 150
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 22
                anchors.horizontalCenterOffset: -parent.width*0.2
                anchors.horizontalCenter: parent.horizontalCenter
                source: "img/alreadyhave_button.png"

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        login_button.opacity = 0.7
                        signup_button.opacity = 1
                        timer_Reset.restart()
                        ui.login()
                    }
                }
            }

            Image {
                id: signup_button
                x: 283
                y: 22
                width: 150
                height: 150
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 22
                anchors.horizontalCenterOffset: 143
                anchors.horizontalCenter: parent.horizontalCenter
                source: "img/signup_button.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        login_button.opacity = 1
                        signup_button.opacity = 0.7
                        timer_Reset.restart()
                        ui.signup()
                    }
                }
            }

        }
        Item {
            id: login_Item
            y: 300
            width: parent.width*0.5
            height: parent.height*0.3
            anchors.horizontalCenterOffset: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 238
            anchors.horizontalCenter: parent.horizontalCenter
            state: ui.login_ItemVisible
            states: [
                State {
                    name: "0"
                    PropertyChanges {
                        target: login_Item
                        opacity: 0
                        enabled: false
                    }
                },
                State {
                    name: "1"
                    PropertyChanges {
                        target: login_Item
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



            Text {
                id: login_acc_text
                y: 65
                text: qsTr("名稱:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 135
                anchors.left: parent.left
                anchors.leftMargin: 64
                font.pointSize: 18
            }
            TextField{
                id: login_acc_Field
                x: 156
                y: 60
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 130
                anchors.right: parent.right
                anchors.rightMargin: 156
                onPressed: {
                    timer_Reset.restart()
                    inputPanel.active
                }
                onTextChanged: {
                    timer_Reset.restart()
                }
            }
            Text {
                id: login_pwd_text
                y: 135
                text: qsTr("密碼:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 65
                anchors.left: parent.left
                anchors.leftMargin: 64
                font.pointSize: 18
            }
            TextField{
                id: login_pwd_Field
                x: 156
                y: 131
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 59
                anchors.right: parent.right
                anchors.rightMargin: 156
                onPressed: {
                    timer_Reset.restart()

                    inputPanel.active
                }
                onTextChanged: {
                    timer_Reset.restart()
                }
            }
            Button{
                id: login_submit
                x: 368
                y: 129
                text: "登入"
                font.pointSize: 18
                anchors.right: parent.right
                anchors.rightMargin: 44
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 59
                onClicked: {
                    enabled = false
                    timer_Reset.restart()

                    ui.getUser(login_acc_Field.text,
                               login_pwd_Field.text)
                    enabled = true
                }
            }
        }
        Item {
            id: signup_Item
            y: 261
            width: parent.width*0.5
            height: parent.height*0.35
            anchors.horizontalCenterOffset: 0
            anchors.bottomMargin: 238
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            state: ui.signup_ItemVisible

            states: [
                State {
                    name: "0"
                    PropertyChanges {
                        target: signup_Item
                        opacity: 0
                        enabled: false
                    }
                },
                State {
                    name: "1"
                    PropertyChanges {
                        target: signup_Item
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

            Text {
                id: signup_acc_Text
                text: qsTr("註冊名稱:")
                anchors.top: parent.top
                anchors.topMargin: 14
                anchors.left: parent.left
                anchors.leftMargin: 36
                font.pointSize: 18
            }
            TextField{
                id: signup_acc_Field
                x: 178
                placeholderText: "此欄位為公開暱稱"
                anchors.right: parent.right
                anchors.rightMargin: 134
                anchors.top: parent.top
                anchors.topMargin: 9
                onPressed: {
                    timer_Reset.restart()

                    inputPanel.active
                }
                onTextChanged: {
                    timer_Reset.restart()
                }
            }

            Text {
                id: signup_pwd_Text
                text: qsTr("設定密碼:")
                anchors.top: parent.top
                anchors.topMargin: 68
                anchors.left: parent.left
                anchors.leftMargin: 36
                font.pointSize: 18
            }
            TextField{
                id: signup_pwd_Field
                x: 178
                anchors.right: parent.right
                anchors.rightMargin: 134
                anchors.top: parent.top
                anchors.topMargin: 63
                onPressed: {
                    timer_Reset.restart()

                    inputPanel.active
                }
                onTextChanged: {
                    timer_Reset.restart()
                }
            }

            Text {
                id: signup_bankACC_Text
                text: qsTr("銀行帳戶:")
                anchors.top: parent.top
                anchors.topMargin: 119
                anchors.left: parent.left
                anchors.leftMargin: 36
                font.pointSize: 18
            }
            TextField{
                id: signup_bankACC_Field
                x: 178
                anchors.right: parent.right
                anchors.rightMargin: 134
                anchors.top: parent.top
                anchors.topMargin: 114
                onPressed: {
                    timer_Reset.restart()

                    inputPanel.active
                }
                onTextChanged: {
                    timer_Reset.restart()
                }
            }

            Text {
                id: signup_email_Text
                text: qsTr("電子郵件:")
                anchors.top: parent.top
                anchors.topMargin: 168
                anchors.left: parent.left
                anchors.leftMargin: 36
                font.pointSize: 18
            }
            TextField{
                id: signup_email_Field
                x: 178
                y: 163
                anchors.right: parent.right
                anchors.rightMargin: 134
                onPressed: {
                    timer_Reset.restart()

                    inputPanel.active
                }
                onTextChanged: {
                    timer_Reset.restart()
                }
            }


            Text {
                id: signup_ensureEmail_Text
                text: qsTr("確認郵件:")
                anchors.top: parent.top
                anchors.topMargin: 221
                anchors.left: parent.left
                anchors.leftMargin: 36
                font.pointSize: 18
            }
            TextField{
                id: signup_ensureEmail_Field
                x: 178
                anchors.right: parent.right
                anchors.rightMargin: 134
                anchors.top: parent.top
                anchors.topMargin: 216
                onPressed: {
                    timer_Reset.restart()

                    inputPanel.active
                }
                onTextChanged: {
                    timer_Reset.restart()
                }
            }

            Button{
                id: signup_submit
                x: 384
                y: 215
                text: "註冊"
                font.pointSize: 18
                onClicked: {
                    enabled = false
                    timer_Reset.restart()
                    ui.signupSubmit(
                                signup_acc_Field.text,
                                signup_pwd_Field.text,
                                signup_bankACC_Field.text,
                                signup_email_Field.text,
                                signup_ensureEmail_Field.text
                                )
                    enabled = true
                }
            }
        }
    }
    Image {
        id: chooseFunction
        anchors.fill: parent
        source: "img/background.jpg"
        state: ui.chooseFunctionVisible
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

        Item {
            id: chooseFunction_Item
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            Image {
                id: brandIcon
                x: 462
                y: 105
                width: 300
                height: 300
                anchors.verticalCenterOffset: -276
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/brandIcon2.png"
            }

            Image {
                id: chooseFunction_perchase
                source: "img/purchaseButton.png"
                width: 200
                height: 200
                anchors.horizontalCenterOffset: -300
                anchors.verticalCenterOffset: -58
                opacity: 1
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        enabled = false
                        timer_Reset.restart()
                        ui.setFunctionHandler(1)
                        ui.choseChannel()
                        enabled = true
                    }
                    onPressed: {
                        parent.opacity = 0.5
                    }
                    onReleased: {
                        parent.opacity = 1
                    }
                }
            }
            Image {
                id: chooseFunction_upload
                source: "img/uploadButton.png"
                width: 200
                height: 200
                anchors.horizontalCenterOffset: 0
                anchors.verticalCenterOffset: -58
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        enabled = false
                        timer_Reset.restart()
                        ui.setFunctionHandler(2)
                        ui.login_signup()
                        enabled = true
                    }
                    onPressed: {
                        parent.opacity = 0.5
                    }
                    onReleased: {
                        parent.opacity = 1
                    }
                }
            }
            Image {
                id: chooseFunction_takeOff
                source: "img/uploadButton.png"
                width: 200
                height: 200
                anchors.horizontalCenterOffset: 300
                anchors.verticalCenterOffset: -58
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        enabled = false
                        timer_Reset.restart()
                        ui.setFunctionHandler(4)
                        ui.login_signup()
                        enabled = true
                    }
                    onPressed: {
                        parent.opacity = 0.5
                    }
                    onReleased: {
                        parent.opacity = 1
                    }
                }
            }
            Image {
                id: chooseFunction_updataItemInfo
                source: "img/uploadButton.png"
                width: 200
                height: 200
                anchors.verticalCenterOffset: 192
                anchors.horizontalCenterOffset: -300
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        enabled = false
                        timer_Reset.restart()
                        ui.setFunctionHandler(3)
                        ui.login_signup()
                        enabled = true
                    }
                    onPressed: {
                        parent.opacity = 0.5
                    }
                    onReleased: {
                        parent.opacity = 1
                    }
                }
            }
            Image {
                id: chooseFunction_updataUserInfo
                source: "img/uploadButton.png"
                width: 200
                height: 200
                anchors.horizontalCenterOffset: 0
                anchors.verticalCenterOffset: 192
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        enabled = false
                        timer_Reset.restart()
                        ui.setFunctionHandler(5)
                        ui.login_signup()
                        enabled = true
                    }
                    onPressed: {
                        parent.opacity = 0.5
                    }
                    onReleased: {
                        parent.opacity = 1
                    }
                }
            }
            Image {
                id: chooseFunction_forgetUser
                source: "img/uploadButton.png"
                width: 200
                height: 200
                anchors.horizontalCenterOffset: 300
                anchors.verticalCenterOffset: 192
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        enabled = false
                        timer_Reset.restart()
                        ui.forgetUser()
                        enabled = true
                    }
                    onPressed: {
                        parent.opacity = 0.5
                    }
                    onReleased: {
                        parent.opacity = 1
                    }
                }
            }

        }
    }
    Image {
        id: updateItem
        source: "img/background.jpg"
        anchors.fill: parent
        state: ui.updateItemVisible
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: updateItem
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: updateItem
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
            if(state=="0"){
                updateItem_RemarkField.text = ""
                updateItem_PriceField.text = ""
                updateItem_NameField.text = ""
            }
        }
        Item {
            id: updateItem_Item
            x: 212
            y: 178
            width: 600
            height: 413
            anchors.rightMargin: 212
            anchors.bottomMargin: 177
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            Button {
                id: updateItem_submit
                x: 662
                y: 269
                text: qsTr("送出")
                anchors.left: parent.left
                anchors.leftMargin: 450
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 102
                font.pointSize: 18
                onClicked: {
                    enabled = false
                    timer_Reset.restart()
                    ui.updateItem_submit(
                                updateItem_NameField.text,
                                updateItem_PriceField.text,
                                updateItem_RemarkField.text
                                )
                    enabled = true
                }
            }

            TextField{
                id: updateItem_RemarkField
                x: 432
                y: 269
                anchors.left: parent.left
                anchors.leftMargin: 220
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 104
                onPressed: {
                    inputPanel.active
                }
            }

            Text {
                id: updateItem_Remark
                x: 73
                y: 273
                text: qsTr("備註:")
                anchors.left: parent.leftText
                anchors.leftMargin: 331
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 107
                font.pointSize: 20
            }

            TextField{
                id: updateItem_PriceField
                x: 432
                y: 197
                anchors.left: parent.left
                anchors.leftMargin: 220
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 176
                onPressed: {
                    inputPanel.active
                }
            }

            TextField{
                id: updateItem_NameField
                x: 432
                y: 123
                anchors.left: parent.left
                anchors.leftMargin: 220
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 250
                onPressed: {
                    inputPanel.active
                }
            }

            Text {
                id: updateItem_NameText
                x: 285
                y: 127
                text: qsTr("商品名稱:")
                anchors.left: parent.left
                anchors.leftMargin: 73
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 253
                font.pointSize: 20
            }

            Text {
                id: updateItem_Price
                x: 285
                y: 200
                text: qsTr("價格:")
                anchors.left: parent.left
                anchors.leftMargin: 73
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 180
                font.pointSize: 20
            }

            Text {
                id: updateItem_Text
                x: 392
                y: 22
                text: qsTr("更改商品資訊")
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 351
                font.pointSize: 24

            }

            Text {
                id: updateItem_notify
                width: 129
                height: 19
                color: "#ff2626"
                text: ui.updateItem_notify
                anchors.verticalCenterOffset: -99
                anchors.horizontalCenterOffset: 1
                font.pointSize: 12
                verticalAlignment: Text.AlignBottom
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
    Image {
        id: welcome
        anchors.fill: parent
        z:99
        source: "img/welcome.jpg"
        state: ui.welcomeVisible
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
        MouseArea{
            anchors.fill: parent
            onClicked: {
                timer_Reset.restart()
                ui.chooseFunction()
            }
        }
        AnimatedImage {
            id: clickNotify
            x: 286
            y: 549
            anchors.verticalCenterOffset: 212
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/clickToStart.gif"
        }
    }
    Image {
        id: thanksForPerchase
        anchors.fill: parent
        source: "img/thankForBuying.jpg"
        state: ui.thanksForPerchaseVisible
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: thanksForPerchase
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: thanksForPerchase
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
                timer_Reset.stop()
                timer_afterTHX.start()
                logout_button.anchors.horizontalCenterOffset=60
            }
            if(state=="0"){
                logout_button.anchors.horizontalCenterOffset=0
            }
        }
        Button {
            id: keepChooseChannel1
            x: 488
            y: 644
            text: qsTr("繼續購物")
            anchors.horizontalCenterOffset: -60
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 12
            onClicked: {
                timer_afterTHX.stop()
                timer_Reset.start()
                ui.keepChooseChannel()
            }
        }
    }
    Image {
        id: updateUser
        anchors.fill: parent
        source: "img/background.jpg"
        state: ui.updateUserVisible
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: updateUser
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: updateUser
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
            updateUser_PWDField.text = ""
            updateUser_BankACCField.text = ""
            updateUser_EmailField.text = ""
        }

        Item {
            id: updateUser_Item
            width: 1024
            height: 768
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            Text {
                id: updateUser_notify
                color: "#ff1212"
                text: ui.updateUser_notify
                font.pointSize: 12
                anchors.verticalCenterOffset: -175
                anchors.horizontalCenterOffset: 1
                verticalAlignment: Text.AlignBottom
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                id: updateUser_Text
                y: 136
                text: qsTr("更改使用者資料")
                anchors.left: parent.left
                anchors.leftMargin: 372
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 592
                font.pointSize: 24
            }
            Text {
                id: updateUser_PWDText
                y: 242
                text: qsTr("更改密碼:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 486
                anchors.left: parent.left
                anchors.leftMargin: 284
                font.pointSize: 24
            }
            TextField{
                id: updateUser_PWDField
                y: 242
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 486
                anchors.left: parent.left
                anchors.leftMargin: 474
            }

            Text {
                id: updateUser_BankACCText
                y: 331
                text: qsTr("銀行帳號:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 397
                anchors.left: parent.left
                anchors.leftMargin: 284
                font.pointSize: 24
            }
            TextField{
                id: updateUser_BankACCField
                y: 331
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 397
                anchors.left: parent.left
                anchors.leftMargin: 474
            }

            Text {
                id: updateUser_EmailText
                y: 417
                text: qsTr("電子郵件:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 311
                anchors.left: parent.left
                anchors.leftMargin: 284
                font.pointSize: 24
            }
            TextField{
                id:updateUser_EmailField
                y: 417
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 311
                anchors.left: parent.left
                anchors.leftMargin: 474
            }



            Button {
                id: updateUser_submit
                y: 499
                text: qsTr("送出")
                anchors.left: parent.left
                anchors.leftMargin: 694
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 227
                font.pointSize: 18
                onClicked: {
                    enabled = false
                    timer_Reset.restart()
                    ui.updateUser_submit(
                                updateUser_PWDField.text,
                                updateUser_BankACCField.text,
                                updateUser_EmailField.text
                                )
                    enabled = true
                }
            }

            Text {
                id: updateUser_EmailText_ensure
                x: 1
                y: 500
                text: qsTr("確認郵件:")
                anchors.leftMargin: 284
                anchors.bottomMargin: 228
                anchors.left: parent.left
                font.pointSize: 24
                anchors.bottom: parent.bottom
            }

            TextField {
                id: updateUser_EmailField_ensure
                x: 1
                y: 500
                anchors.leftMargin: 474
                anchors.bottomMargin: 228
                anchors.left: parent.left
                anchors.bottom: parent.bottom
            }


        }
    }
}








/*##^##
Designer {
    D{i:1;invisible:true}D{i:10;invisible:true}D{i:2;invisible:true}D{i:179;invisible:true}
D{i:178;invisible:true}D{i:192;invisible:true}D{i:195;anchors_x:416;anchors_y:216}
D{i:194;anchors_x:416}D{i:197;anchors_x:203;anchors_y:216;invisible:true}D{i:196;anchors_x:203;anchors_y:216}
D{i:191;invisible:true}D{i:205;anchors_x:123;anchors_y:133;invisible:true}D{i:200;anchors_x:664;anchors_y:133;invisible:true}
D{i:199;anchors_x:664;anchors_y:133;invisible:true}D{i:202;anchors_x:123;anchors_y:133;invisible:true}
D{i:201;anchors_x:664;invisible:true}D{i:204;anchors_height:200;anchors_width:200;anchors_x:123;anchors_y:133;invisible:true}
D{i:203;anchors_height:200;anchors_width:200;anchors_x:123;anchors_y:133;invisible:true}
D{i:198;anchors_x:203;anchors_y:216;invisible:true}D{i:213;anchors_height:200;anchors_width:200;anchors_x:108;anchors_y:88;invisible:true}
D{i:208;anchors_x:123;anchors_y:133;invisible:true}D{i:207;anchors_x:123;anchors_y:133;invisible:true}
D{i:210;anchors_x:694;invisible:true}D{i:209;anchors_x:123;anchors_y:133;invisible:true}
D{i:212;anchors_height:200;anchors_width:200;anchors_x:108;anchors_y:88;invisible:true}
D{i:211;anchors_height:200;anchors_width:200;anchors_x:694;anchors_y:88;invisible:true}
D{i:206;anchors_x:123;anchors_y:133;invisible:true}D{i:221;invisible:true}D{i:216;invisible:true}
D{i:215;invisible:true}D{i:218;invisible:true}D{i:217;invisible:true}D{i:220;invisible:true}
D{i:219;invisible:true}D{i:214;invisible:true}D{i:229;invisible:true}D{i:224;invisible:true}
D{i:223;invisible:true}D{i:226;invisible:true}D{i:225;invisible:true}D{i:228;invisible:true}
D{i:227;invisible:true}D{i:222;invisible:true}D{i:232;invisible:true}D{i:231;invisible:true}
D{i:234;invisible:true}D{i:233;invisible:true}D{i:236;invisible:true}D{i:235;invisible:true}
D{i:230;invisible:true}D{i:239;invisible:true}D{i:238;invisible:true}D{i:241;invisible:true}
D{i:240;invisible:true}D{i:243;invisible:true}D{i:242;invisible:true}D{i:237;invisible:true}
D{i:244;invisible:true}D{i:245;invisible:true}D{i:246;invisible:true}D{i:255;invisible:true}
D{i:256;invisible:true}D{i:249;invisible:true}D{i:248;invisible:true}D{i:251;invisible:true}
D{i:250;invisible:true}D{i:252;invisible:true}D{i:247;invisible:true}D{i:269;anchors_height:200;anchors_width:200}
D{i:264;invisible:true}D{i:270;invisible:true}D{i:271;invisible:true}D{i:280;invisible:true}
D{i:281;anchors_height:200;anchors_width:200;invisible:true}D{i:282;anchors_height:200;anchors_width:200;invisible:true}
D{i:283;invisible:true}D{i:284;invisible:true}D{i:279;invisible:true}D{i:274;invisible:true}
D{i:273;anchors_height:200;anchors_width:200;invisible:true}D{i:276;invisible:true}
D{i:275;invisible:true}D{i:278;anchors_height:200;anchors_width:200;invisible:true}
D{i:277;anchors_height:200;anchors_width:200;invisible:true}D{i:272;invisible:true}
D{i:293;invisible:true}D{i:295;anchors_height:150;invisible:true}D{i:294;invisible:true}
D{i:297;invisible:true}D{i:296;invisible:true}D{i:292;invisible:true}D{i:305;invisible:true}
D{i:306;invisible:true}D{i:307;invisible:true}D{i:308;invisible:true}D{i:309;invisible:true}
D{i:300;invisible:true}D{i:299;invisible:true}D{i:302;invisible:true}D{i:301;invisible:true}
D{i:304;anchors_height:150;invisible:true}D{i:303;anchors_height:150;invisible:true}
D{i:298;invisible:true}D{i:317;invisible:true}D{i:318;invisible:true}D{i:319;anchors_height:150;invisible:true}
D{i:320;anchors_height:150;invisible:true}D{i:325;invisible:true}D{i:327;anchors_height:150;invisible:true}
D{i:312;anchors_height:150;invisible:true}D{i:311;anchors_height:150;invisible:true}
D{i:314;invisible:true}D{i:313;invisible:true}D{i:316;invisible:true}D{i:315;invisible:true}
D{i:310;invisible:true}D{i:287;invisible:true}D{i:286;invisible:true}D{i:289;invisible:true}
D{i:288;invisible:true}D{i:291;invisible:true}D{i:290;invisible:true}D{i:285;invisible:true}
D{i:336;anchors_height:200;anchors_width:200;invisible:true}D{i:338;invisible:true}
D{i:337;anchors_height:200;anchors_width:200;invisible:true}D{i:340;invisible:true}
D{i:339;invisible:true}D{i:342;invisible:true}D{i:341;invisible:true}D{i:344;anchors_height:768;anchors_width:1024;invisible:true}
D{i:343;anchors_height:768;anchors_width:1024;invisible:true}D{i:346;invisible:true}
D{i:345;anchors_height:200;anchors_width:200;invisible:true}D{i:348;invisible:true}
D{i:347;invisible:true}D{i:335;anchors_height:768;anchors_width:1024;invisible:true}
D{i:330;invisible:true}D{i:329;invisible:true}D{i:331;invisible:true}D{i:334;invisible:true}
D{i:333;invisible:true}D{i:328;anchors_height:150;anchors_width:200}D{i:357;invisible:true}
D{i:358;invisible:true}D{i:359;anchors_height:768;anchors_width:1024;invisible:true}
D{i:360;anchors_height:768;anchors_width:1024;invisible:true}D{i:361;anchors_height:200;anchors_width:200;invisible:true}
D{i:362;invisible:true}D{i:363;invisible:true}D{i:364;invisible:true}D{i:365;invisible:true}
D{i:356;invisible:true}D{i:351;anchors_height:768;anchors_width:1024;invisible:true}
D{i:350;invisible:true}D{i:353;anchors_height:200;anchors_width:200;invisible:true}
D{i:352;anchors_height:768;anchors_width:1024;invisible:true}D{i:355;invisible:true}
D{i:354;invisible:true}D{i:349;invisible:true}D{i:373;invisible:true}D{i:374;invisible:true}
D{i:368;anchors_height:768;anchors_width:1024;invisible:true}D{i:367;anchors_height:768;anchors_width:1024;invisible:true}
D{i:370;invisible:true}D{i:369;invisible:true}D{i:372;invisible:true}D{i:371;invisible:true}
D{i:366;invisible:true}D{i:382;anchors_x:123;anchors_y:133;invisible:true}D{i:377;anchors_x:664;invisible:true}
D{i:376;anchors_height:200;anchors_width:200;invisible:true}D{i:379;anchors_x:123;anchors_y:133;invisible:true}
D{i:378;invisible:true}D{i:381;anchors_x:123;anchors_y:133;invisible:true}D{i:380;invisible:true}
D{i:375;anchors_height:200;anchors_width:200;anchors_x:664;invisible:true}D{i:391;invisible:true}
D{i:392;invisible:true}D{i:393;invisible:true}D{i:394;invisible:true}D{i:395;invisible:true}
D{i:396;invisible:true}D{i:397;invisible:true}D{i:398;invisible:true}D{i:390;invisible:true}
D{i:385;invisible:true}D{i:384;invisible:true}D{i:387;invisible:true}D{i:386;invisible:true}
D{i:389;invisible:true}D{i:388;invisible:true}D{i:383;invisible:true}
}
##^##*/
