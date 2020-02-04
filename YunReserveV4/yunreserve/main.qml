import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.4
import QtQuick.VirtualKeyboard 2.4
import QtQuick.VirtualKeyboard.Settings 2.0

Window {
    id: window
    visible: true
    width: 1024
    height: 768
    color: "#ffffff"
    title: qsTr("新生文創")
    BusyIndicator{
        width: 100
        height: 100
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Image {
        id: welcome
        anchors.fill: parent
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
                timer_Reset.start()
                ui.chooseFunction()
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
            anchors.fill: parent

            Image {
                id: chooseFunction_perchase
                source: "img/purchaseButton.jpg"
                width: 150
                height: 100
                anchors.verticalCenterOffset: -parent.height*0
                anchors.horizontalCenterOffset: -parent.width*0.2
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        db.receiveFunctionHandler(1)
                        ui.setFunctionHandler(1)
                        ui.choseChannel()
                    }
                }
            }
            Image {
                id: chooseFunction_upload
                source: "img/uploadButton.png"
                width: 150
                height: 100
                anchors.verticalCenterOffset: -parent.height*0
                anchors.horizontalCenterOffset: -parent.width*0
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            Image {
                id: chooseFunction_takeOff
                source: "img/uploadButton.png"
                width: 150
                height: 100
                anchors.verticalCenterOffset: -parent.height*0
                anchors.horizontalCenterOffset: +parent.width*0.2
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            Image {
                id: chooseFunction_updataItemInfo
                source: "img/uploadButton.png"
                width: 150
                height: 100
                anchors.verticalCenterOffset: parent.height*0.15
                anchors.horizontalCenterOffset: -parent.width*0.2
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            Image {
                id: chooseFunction_updataUserInfo
                source: "img/uploadButton.png"
                width: 150
                height: 100
                anchors.verticalCenterOffset: parent.height*0.15
                anchors.horizontalCenterOffset: -parent.width*0
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            Image {
                id: chooseFunction_forgetUser
                source: "img/uploadButton.png"
                width: 150
                height: 100
                anchors.verticalCenterOffset: parent.height*0.15
                anchors.horizontalCenterOffset: +parent.width*0.2
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
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
                state: db.ch1State
                anchors.top: parent.top
                enabled: true
                anchors.left: parent.left
                anchors.topMargin: 20
                anchors.leftMargin: 30
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        ui.setBox_ch(1)
                        ui.execFunction()
                        db.setBox_ch(1)
                        db.execFunction()
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
                state: db.ch2State
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 20
                anchors.leftMargin: 150
                MouseArea {
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
                state: db.ch3State
                anchors.top: parent.top
                enabled: false
                anchors.left: parent.left
                anchors.topMargin: 20
                anchors.leftMargin: 270
                MouseArea {
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
                state: db.ch4State
                anchors.top: parent.top
                enabled: false
                anchors.left: parent.left
                anchors.topMargin: 130
                anchors.leftMargin: 30
                MouseArea {
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
                state: db.ch5State
                anchors.top: parent.top
                enabled: false
                anchors.left: parent.left
                anchors.topMargin: 130
                anchors.leftMargin: 150
                MouseArea {
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
                state: db.ch6State
                anchors.top: parent.top
                enabled: false
                anchors.left: parent.left
                anchors.topMargin: 130
                anchors.leftMargin: 270
                MouseArea {
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
                state: database.ch7State
                anchors.top: parent.top
                enabled: false
                anchors.left: parent.left
                anchors.topMargin: 240
                anchors.leftMargin: 30
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_7
                            opacity: 1
                            source: "img/channel/07-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "unavailable"
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
                state: database.ch8State
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 240
                anchors.leftMargin: 203
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_8
                            opacity: 1
                            source: "img/channel/08-01.jpg"
                        }
                    },
                    State {
                        name: "unavailable"
                        PropertyChanges {
                            target: choseChannel_8
                            opacity: 0.3
                            source: "img/channel/08-01.jpg"
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
                state: database.ch9State
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 366
                anchors.leftMargin: 30
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_9
                            opacity: 1
                            source: "img/channel/09-01.jpg"
                        }
                    },
                    State {
                        name: "unavailable"
                        PropertyChanges {
                            target: choseChannel_9
                            opacity: 0.3
                            source: "img/channel/09-01.jpg"
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
                state: database.ch10State
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 366
                anchors.leftMargin: 203
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_10
                            opacity: 1
                            source: "img/channel/10-01.jpg"
                        }
                    },
                    State {
                        name: "unavailable"
                        PropertyChanges {
                            target: choseChannel_10
                            opacity: 0.3
                            source: "img/channel/10-01.jpg"
                        }
                    }]
            }

            Image {
                id: choseChannel_11
                x: 30
                width: 167
                height: 120
                visible: true
                state: database.ch11State
                anchors.rightMargin: 827
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 492
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_11
                            opacity: 1
                            source: "img/channel/11-01.jpg"
                        }
                    },
                    State {
                        name: "unavailable"
                        PropertyChanges {
                            target: choseChannel_11
                            opacity: 0.3
                            source: "img/channel/11-01.jpg"
                        }
                    }]
            }

            Image {
                id: choseChannel_12
                x: 203
                width: 167
                height: 120
                visible: true
                state: database.ch12State
                anchors.rightMargin: 654
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 492
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_12
                            opacity: 1
                            source: "img/channel/12-01.jpg"
                        }
                    },
                    State {
                        name: "unavailable"
                        PropertyChanges {
                            target: choseChannel_12
                            opacity: 0.3
                            source: "img/channel/12-01.jpg"
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
                state: database.ch11State
                anchors.rightMargin: 827
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 618
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_13
                            opacity: 1
                            source: "img/channel/11-01.jpg"
                        }
                    },
                    State {
                        name: "unavailable"
                        PropertyChanges {
                            target: choseChannel_13
                            opacity: 0.3
                            source: "img/channel/11-01.jpg"
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
                state: database.ch12State
                anchors.rightMargin: 654
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 618
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_14
                            opacity: 1
                            source: "img/channel/12-01.jpg"
                        }
                    },
                    State {
                        name: "unavailable"
                        PropertyChanges {
                            target: choseChannel_14
                            opacity: 0.3
                            source: "img/channel/12-01.jpg"
                        }
                    }]
            }

            Image {
                id: choseChannel_15
                x: 656
                y: 69
                width: 100
                height: 100
                state: database.ch2State
                anchors.rightMargin: 268
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 20
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_15
                            opacity: 1
                            source: "img/channel/02-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "unavailable"
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
                state: database.ch3State
                anchors.rightMargin: 148
                anchors.top: parent.top
                anchors.right: parent.right
                enabled: false
                anchors.topMargin: 20
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_16
                            opacity: 1
                            source: "img/channel/03-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "unavailable"
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
                state: database.ch4State
                anchors.rightMargin: 28
                anchors.top: parent.top
                anchors.right: parent.right
                enabled: false
                anchors.topMargin: 20
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_17
                            opacity: 1
                            source: "img/channel/04-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "unavailable"
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
                state: database.ch5State
                anchors.rightMargin: 268
                anchors.top: parent.top
                anchors.right: parent.right
                enabled: false
                anchors.topMargin: 126
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_18
                            opacity: 1
                            source: "img/channel/05-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "unavailable"
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
                state: database.ch6State
                anchors.rightMargin: 148
                anchors.top: parent.top
                anchors.right: parent.right
                enabled: false
                anchors.topMargin: 126
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_19
                            opacity: 1
                            source: "img/channel/06-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "unavailable"
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
                state: database.ch1State
                anchors.rightMargin: 28
                anchors.top: parent.top
                anchors.right: parent.right
                enabled: true
                anchors.topMargin: 126
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_20
                            opacity: 1
                            source: "img/channel/01-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "unavailable"
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
                state: database.ch7State
                anchors.top: parent.top
                enabled: false
                anchors.left: parent.left
                anchors.topMargin: 240
                anchors.leftMargin: 656
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_21
                            opacity: 1
                            source: "img/channel/07-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "unavailable"
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
                state: database.ch8State
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 240
                anchors.leftMargin: 829
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_22
                            opacity: 1
                            source: "img/channel/08-01.jpg"
                        }
                    },
                    State {
                        name: "unavailable"
                        PropertyChanges {
                            target: choseChannel_22
                            opacity: 0.3
                            source: "img/channel/08-01.jpg"
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
                state: database.ch9State
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 366
                anchors.leftMargin: 656
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_23
                            opacity: 1
                            source: "img/channel/09-01.jpg"
                        }
                    },
                    State {
                        name: "unavailable"
                        PropertyChanges {
                            target: choseChannel_23
                            opacity: 0.3
                            source: "img/channel/09-01.jpg"
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
                state: database.ch10State
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 366
                anchors.leftMargin: 829
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_24
                            opacity: 1
                            source: "img/channel/10-01.jpg"
                        }
                    },
                    State {
                        name: "unavailable"
                        PropertyChanges {
                            target: choseChannel_24
                            opacity: 0.3
                            source: "img/channel/10-01.jpg"
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
                state: database.ch11State
                anchors.rightMargin: 201
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 492
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_25
                            opacity: 1
                            source: "img/channel/11-01.jpg"
                        }
                    },
                    State {
                        name: "unavailable"
                        PropertyChanges {
                            target: choseChannel_25
                            opacity: 0.3
                            source: "img/channel/11-01.jpg"
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
                state: database.ch12State
                anchors.rightMargin: 28
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 492
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_26
                            opacity: 1
                            source: "img/channel/12-01.jpg"
                        }
                    },
                    State {
                        name: "unavailable"
                        PropertyChanges {
                            target: choseChannel_26
                            opacity: 0.3
                            source: "img/channel/12-01.jpg"
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
                state: database.ch11State
                anchors.rightMargin: 201
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 618
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_27
                            opacity: 1
                            source: "img/channel/11-01.jpg"
                        }
                    },
                    State {
                        name: "unavailable"
                        PropertyChanges {
                            target: choseChannel_27
                            opacity: 0.3
                            source: "img/channel/11-01.jpg"
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
                state: database.ch12State
                anchors.rightMargin: 28
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 618
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_28
                            opacity: 1
                            source: "img/channel/12-01.jpg"
                        }
                    },
                    State {
                        name: "unavailable"
                        PropertyChanges {
                            target: choseChannel_28
                            opacity: 0.3
                            source: "img/channel/12-01.jpg"
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
            source: "image://colors/"+db.itemQRcode
            sourceSize.width: 200
            sourceSize.height: 200
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    ui.checkPayment()
                }
            }
        }

        Text {
            id: itemName
            text: qsTr("商品名稱：")+db.itemName
            anchors.left: parent.left
            anchors.leftMargin: 160
            anchors.top: parent.top
            anchors.topMargin: 180
            font.pixelSize: 36
        }
        Text {
            id: itemPrice
            text: qsTr("價格：")+db.itemPrice
            anchors.left: parent.left
            anchors.leftMargin: 160
            anchors.top: parent.top
            anchors.topMargin: 300
            font.pixelSize: 36
        }
        Text {
            id: itemRemark
            text: qsTr("備註：")+db.itemRemark
            anchors.left: parent.left
            anchors.leftMargin: 160
            anchors.top: parent.top
            anchors.topMargin: 420
            font.pixelSize: 36
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

        Item {
            id: login_signup_Item
            width: 715
            anchors.horizontalCenterOffset: 0
            anchors.leftMargin: 155
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            anchors.topMargin: 75
            anchors.bottomMargin: 492
            Image {
                id: login_button
                width: 150
                height: 100
                anchors.horizontalCenterOffset: -parent.width*0.2
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/alreadyhave_button.png"
            }
            Image {
                id: signup_button
                width: 150
                height: 100
                anchors.horizontalCenterOffset: +parent.width*0.2
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/signup_button.png"
            }

        }
        Item {
            id: login_Item
            width: parent.width*0.5
            height: parent.height*0.3
            anchors.verticalCenterOffset: -parent.height*0.05
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter


            Text {
                id: login_acc_text
                text: qsTr("名稱:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 135
                anchors.left: parent.left
                anchors.leftMargin: 100
                font.pointSize: 18
            }
            TextField{
                id: login_acc_Field
                anchors.right: parent.right
                anchors.rightMargin: 120
                anchors.top: parent.top
                anchors.topMargin: 60
                onPressed: {
                    inputPanel.active
                }

            }
            Text {
                id: login_pwd_text
                y: 135
                text: qsTr("密碼:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 65
                anchors.left: parent.left
                anchors.leftMargin: 100
                font.pointSize: 18
            }
            TextField{
                id: login_pwd_Field
                x: 192
                y: 131
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 59
                anchors.right: parent.right
                anchors.rightMargin: 120
                onPressed: {
                    inputPanel.active
                }
            }
            Button{
                id: login_submit
                x: 404
                y: 131
                text: "登入"
                font.pointSize: 18
                anchors.right: parent.right
                anchors.rightMargin: 8
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 59
                onClicked: {

                }
            }
        }
        Item {
            id: signup_Item
            width: parent.width*0.5
            height: parent.height*0.35
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height*0.35
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: signup_acc_Text
                text: qsTr("註冊名稱:")
                anchors.top: parent.top
                anchors.topMargin: 14
                anchors.left: parent.left
                anchors.leftMargin: 76
                font.pointSize: 18
            }
            TextField{
                id: signup_acc_Field
                x: 218
                placeholderText: "此欄位為公開暱稱"
                anchors.right: parent.right
                anchors.rightMargin: 94
                anchors.top: parent.top
                anchors.topMargin: 9
                onPressed: {
                    inputPanel.active
                }
            }

            Text {
                id: signup_pwd_Text
                text: qsTr("設定密碼:")
                anchors.top: parent.top
                anchors.topMargin: 68
                anchors.left: parent.left
                anchors.leftMargin: 76
                font.pointSize: 18
            }
            TextField{
                id: signup_pwd_Field
                x: 218
                anchors.right: parent.right
                anchors.rightMargin: 94
                anchors.top: parent.top
                anchors.topMargin: 63
                onPressed: {
                    inputPanel.active
                }
            }

            Text {
                id: signup_bankACC_Text
                text: qsTr("銀行帳戶:")
                anchors.top: parent.top
                anchors.topMargin: 119
                anchors.left: parent.left
                anchors.leftMargin: 76
                font.pointSize: 18
            }
            TextField{
                id: signup_bankACC_Field
                x: 218
                anchors.right: parent.right
                anchors.rightMargin: 94
                anchors.top: parent.top
                anchors.topMargin: 114
                onPressed: {
                    inputPanel.active
                }
            }

            Text {
                id: signup_email_Text
                text: qsTr("電子郵件:")
                anchors.top: parent.top
                anchors.topMargin: 168
                anchors.left: parent.left
                anchors.leftMargin: 76
                font.pointSize: 18
            }
            TextField{
                id: signup_email_Field
                anchors.right: parent.right
                anchors.rightMargin: 94
                onPressed: {
                    inputPanel.active
                }

            }


            Text {
                id: signup_ensureEmail_Text
                text: qsTr("確認郵件:")
                anchors.top: parent.top
                anchors.topMargin: 221
                anchors.left: parent.left
                anchors.leftMargin: 76
                font.pointSize: 18
            }
            TextField{
                id: signup_ensureEmail_Field
                x: 218
                anchors.right: parent.right
                anchors.rightMargin: 94
                anchors.top: parent.top
                anchors.topMargin: 216
                onPressed: {
                    inputPanel.active
                }

            }

            Button{
                id: signup_submit
                x: 424
                y: 215
                text: "註冊"
                font.pointSize: 18
                onClicked: {

                }
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

        Item {
            id: upload_ItemInfo_Item
            anchors.bottomMargin: 0
            anchors.fill: parent


            Text {
                id: upload_ItemInfo_Text
                text: qsTr("商品資訊")
                anchors.left: parent.left
                anchors.leftMargin: 416
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 551
                font.pixelSize: 48
            }

            Text {
                id: upload_ItemName_Text
                y: 216
                text: qsTr("名稱:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 469
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                anchors.leftMargin: 307
                font.pixelSize: 38
            }
            TextField{
                id: upload_ItemName_Field
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 468
                anchors.left: parent.left
                anchors.leftMargin: 429
                onPressed: {
                    inputPanel.active
                }
            }

            Text {
                id: upload_ItemPrice_Text
                x: 3
                y: 216
                text: qsTr("價格:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 364
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                anchors.leftMargin: 307
                font.pixelSize: 38
            }

            TextField {
                id: upload_ItemPrice_Field
                x: -9
                y: 8
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 364
                anchors.left: parent.left
                anchors.leftMargin: 429
                onPressed: {
                    inputPanel.active
                }

            }

            Text {
                id: upload_ItemRemark_Text
                x: 8
                y: 0
                text: qsTr("備註:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 265
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                anchors.leftMargin: 307
                font.pixelSize: 38
            }


            TextField {
                id: upload_ItemRemark_Field
                x: -3
                y: 4
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 265
                anchors.left: parent.left
                anchors.leftMargin: 429
                onPressed: {
                    inputPanel.active
                }

            }

            Button {
                id: upload_ItemInfo_submit
                y: 464
                text: qsTr("送出")
                anchors.left: parent.left
                anchors.leftMargin: 664
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 262
                font.pointSize: 18
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

    }

    Image {
        id: takeOff_thankYou
        source: "img/thankForBuying.jpg"
        anchors.fill: parent
        state: ui.takeOff_thankYouVisible
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

    }

    Image {
        id: updateItem_thankYou
        source: "img/thankForBuying.jpg"
        anchors.fill: parent
        state: ui.updateItem_thankYouVisible
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

    }

    Image {
        id: signup_thankYou
        source: "img/thankForBuying.jpg"
        anchors.fill: parent
        state: ui.signup_thankYouVisible
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

        Item {
            id: updateUser_Item
            anchors.bottomMargin: 0
            anchors.fill: parent
            Text {
                id: updateUser_Text
                y: 203
                text: qsTr("更改使用者資料")
                anchors.left: parent.left
                anchors.leftMargin: 372
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 525
                font.pointSize: 24
            }
            Text {
                id: updateUser_NameText
                y: 275
                text: qsTr("暱稱:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 453
                anchors.left: parent.left
                anchors.leftMargin: 284
                font.pointSize: 24
            }
            TextField{
                id: updateUser_NameField
                y: 275
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 453
                anchors.left: parent.left
                anchors.leftMargin: 474
            }

            Text {
                id: updateUser_BankACCText
                y: 450
                text: qsTr("銀行帳號:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 278
                anchors.left: parent.left
                anchors.leftMargin: 284
                font.pointSize: 24
            }
            TextField{
                id: updateUser_BankACCField
                y: 364
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 364
                anchors.left: parent.left
                anchors.leftMargin: 474
            }

            Text {
                id: updateUser_EmailText
                y: 364
                text: qsTr("電子郵件:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 364
                anchors.left: parent.left
                anchors.leftMargin: 284
                font.pointSize: 24
            }
            TextField{
                id:updateUser_EmailField
                y: 450
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 278
                anchors.left: parent.left
                anchors.leftMargin: 474
            }

            Button {
                id: updateUser_submit
                y: 450
                text: qsTr("送出")
                anchors.left: parent.left
                anchors.leftMargin: 694
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 276
                font.pointSize: 18
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



        Item {
            id: updateItem_Item
            anchors.fill: parent

            Button {
                id: updateItem_submit
                x: 662
                y: 436
                text: qsTr("送出")
                anchors.left: parent.left
                anchors.leftMargin: 662
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 290
                font.pointSize: 18
            }

            TextField{
                id: updateItem_RemarkField
                x: 432
                y: 436
                anchors.left: parent.left
                anchors.leftMargin: 432
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 292
                onPressed: {
                    inputPanel.active
                }
            }

            Text {
                id: updateItem_Remark
                x: 285
                y: 440
                text: qsTr("備註:")
                anchors.left: parent.leftText
                anchors.leftMargin: 331
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 295
                font.pointSize: 20
            }

            TextField{
                id: updateItem_PriceField
                x: 432
                y: 364
                anchors.left: parent.left
                anchors.leftMargin: 432
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 364
                onPressed: {
                    inputPanel.active
                }
            }

            TextField{
                id: updateItem_NameField
                x: 432
                y: 290
                anchors.left: parent.left
                anchors.leftMargin: 432
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 438
                onPressed: {
                    inputPanel.active
                }
            }

            Text {
                id: updateItem_NameText
                x: 285
                y: 294
                text: qsTr("商品名稱:")
                anchors.left: parent.left
                anchors.leftMargin: 285
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 441
                font.pointSize: 20
            }

            Text {
                id: updateItem_Price
                x: 285
                y: 367
                text: qsTr("價格:")
                anchors.left: parent.left
                anchors.leftMargin: 285
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 368
                font.pointSize: 20
            }

            Text {
                id: updateItem_Text
                x: 392
                y: 215
                text: qsTr("更改商品資訊")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 513
                anchors.left: parent.left
                anchors.leftMargin: 392
                font.pointSize: 24

            }
        }
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

        Item {
            id: forgetUser_Item
            anchors.fill: parent
            Text {
                id: forgetUser_Text
                y: 227
                text: qsTr("找回帳號")
                anchors.right: parent.right
                anchors.rightMargin: 432
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 501
                font.pointSize: 24
            }
            Text {
                id: forgetUser_EmailText
                x: 283
                y: 368
                text: qsTr("電子郵件:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 368
                anchors.right: parent.right
                anchors.rightMargin: 609
                font.pointSize: 20
            }
            TextField{
                id: forgetUser_EmailField
                x: 421
                y: 364
                anchors.right: parent.right
                anchors.rightMargin: 403
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 365
                onPressed: {
                    inputPanel.active
                }
            }

            Button {
                id: forgetUser_submit
                x: 635
                y: 364
                text: qsTr("送出")
                anchors.right: parent.right
                anchors.rightMargin: 289
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 362
                font.pointSize: 18
            }
        }
    }

    Image {
        id: forgetUser_thankYou
        source: "img/thankForBuying.jpg"
        anchors.fill: parent
        state: ui.forgetUser_thankYouVisible
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
        id: timer_Reset
        interval: 20000
        repeat: false
        running: false
        triggeredOnStart: false
        onTriggered: {

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
                login_signup_Item.anchors.bottomMargin+=200
                signup_Item.anchors.bottomMargin+=100
                upload_ItemInfo_Item.anchors.bottomMargin+=100
                updateUser_Item.anchors.bottomMargin+=100
                updateItem_Item.anchors.bottomMargin+=100
                forgetUser_Item.anchors.bottomMargin+=100

            }
            if(!active) {
                login_signup_Item.anchors.bottomMargin-=200
                signup_Item.anchors.bottomMargin-=100
                upload_ItemInfo_Item.anchors.bottomMargin-=100
                updateUser_Item.anchors.bottomMargin-=100
                updateItem_Item.anchors.bottomMargin-=100
                forgetUser_Item.anchors.bottomMargin-=100
            }
        }
        Component.onCompleted: {
            VirtualKeyboardSettings.activeLocales=["zh_TW","en_US"]
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
}








/*##^##
Designer {
    D{i:1;invisible:true}D{i:2;invisible:true}D{i:4;anchors_height:200;anchors_width:200}
D{i:3;invisible:true}D{i:11;invisible:true}D{i:181;invisible:true}D{i:186;invisible:true}
D{i:187;invisible:true}D{i:211;anchors_x:416}D{i:212;anchors_x:203;anchors_y:216}
D{i:214;anchors_x:203;anchors_y:216}D{i:218;anchors_x:664}D{i:225;anchors_x:123;anchors_y:133}
D{i:232;anchors_x:694}D{i:235;anchors_x:662}D{i:238;anchors_x:478;anchors_y:376}D{i:241;anchors_x:331}
D{i:234;anchors_height:200;anchors_width:200;anchors_x:108;anchors_y:88}
}
##^##*/
