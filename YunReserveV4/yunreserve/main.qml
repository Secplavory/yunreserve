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
    title: qsTr("新生文創")
    BusyIndicator{
        width: 100
        height: 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 32
        anchors.right: parent.right
        anchors.rightMargin: 32
    }

    Image {
        id: welcome
        anchors.fill: parent
        source: "img/welcome.jpg"
    }

    Image {
        id: chooseFunction
        anchors.fill: parent
        source: "img/background.jpg"

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
        Item {
            id: choseChannel_Item
            anchors.fill: parent

            Image {
                id: choseChannel_1
                x: 60
                y: 60
                width: 100
                height: 100
                state: database.ch1State
                anchors.top: parent.top
                enabled: true
                anchors.left: parent.left
                anchors.topMargin: 20
                anchors.leftMargin: 30
                MouseArea {
                    anchors.fill: parent
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_1
                            opacity: 1
                            source: "img/channel/01-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "unavailable"
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
                state: database.ch2State
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 20
                anchors.leftMargin: 150
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_2
                            opacity: 1
                            source: "img/channel/02-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "unavailable"
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
                state: database.ch3State
                anchors.top: parent.top
                enabled: false
                anchors.left: parent.left
                anchors.topMargin: 20
                anchors.leftMargin: 270
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_3
                            opacity: 1
                            source: "img/channel/03-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "unavailable"
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
                state: database.ch4State
                anchors.top: parent.top
                enabled: false
                anchors.left: parent.left
                anchors.topMargin: 130
                anchors.leftMargin: 30
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_4
                            opacity: 1
                            source: "img/channel/04-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "unavailable"
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
                state: database.ch5State
                anchors.top: parent.top
                enabled: false
                anchors.left: parent.left
                anchors.topMargin: 130
                anchors.leftMargin: 150
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_5
                            opacity: 1
                            source: "img/channel/05-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "unavailable"
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
                state: database.ch6State
                anchors.top: parent.top
                enabled: false
                anchors.left: parent.left
                anchors.topMargin: 130
                anchors.leftMargin: 270
                MouseArea {
                }
                states: [
                    State {
                        name: "available"
                        PropertyChanges {
                            target: choseChannel_6
                            opacity: 1
                            source: "img/channel/06-01.jpg"
                            enabled: true
                        }
                    },
                    State {
                        name: "unavailable"
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
            source: "img/channel/01-01.jpg"

        }

        Text {
            id: itemName
            text: qsTr("商品名稱：")
            anchors.left: parent.left
            anchors.leftMargin: 160
            anchors.top: parent.top
            anchors.topMargin: 180
            font.pixelSize: 36
        }
        Text {
            id: itemPrice
            text: qsTr("價格：")
            anchors.left: parent.left
            anchors.leftMargin: 160
            anchors.top: parent.top
            anchors.topMargin: 300
            font.pixelSize: 36
        }
        Text {
            id: itemRemark
            text: qsTr("備註：")
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
    }

    Image {
        id: login_signup
        anchors.fill: parent
        source: "img/background.jpg"

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
                anchors.top: parent.top
                anchors.topMargin: 65
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
                x: 218
                anchors.right: parent.right
                anchors.rightMargin: 94
                anchors.top: parent.top
                anchors.topMargin: 163
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
            }
            if(!active) {
                login_signup_Item.anchors.bottomMargin-=200
                signup_Item.anchors.bottomMargin-=100
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
    D{i:4;anchors_height:200;anchors_width:200}
}
##^##*/
