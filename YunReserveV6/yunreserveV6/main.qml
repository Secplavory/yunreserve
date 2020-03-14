import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.12
import QtQuick.VirtualKeyboard.Settings 2.0
import QtQuick.Controls.Styles 1.2


Window {
    id: window
    visible: true
    visibility: Window.FullScreen
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
            state: ui.welcome
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
                    ui.welcome_clicked()
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
                        duration: 500;
                    }
                }
            ]
        }
        Item {
            id: chooseFunction
            x: 0
            y: 0
            width: parent.width
            height: parent.height
            state: ui.chooseFunction
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
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.restart()
                            ui.setFunction("1")
                            ui.choose_perchase()
                        }
                    }
                    onPressed: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.stop()
                            parent.opacity=0.3
                        }
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.restart()
                            ui.setFunction("2")
                            ui.toLogin()
                        }
                    }
                    onPressed: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.stop()
                            parent.opacity = "0.3"
                        }
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity = "1"
                    }
                }
            }
            Image {
                id: chooseFunction_takeOFF
                source: "img/button/takeOff.png"
                width: 200
                height: 200
                anchors.horizontalCenterOffset: 250
                anchors.verticalCenterOffset: -50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    scale: 1
                    transformOrigin: Item.Center
                    anchors.fill: parent
                    onClicked: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.restart()
                            ui.setFunction("3")
                            ui.toLogin()
                        }
                    }
                    onPressed: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.stop()
                            parent.opacity = 0.3
                        }
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity = 1
                    }
                }
            }
            Image {
                id: chooseChannel_signup
                source: "img/button/signup.png"
                width: 150
                height: 150
                anchors.horizontalCenterOffset: -175
                anchors.verticalCenterOffset: 175
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.restart()
                            ui.chooseChannel_signup()
                        }
                    }
                    onPressed: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.stop()
                            parent.opacity = 0.3
                        }
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity = 1
                    }
                }
            }
            Image {
                id: chooseChannel_changeUser
                source: "img/button/changeUser.png"
                width: 150
                height: 150
                anchors.horizontalCenterOffset: 0
                anchors.verticalCenterOffset: 175
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.restart()
                            ui.chooseChannel_changeUser()
                        }
                    }
                    onPressed: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.stop()
                            parent.opacity = 0.3
                        }
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity = 1
                    }
                }
            }
            Image {
                id: chooseChannel_forgetUser
                source: "img/button/forgetUser.png"
                width: 150
                height: 150
                anchors.horizontalCenterOffset: 175
                anchors.verticalCenterOffset: 175
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.restart()
                            ui.chooseChannel_forgetUser()
                        }
                    }
                    onPressed: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.stop()
                            parent.opacity = 0.3
                        }
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity = 1
                    }
                }
            }
            Button {
                id: button
                y: 728
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                opacity: 0
                anchors.left: parent.left
                onClicked: {
                    ui.admin()
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
                        duration: 500;
                    }
                }
            ]
        }
        Item {
            id: chooseChannel
            width: parent.width
            height: parent.height
            state: ui.chooseChannel
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                            opacity: 0.3
                            enabled: false
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }

                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                        ui.chooseChannel_chosen()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
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
                id: chooseChannel_toContract
                width: 75
                height: 75
                anchors.verticalCenterOffset: 50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/button/contract.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.toContract()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
                }
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
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.restart()
                            ui.chooseChannel_toChooseFunction()
                        }
                    }
                    onPressed: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.stop()
                            parent.opacity=0.3
                        }
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
                }
            }

            Text {
                id: chooseChannel_contractText
                text: qsTr("請查看合約內容")
                font.family: "Microsoft YaHei UI"
                anchors.verticalCenterOffset: 0
                font.pointSize: 16
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
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
                        duration: 500;
                    }
                }
            ]
        }
        Item {
            id: contract
            width: parent.width
            height: parent.height
            state: ui.contract
            Text {
                id: contract_text
                text: "請掃碼閱讀合約內容"
                font.family: "Microsoft YaHei UI"
                anchors.verticalCenterOffset: -75
                font.pointSize: 20
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            Image {
                id: contract_qrcode
                anchors.verticalCenterOffset: 50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/qrcode/contract_qrcode.png"
            }

            Image {
                id: contract_toChooseChannel
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
                        ui.contract_toChooseChannel()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
                }
            }
            states: [
                State {
                    name: "0"
                    PropertyChanges {
                        target: contract
                        opacity: 0
                        enabled: false
                    }
                },
                State {
                    name: "1"
                    PropertyChanges {
                        target: contract
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
                        duration: 500;
                    }
                }
            ]
        }
        Item {
            id: scanQrcode
            width: parent.width
            height: parent.height
            state: ui.scanQrcode
            onStateChanged: {
                if(state=="1"){
                    ui.setItemInfo()
                }
            }
            Text {
                id: scanQrcode_itemName
                text: "商品：" + ui.itemName
                font.family: "Microsoft YaHei UI"
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.verticalCenterOffset: -125
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 24
                horizontalAlignment: Text.AlignLeft
            }
            Text {
                id: scanQrcode_itemPrice
                text: "價格：" + ui.itemPrice + "元"
                anchors.verticalCenterOffset: 50
                font.family: "Microsoft YaHei UI"
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 24
            }
            Text {
                id: scanQrcode_notify
                color: "#ff0c0c"
                font.family: "Microsoft YaHei UI"
                text: ui.scanQrcode_notify
                anchors.horizontalCenterOffset: 300
                anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignBottom
                anchors.verticalCenterOffset: 23
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 14
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                id: scanQrcode_checkPayment_text
                text: "付款完畢請按"
                font.family: "Microsoft YaHei UI"
                anchors.verticalCenterOffset: 300
                anchors.horizontalCenterOffset: 260
                font.pointSize: 18
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
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
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.restart()
                            ui.scanQrcode_toChooseChannel()
                        }
                    }
                    onPressed: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.stop()
                            parent.opacity=0.3
                        }
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
                }
            }
            Image {
                id: scanQrcode_PayMoney
                source: "img/button/checkpayment.png"
                width: 75
                height: 75
                anchors.verticalCenterOffset: 300
                anchors.horizontalCenterOffset: 385
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    anchors.fill: parent
                    onClicked: {
                        timer_reset.restart()
                        ui.scanQrcode_PayMoney()
                    }
                    onPressed: {
                        timer_reset.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
                }
            }
            Image {
                id: scanQrcode_qrcode
                width: 200
                height: 200
                anchors.verticalCenterOffset: 150
                anchors.horizontalCenterOffset: 300
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "image://colors/"+ui.scanQrcode_qrcode
                sourceSize.width: 200
                sourceSize.height: 200
            }

            Text {
                id: scanQrcode_text
                text: qsTr("請使用台灣pay掃碼支付")
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenterOffset: 300
                font.pointSize: 18
                anchors.verticalCenterOffset: -13
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
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
                },
                State {
                    name: "2"
                    PropertyChanges {
                        target: scanQrcode
                        opacity: 1
                        enabled: false
                    }
                }
            ]
            transitions: [
                Transition {
                    NumberAnimation {
                        property: "opacity";
                        easing.type: Easing.InOutQuad;
                        duration: 500;
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
            state: ui.login
            onStateChanged: {
                if(state=="0"){
                    login_accField.text = ""
                    login_pwdField.text = ""
                }
            }
            Text {
                id: login_title
                text: "帳號登入"
                anchors.verticalCenterOffset: -75
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Microsoft YaHei UI"
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 20
            }

            Text {
                id: login_notify
                color: "#ea0000"
                text: ui.login_notify
                verticalAlignment: Text.AlignTop
                font.family: "Microsoft YaHei UI"
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
                font.family: "Microsoft YaHei UI"
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 18
            }

            TextField {
                id: login_accField
                maximumLength: 18
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
                font.family: "Microsoft YaHei UI"
                anchors.verticalCenterOffset: 100
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 18
            }

            TextField {
                id: login_pwdField
                echoMode: "Password"
                maximumLength: 12
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
                    property bool handler: false
                    onClicked: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.restart()
                            ui.login_submit(login_accField.text, login_pwdField.text)
                        }
                    }
                    onPressed: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.stop()
                            parent.opacity = 0.3
                        }
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity = 1
                    }
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
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.restart()
                            ui.login_toChooseFunction()
                        }
                    }
                    onPressed: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.stop()
                            parent.opacity = 0.3
                        }
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity = 1
                    }
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
                },
                State {
                    name: "2"
                    PropertyChanges {
                        target: login
                        opacity: 1
                        enabled: false
                    }
                }
            ]
            transitions: [
                Transition {
                    NumberAnimation {
                        property: "opacity";
                        easing.type: Easing.InOutQuad;
                        duration: 500;
                    }
                }
            ]
            NumberAnimation{
                id: login_animateY
                target: login
                properties: "y"
                from: 0
                to: -75
                easing.type: Easing.InOutQuad
            }
            NumberAnimation{
                id: login_animateY_reverse
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
            state: ui.upload_itemInfo
            onStateChanged: {
                if(state=="0"){
                    upload_itemField.text = ""
                    upload_priceField.text = ""
                }
            }

            Text {
                id: upload_title
                text: "商品資訊"
                anchors.verticalCenterOffset: -75
                font.pointSize: 20
                font.family: "Microsoft YaHei UI"
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                id: upload_notify
                color: "#ff1919"
                text: ui.upload_notify
                font.family: "Microsoft YaHei UI"
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
                font.family: "Microsoft YaHei UI"
                anchors.verticalCenter: parent.verticalCenter
            }

            TextField {
                id: upload_itemField
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                onPressed: timer_reset.restart()
                onTextChanged: timer_reset.restart()
                maximumLength: 18
            }

            Text {
                id: upload_priceText
                text: "價格："
                font.pointSize: 18
                font.family: "Microsoft YaHei UI"
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
                onPressed: timer_reset.restart()
                onTextChanged: timer_reset.restart()
                maximumLength: 5
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
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.restart()
                            if(ui.upload_submit(upload_itemField.text, upload_priceField.text)){
                                ui.upload_sendMail()
                            }
                        }
                    }
                    onPressed: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.stop()
                            parent.opacity = 0.3
                        }
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity = 1
                    }
                }
            }
            Image {
                id: upload_toChooseChannel
                width: 75
                height: 75
                anchors.verticalCenterOffset: 300
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.PreserveAspectFit
                source: "img/button/keepChooseChannel.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.restart()
                            ui.upload_toChooseChannel()
                        }
                    }
                    onPressed: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.stop()
                            parent.opacity = 0.3
                        }
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity = 1
                    }
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
                },
                State {
                    name: "2"
                    PropertyChanges {
                        target: upload_itemInfo
                        opacity: 1
                        enabled: false
                    }
                }
            ]
            transitions: [
                Transition {
                    NumberAnimation {
                        property: "opacity";
                        easing.type: Easing.InOutQuad;
                        duration: 500;
                    }
                }
            ]
            NumberAnimation{
                id: upload_animateY
                target: upload_itemInfo
                properties: "y"
                from: 0
                to: -75
                easing.type: Easing.InOutQuad
            }
            NumberAnimation{
                id: upload_animateY_reverse
                target: upload_itemInfo
                properties: "y"
                from: -75
                to: 0
                easing.type: Easing.InOutQuad
            }
        }
        Item {
            id: signup
            width: parent.width
            height: parent.height
            state: ui.signup
            Text {
                id: signup_title
                text: "請掃碼註冊"
                font.pointSize: 20
                font.family: "Microsoft YaHei UI"
                anchors.verticalCenterOffset: -75
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
            }
            Image {
                id: signup_qrcode
                width: 166
                height: 166
                anchors.verticalCenterOffset: 50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/qrcode/signup.png"
                fillMode: Image.PreserveAspectFit
            }
            Image {
                id: signup_toChooseFunction
                source: "img/button/HOME.png"
                width: 75
                height: 75
                anchors.verticalCenterOffset: 300
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.restart()
                            ui.signup_toChooseFunction()
                        }
                    }
                    onPressed: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.stop()
                            parent.opacity = 0.3
                        }
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
                }
            }
            states: [
                State {
                    name: "0"
                    PropertyChanges {
                        target: signup
                        opacity: 0
                        enabled: false
                    }
                },
                State {
                    name: "1"
                    PropertyChanges {
                        target: signup
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
                        duration: 500;
                    }
                }
            ]
        }
        Item {
            id: changeUser
            width: parent.width
            height: parent.height
            state: ui.changeUser
            Text {
                id: changeUser_title
                text: "請掃碼更改使用者資訊"
                font.family: "Microsoft YaHei UI"
                font.pointSize: 20
                horizontalAlignment: Text.AlignHCenter
                anchors.verticalCenterOffset: -75
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            Image {
                id: changeUser_qrcode
                width: 166
                height: 166
                anchors.verticalCenterOffset: 50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/qrcode/changeUser.jpg"
                fillMode: Image.PreserveAspectFit
            }
            Image {
                id: changeUser_toChooseFunction
                width: 75
                height: 75
                anchors.verticalCenterOffset: 300
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/button/HOME.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.restart()
                            ui.changeUser_toChooseFunction()
                        }
                    }
                    onPressed: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.stop()
                            parent.opacity = 0.3
                        }
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
                }
            }
            states: [
                State {
                    name: "0"
                    PropertyChanges {
                        target: changeUser
                        opacity: 0
                        enabled: false
                    }
                },
                State {
                    name: "1"
                    PropertyChanges {
                        target: changeUser
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
                        duration: 500;
                    }
                }
            ]
        }
        Item {
            id: forgetUser
            width: parent.width
            height: parent.height
            state: ui.forgetUser
            Text {
                id: forgetUser_title
                text: "請掃碼更改使用者資訊"
                font.pointSize: 20
                horizontalAlignment: Text.AlignHCenter
                font.family: "Microsoft YaHei UI"
                anchors.verticalCenterOffset: -75
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            Image {
                id: forgetUser_qrcode
                width: 166
                height: 166
                anchors.verticalCenterOffset: 50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/qrcode/forgetUser.jpg"
                fillMode: Image.PreserveAspectFit
            }
            Image {
                id: forgetUser_toChooseFunction
                width: 75
                height: 75
                anchors.verticalCenterOffset: 300
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/button/HOME.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.restart()
                            ui.forgetUser_toChooseFunction()
                        }
                    }
                    onPressed: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            timer_reset.stop()
                            parent.opacity = 0.3
                        }
                    }
                    onReleased: {
                        timer_reset.start()
                        parent.opacity=1
                    }
                }
            }
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
                        duration: 500;
                    }
                }
            ]
        }
        Item {
            id: waitClose
            width: parent.width
            height: parent.height
            state: ui.waitClose
            onStateChanged: {
                if(state=="1"){
                    timer_reset.stop()
                    timer_waitClose.start()
                }
            }

            AnimatedImage {
                id: waitClose_text
                width: 500
                height: 100
                playing: true
                paused: false
                anchors.verticalCenterOffset: 60
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/word/close.gif"
            }

            states: [
                State {
                    name: "0"
                    PropertyChanges {
                        target: waitClose
                        opacity: 0
                        enabled: false
                    }
                },
                State {
                    name: "1"
                    PropertyChanges {
                        target: waitClose
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
                        duration: 500;
                    }
                }
            ]
        }
        Item {
            id: thanksYou
            width: parent.width
            height: parent.height
            state: ui.thanksYou
            onStateChanged: {
                if(state=="1"){
                    timer_reset.stop()
                    thanksYou_timer.count=8
                    thanksYou_timer.restart()
                }
            }

            AnimatedImage {
                id: thanksYou_text
                width: 512
                height: 206
                anchors.verticalCenterOffset: 30
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/word/thanks.png"
            }

            Image {
                id: thanksYou_toChooseChannel
                width: 75
                height: 75
                anchors.horizontalCenterOffset: -100
                anchors.verticalCenterOffset: 300
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/button/keepChooseChannel.png"
                fillMode: Image.PreserveAspectFit
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            thanksYou_timer.stop();
                            timer_reset.restart()
                            ui.thanksYou_toChooseChannel()
                            thanksYou_notify.text = ""
                        }
                    }
                    onPressed: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            thanksYou_timer.stop();
                            parent.opacity = 0.3
                        }
                    }
                    onReleased: {
                        thanksYou_timer.start();
                        parent.opacity = 1
                    }
                }
            }

            Image {
                id: thanksYou_toHome
                width: 75
                height: 75
                anchors.verticalCenterOffset: 300
                anchors.horizontalCenterOffset: 100
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/button/HOME.png"
                fillMode: Image.PreserveAspectFit
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            thanksYou_timer.stop();
                            timer_reset.restart()
                            ui.thanksYou_toHome()
                            thanksYou_notify.text = ""
                        }
                    }
                    onPressed: {
                        if(Math.sqrt(Math.pow(mouseX-parent.width/2,2)+Math.pow(mouseY-parent.height/2,2)) < parent.width/2){
                            thanksYou_timer.stop();
                            parent.opacity = 0.3
                        }
                    }
                    onReleased: {
                        thanksYou_timer.start();
                        parent.opacity = 1
                    }
                }
            }

            Text {
                id: thanksYou_notify
                text: ""
                font.family: "Microsoft YaHei UI"
                font.pointSize: 12
                anchors.verticalCenterOffset: 240
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignHCenter
            }

            Timer{
                id: thanksYou_timer
                interval: 1000
                property int count
                repeat: true
                running: false
                triggeredOnStart: false
                onTriggered: {
                    count -= 1
                    thanksYou_notify.text = "結束交易剩餘" + count + "秒"
                    if(count<=0){
                        ui.reset()
                        thanksYou_timer.stop();
                        thanksYou_notify.text = ""
                    }
                }
            }

            states: [
                State {
                    name: "0"
                    PropertyChanges {
                        target: thanksYou
                        opacity: 0
                        enabled: false
                    }
                },
                State {
                    name: "1"
                    PropertyChanges {
                        target: thanksYou
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
                        duration: 500;
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
    Image {
        id: reset_notify
        anchors.fill: parent
        source: "img/background/background.jpg"
        state: "0"
        onStateChanged: {
            if(state=="1"){
                timer_reset.stop()
                timer_countdown.restart()
            }
        }
        MouseArea{
            width: parent.width
            height: parent.height
        }
        Image {
            id: reset_window
            source: "img/background/windows.png"
            width: 778
            height: 500
            anchors.verticalCenterOffset: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Image {
                id: reset_notify_keepOperate
                y: 270
                width: 82
                height: 63
                source: "img/button/O.png"
                anchors.horizontalCenterOffset: 151
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 104
                anchors.horizontalCenter: parent.horizontalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        timer_countdown.stop()
                        timer_reset.restart()
                        parent.parent.parent.state = "0"
                    }
                    onPressed: {
                        timer_countdown.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_countdown.start()
                        parent.opacity=1
                    }
                }
            }
            Image {
                id: reset_notify_home
                y: 270
                width: 82
                height: 63
                source: "img/button/X.png"
                anchors.horizontalCenterOffset: -149
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 104
                anchors.horizontalCenter: parent.horizontalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        timer_countdown.stop()
                        parent.parent.parent.state = "0"
                        ui.reset()
                    }
                    onPressed: {
                        timer_countdown.stop()
                        parent.opacity=0.3
                    }
                    onReleased: {
                        timer_countdown.start()
                        parent.opacity=1
                    }
                }
            }
            Text {
                id: reset_notify_counter
                y: 416
                text: ""
                anchors.horizontalCenterOffset: 1
                font.family: "Microsoft YaHei UI"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignBottom
                font.pointSize: 12
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 64
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: reset_notify_text
                text: "是否仍在使用機台"
                anchors.verticalCenterOffset: -20
                font.family: "Microsoft YaHei UI"
                anchors.horizontalCenterOffset: 0
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 24
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: reset_notify
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: reset_notify
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
                    duration: 500;
                }
            }
        ]
    }
    Timer{
        id: timer_reset
        interval: 45000
        repeat: false
        running: false
        triggeredOnStart: false
        onTriggered: {
            timer_countdown.count = 12
            reset_notify.state = "1"
        }
    }
    Timer{
        id: timer_countdown
        property int count: 12
        interval: 1000
        repeat: true
        running: false
        triggeredOnStart: false
        onTriggered: {
            count -= 1
            reset_notify_counter.text = "若不點選，將在"+ count +"秒後返回主畫面"
            if(count===0){
                timer_countdown.stop()
                reset_notify.state = "0"
                ui.reset()
                reset_notify_counter.text = ""
            }
        }
    }
    Timer{
        id: timer_waitClose
        interval: 3000
        repeat: true
        running: false
        triggeredOnStart: false
        onTriggered: {
            if(ui.checkChannel()){
                timer_waitClose.stop()
            }
        }
    }

    /*
    function reset(){
        welcome.state = "1"
        chooseFunction.state = "0"
        chooseChannel.state = "0"
        scanQrcode.state = "0"
        login.state = "0"
        upload_itemInfo.state = "0"
        contract.state = "0"
        signup.state = "0"
        changeUser.state = "0"
        forgetUser.state = "0"
    }
*/


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
                login_animateY.start()
                upload_animateY.start()
            }
            if(!active){
                login_animateY_reverse.start()
                upload_animateY_reverse.start()
                background.forceActiveFocus()
            }
        }
        Component.onCompleted: {
            VirtualKeyboardSettings.activeLocales=["zh_TW","en_US"]
            VirtualKeyboardSettings.styleName
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
    D{i:2;invisible:true}D{i:12;invisible:true}D{i:31;invisible:true}D{i:211;invisible:true}
D{i:238;invisible:true}D{i:240;invisible:true}D{i:239;invisible:true}D{i:242;invisible:true}
D{i:243;invisible:true}D{i:244;invisible:true}D{i:245;invisible:true}D{i:246;invisible:true}
D{i:247;invisible:true}D{i:248;invisible:true}D{i:260;invisible:true}D{i:261;invisible:true}
D{i:259;invisible:true}D{i:241;invisible:true}D{i:281;invisible:true}D{i:282;invisible:true}
D{i:280;invisible:true}D{i:262;invisible:true}D{i:291;invisible:true}D{i:293;invisible:true}
D{i:292;invisible:true}D{i:283;invisible:true}D{i:302;invisible:true}D{i:304;invisible:true}
D{i:303;invisible:true}D{i:294;invisible:true}D{i:313;invisible:true}D{i:315;invisible:true}
D{i:314;invisible:true}D{i:305;invisible:true}D{i:321;invisible:true}D{i:323;invisible:true}
D{i:322;invisible:true}D{i:316;invisible:true}D{i:337;invisible:true}D{i:336;invisible:true}
D{i:324;invisible:true}D{i:338;invisible:true}D{i:339;invisible:true}
}
##^##*/
