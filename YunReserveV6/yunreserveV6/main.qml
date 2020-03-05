import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.12

Window {
    id: window
    visible: true
    width: 1024
    height: 768
    title: qsTr("芯生文創")

    Image {
        id: background
        source: "img/background/background.jpg"
        anchors.fill: parent
        Item {
            id: welcome
            width: parent.width
            height: parent.height
            state: "1"
            Image {
                id: welcome_welcomText
                width: 600
                height: 222
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/word/welcomeText.png"
            }
            AnimatedImage {
                id: welcome_clickText
                anchors.verticalCenterOffset: 200
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/word/clickText.gif"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    timer_reset.restart()
                    parent.state = "0"
                    chooseFunction.state = "1"
                }
            }
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
        }
        Item {
            id: chooseFunction
            width: parent.width
            height: parent.height
            state: "0"
            Image {
                id: chooseFunction_perchase
                source: "img/button/perchase.png"
                width: 200
                height: 200
                anchors.verticalCenterOffset: -50
                anchors.horizontalCenterOffset: -250
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setFunction("1")
                        parent.parent.state = "0"
                        chooseChannel.state = "1"
                    }
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
            }
            Image {
                id: chooseFunction_lanch
                source: "img/button/lanch.png"
                width: 200
                height: 200
                anchors.verticalCenterOffset: -50
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setFunction("2")
                        parent.parent.state = "0"
                        login.state = "1"
                    }
                    onPressed: parent.opacity = "0.3"
                    onReleased: parent.opacity = "1"
                }
            }
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
        }
        Item {
            id: chooseChannel
            width: parent.width
            height: parent.height
            state: "0"
            onStateChanged: {
                if(state=="1"){
                    ui.setChannelVisible()
                }
            }
            Image {
                id: ch01
                source: "img/channel/01-01.png"
                width: 100
                height: 100
                state: ui.ch01
                anchors.verticalCenterOffset: -300
                anchors.horizontalCenterOffset: -450
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("1")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){
                            scanQrcode.state = "1"
                        }
                        if(ui.getFunction()===2){upload_itemInfo.state="1"}
                    }
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
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
            }
            Image {
                id: ch02
                source: "img/channel/02-01.png"
                width: 100
                height: 100
                state: ui.ch01
                anchors.verticalCenterOffset: -300
                anchors.horizontalCenterOffset: -325
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("2")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){
                            scanQrcode.state = "1"
                        }
                        if(ui.getFunction()===2){upload_itemInfo.state="1"}
                    }
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch02
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch02
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch03
                source: "img/channel/03-01.png"
                width: 100
                height: 100
                state: ui.ch03
                anchors.verticalCenterOffset: -300
                anchors.horizontalCenterOffset: -200
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("3")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch03
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch03
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch04
                source: "img/channel/04-01.png"
                width: 100
                height: 100
                state: ui.ch04
                anchors.verticalCenterOffset: -175
                anchors.horizontalCenterOffset: -450
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("4")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch04
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch04
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch05
                source: "img/channel/05-01.png"
                width: 100
                height: 100
                state: ui.ch05
                anchors.verticalCenterOffset: -175
                anchors.horizontalCenterOffset: -325
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("5")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch05
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch05
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch06
                source: "img/channel/06-01.png"
                width: 100
                height: 100
                state: ui.ch06
                anchors.verticalCenterOffset: -175
                anchors.horizontalCenterOffset: -200
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("6")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch06
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch06
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch07
                source: "img/channel/07-01.png"
                width: 150
                height: 100
                state: ui.ch07
                anchors.verticalCenterOffset: -50
                anchors.horizontalCenterOffset: -425
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("7")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch07
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch07
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch08
                source: "img/channel/08-01.png"
                width: 150
                height: 100
                state: ui.ch08
                anchors.verticalCenterOffset: -50
                anchors.horizontalCenterOffset: -225
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("8")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch08
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch08
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch09
                source: "img/channel/09-01.png"
                width: 150
                height: 100
                state: ui.ch09
                anchors.verticalCenterOffset: 75
                anchors.horizontalCenterOffset: -425
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("9")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch09
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch09
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch10
                source: "img/channel/10-01.png"
                width: 150
                height: 100
                state: ui.ch10
                anchors.verticalCenterOffset: 75
                anchors.horizontalCenterOffset: -225
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("10")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch10
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch10
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch11
                source: "img/channel/11-01.png"
                width: 150
                height: 100
                state: ui.ch11
                anchors.verticalCenterOffset: 195
                anchors.horizontalCenterOffset: -425
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("11")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch11
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch11
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch12
                source: "img/channel/12-01.png"
                width: 150
                height: 100
                state: ui.ch12
                anchors.verticalCenterOffset: 195
                anchors.horizontalCenterOffset: -225
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("12")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch12
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch12
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch13
                source: "img/channel/13-01.png"
                width: 150
                height: 100
                state: ui.ch13
                anchors.verticalCenterOffset: 320
                anchors.horizontalCenterOffset: -425
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("13")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch13
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch13
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch14
                source: "img/channel/14-01.png"
                width: 150
                height: 100
                state: ui.ch14
                anchors.verticalCenterOffset: 320
                anchors.horizontalCenterOffset: -225
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("14")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch14
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch14
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch15
                source: "img/channel/15-01.png"
                width: 100
                height: 100
                state: ui.ch15
                anchors.verticalCenterOffset: -300
                anchors.horizontalCenterOffset: 200
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("15")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch15
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch15
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch16
                source: "img/channel/16-01.png"
                width: 100
                height: 100
                state: ui.ch16
                anchors.verticalCenterOffset: -300
                anchors.horizontalCenterOffset: 325
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("16")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch16
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch16
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch17
                source: "img/channel/17-01.png"
                width: 100
                height: 100
                state: ui.ch17
                anchors.verticalCenterOffset: -300
                anchors.horizontalCenterOffset: 450
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("17")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch17
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch17
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch18
                source: "img/channel/18-01.png"
                width: 100
                height: 100
                state: ui.ch18
                anchors.verticalCenterOffset: -175
                anchors.horizontalCenterOffset: 200
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("18")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch18
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch18
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch19
                source: "img/channel/19-01.png"
                width: 100
                height: 100
                state: ui.ch19
                anchors.verticalCenterOffset: -175
                anchors.horizontalCenterOffset: 325
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("19")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch19
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch19
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch20
                source: "img/channel/20-01.png"
                width: 100
                height: 100
                state: ui.ch20
                anchors.verticalCenterOffset: -175
                anchors.horizontalCenterOffset: 450
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("20")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch20
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch20
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch21
                source: "img/channel/21-01.png"
                width: 150
                height: 100
                state: ui.ch21
                anchors.verticalCenterOffset: -50
                anchors.horizontalCenterOffset: 225
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("21")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch21
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch21
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch22
                source: "img/channel/22-01.png"
                width: 150
                height: 100
                state: ui.ch22
                anchors.verticalCenterOffset: -50
                anchors.horizontalCenterOffset: 425
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("22")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch22
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch22
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch23
                source: "img/channel/23-01.png"
                width: 150
                height: 100
                state: ui.ch23
                anchors.verticalCenterOffset: 75
                anchors.horizontalCenterOffset: 225
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("23")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch23
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch23
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch24
                source: "img/channel/24-01.png"
                width: 150
                height: 100
                state: ui.ch24
                anchors.verticalCenterOffset: 75
                anchors.horizontalCenterOffset: 425
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("24")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch24
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch24
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch25
                source: "img/channel/25-01.png"
                width: 150
                height: 100
                state: ui.ch25
                anchors.verticalCenterOffset: 195
                anchors.horizontalCenterOffset: 225
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("25")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch25
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch25
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch26
                source: "img/channel/26-01.png"
                width: 150
                height: 100
                state: ui.ch26
                anchors.verticalCenterOffset: 195
                anchors.horizontalCenterOffset: 425
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("26")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch26
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch26
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch27
                source: "img/channel/27-01.png"
                width: 150
                height: 100
                state: ui.ch27
                anchors.verticalCenterOffset: 320
                anchors.horizontalCenterOffset: 225
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("27")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch27
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch27
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }
            Image {
                id: ch28
                source: "img/channel/28-01.png"
                width: 150
                height: 100
                state: ui.ch28
                anchors.verticalCenterOffset: 320
                anchors.horizontalCenterOffset: 425
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    width: 150
                    height: 100
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.setChannel("28")
                        parent.parent.state="0"
                        if(ui.getFunction()===1){scanQrcode.state = "1"}  if(ui.getFunction()===2){upload_itemInfo.state="1"}		}
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
                states: [
                    State {
                        name: "0"
                        PropertyChanges {
                            target: ch28
                            opacity: 0.3
                            enabled: false
                        }
                    },
                    State {
                        name: "1"
                        PropertyChanges {
                            target: ch28
                            opacity: 1
                            enabled: true
                        }
                    }
                ]
            }

            Image {
                id: chooseChannel_toChooseFunction
                source: "img/button/HOME.png"
                width: 70
                height: 70
                anchors.verticalCenterOffset: 300
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        parent.parent.state = "0"
                        chooseFunction.state = "1"
                    }
                    onPressed: parent.opacity=0.3
                    onReleased: parent.opacity=1
                }
            }
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
        }
        Item {
            id: scanQrcode
            width: parent.width
            height: parent.height
            state: "0"
            onStateChanged: ui.setItemInfo()
            Text {
                id: scanQrcode_itemName
                text: "商品：" + ui.itemName
                anchors.left: parent.left
                anchors.leftMargin: 53
                anchors.verticalCenterOffset: -150
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 18
                horizontalAlignment: Text.AlignLeft
            }
            Text {
                id: scanQrcode_itemPrice
                text: "價格：" + ui.itemPrice + "元"
                anchors.left: parent.left
                anchors.leftMargin: 57
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 18
            }
            Image {
                id: scanQrcode_toChooseChannel
                width: 75
                height: 75
                anchors.verticalCenterOffset: 300
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/button/keepChooseChannel.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        parent.parent.state = "0"
                        chooseChannel.state = "1"
                    }
                    onPressed: parent.opacity = "0.3"
                    onReleased: parent.opacity = "1"
                }
            }
            states: [
                State {
                    name: "0"
                    PropertyChanges {
                        target: scanQrcode
                        opacity: 0
                        enabled: false
                    }
                },
                State {
                    name: "1"
                    PropertyChanges {
                        target: scanQrcode
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
        Item {
            id: login
            width: parent.width
            height: parent.height
            x: 0
            y: 0
            state: "0"

            Text {
                id: login_title
                text: "帳號登入"
                anchors.verticalCenterOffset: -75
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 20
            }

            Text {
                id: login_notify
                color: "#ea0000"
                text: ui.login_notify
                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignHCenter
                anchors.verticalCenterOffset: -35
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 10
            }

            Text {
                id: login_accText
                text: qsTr("帳號：")
                anchors.horizontalCenterOffset: -150
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 18
            }

            TextField {
                id: login_accField
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                onPressed: timer_reset.restart()
                onTextChanged: timer_reset.restart()
            }

            Text {
                id: login_pwdText
                text: qsTr("密碼：")
                anchors.horizontalCenterOffset: -150
                anchors.verticalCenterOffset: 100
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 18
            }

            TextField {
                id: login_pwdField
                echoMode: "Password"
                anchors.horizontalCenterOffset: 0
                anchors.verticalCenterOffset: 100
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                onPressed: timer_reset.restart()
                onTextChanged: timer_reset.restart()
            }

            Image {
                id: login_submit
                width: 75
                height: 75
                anchors.horizontalCenterOffset: 150
                anchors.verticalCenterOffset: 100
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.PreserveAspectFit
                source: "img/button/submit.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        if(ui.login_submit(login_accField.text, login_pwdField.text)){
                            parent.parent.state = "0"
                            chooseChannel.state = "1"
                        }
                        login_accField.text = ""
                        login_pwdField.text = ""
                    }
                    onPressed: parent.opacity = 0.3
                    onReleased: parent.opacity = 1
                }
            }
            Image {
                id: login_toChooseFunction
                source: "img/button/HOME.png"
                width: 75
                height: 75
                anchors.verticalCenterOffset: 300
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        parent.parent.state = "0"
                        chooseFunction.state = "1"
                    }
                    onPressed: parent.opacity = 0.3
                    onReleased: parent.opacity = 1
                }
            }

            states: [
                State {
                    name: "0"
                    PropertyChanges {
                        target: login
                        opacity: 0
                        enabled: false
                    }
                },
                State {
                    name: "1"
                    PropertyChanges {
                        target: login
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
            NumberAnimation{
                id: animateY
                target: login
                properties: "y"
                from: 0
                to: -75
                easing.type: Easing.InOutQuad
            }
            NumberAnimation{
                id: animateY_reverse
                target: login
                properties: "y"
                from: -75
                to: 0
                easing.type: Easing.InOutQuad
            }
        }
        Item {
            id: upload_itemInfo
            width: parent.width
            height: parent.height
            state: "0"
            Text {
                id: upload_title
                text: "商品資訊"
                anchors.verticalCenterOffset: -75
                font.pointSize: 20
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                id: upload_notify
                color: "#ff1919"
                text: ui.upload_notify
                anchors.verticalCenterOffset: -35
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: upload_itemText
                text: "名稱："
                anchors.horizontalCenterOffset: -150
                font.pointSize: 18
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            TextField {
                id: upload_itemField
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                id: upload_priceText
                text: "價格："
                font.pointSize: 18
                anchors.verticalCenterOffset: 100
                anchors.horizontalCenterOffset: -150
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            TextField {
                id: upload_priceField
                anchors.verticalCenterOffset: 100
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            Image {
                id: upload_submit
                width: 75
                height: 75
                anchors.horizontalCenterOffset: 150
                anchors.verticalCenterOffset: 100
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.PreserveAspectFit
                source: "img/button/submit.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        if(ui.upload_submit(upload_itemField.text, upload_priceField.text)){
                            console.log("123123")
                        }
                    }
                    onPressed: parent.opacity = 0.3
                    onReleased: parent.opacity = 1
                }
            }
            states: [
                State {
                    name: "0"
                    PropertyChanges {
                        target: upload_itemInfo
                        opacity: 0
                        enabled: false
                    }
                },
                State {
                    name: "1"
                    PropertyChanges {
                        target: upload_itemInfo
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

    }
    Image {
        id: brandIcon
        width: 300
        height: 300
        z:99
        anchors.verticalCenterOffset: -280
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        source: "img/icon/brandIcon.png"
    }
    Timer{
        id: timer_reset
        interval: 8000
        repeat: false
        running: false
        triggeredOnStart: false
        onTriggered: {
            reset()
        }
    }
    function reset(){
        welcome.state = "1"
        chooseFunction.state = "0"
        chooseChannel.state = "0"
        scanQrcode.state = "0"
        login.state = "0"
        upload_itemInfo.state = "0"
    }


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
        onActiveChanged: {
            if(active){
                animateY.start()
            }
            if(!active){
                animateY_reverse.start()
                background.forceActiveFocus()
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
