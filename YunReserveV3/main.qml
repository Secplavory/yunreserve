import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.2
import QtQuick.VirtualKeyboard 2.3 //打包需要將qtQuick/virtualkeyboard 和 Qt5VirtualKeyboard加入
import QtQuick.VirtualKeyboard.Settings 2.0

//import QZXing 2.3

Window {
    id: root
    //    visibility: Window.FullScreen //會閃爍呀 e04 //經設置openGL解決!!!
    visible: true
    width: 1024
    height: 800
    //    width: Screen.width + 1
    //    height: Screen.height + 1
    title: qsTr("新生文創")
    BusyIndicator {
        id: busyIndicator
        x: 934
        y: 691
    }


    Image{
        id: welcome
        anchors.fill: parent
        state: redirect.welcomeVisible
        source: "img/welcome.jpg"
        opacity: 1
        enabled: true
        states: [
            State {
                name: "nextPage"
                PropertyChanges {
                    target: welcome
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "thisPage"
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
                database.check();
                redirect.welcomeNext();
                timer_button.start();
            }
        }
    }
    Image{
        id: buyORsell
        visible: true
        anchors.fill: parent
        state: redirect.buyORsellVisible
        source: "img/background.jpg"
        opacity: 0
        enabled: false

        states: [
            State {
                name: "nextPage"
                PropertyChanges {
                    target: buyORsell
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "thisPage"
                PropertyChanges {
                    target: buyORsell
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
            id: buyBtn
            x: 227
            y: 474
            width: 200
            height: 120

            source: "img/purchaseButton.jpg"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    timer_button.stop();
                    redirect.toBuy();
                    timer_button.start();
                }
            }
        }
        Image {
            id: sellBtn
            x: 587
            y: 474
            width: 200
            height: 120
            visible: true

            source: "img/uploadButton.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    timer_button.stop();
                    redirect.toSell();
                    timer_button.start();
                }
            }
        }

    }


    Image{
        id: chosechannel
        visible: true
        anchors.fill: parent
        state: redirect.chosechannelVisible
        source: "img/background.jpg"
        opacity: 0
        enabled: false

        states: [
            State {
                name: "nextPage"
                PropertyChanges {
                    target: chosechannel
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "thisPage"
                PropertyChanges {
                    target: chosechannel
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
            id: channelBtn1
            x: 76
            y: 299
            width: 200
            height: 120
            enabled: true
            state: database.ch1State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: channelBtn1
                        source: "img/channel/01-01.jpg"
                        opacity: 1
                        enabled: true
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: channelBtn1
                        source: "img/channel/01-01.jpg"
                        opacity: 0.3
                        enabled: false
                    }
                }
            ]
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    timer_button.stop();
                    database.whichSeleted(1);
                    redirect.toDisplayPrice(1);
                    timer_checkPayment.start();
                    timer_button.start();
                }
            }
        }
        Image {
            id: channelBtn2
            x: 292
            y: 299
            width: 200
            height: 120
            state: database.ch2State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: channelBtn2
                        source: "img/channel/02-01.jpg"
                        opacity: 1
                        enabled: true
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: channelBtn2
                        source: "img/channel/02-01.jpg"
                        opacity: 0.3
                        enabled: false
                    }
                }
            ]

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    timer_button.stop();
                    database.whichSeleted(2);
                    redirect.toDisplayPrice(2);
                    timer_checkPayment.start();
                    timer_button.start();
                }
            }
        }
        Image {
            id: channelBtn3
            x: 518
            y: 299
            width: 200
            height: 120
            enabled: false
            state: database.ch3State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: channelBtn3
                        source: "img/channel/03-01.jpg"
                        opacity: 1
                        enabled: true
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: channelBtn3
                        source: "img/channel/03-01.jpg"
                        opacity: 0.3
                        enabled: false
                    }
                }
            ]
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    timer_button.stop();
                    database.whichSeleted(3);
                    redirect.toDisplayPrice(3);
                    timer_checkPayment.start();
                    timer_button.start();
                }
            }
        }
        Image {
            id: channelBtn4
            x: 743
            y: 299
            width: 200
            height: 120
            visible: true
            enabled: false
            state: database.ch4State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: channelBtn4
                        source: "img/channel/04-01.jpg"
                        opacity: 1
                        enabled: true
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: channelBtn4
                        source: "img/channel/04-01.jpg"
                        opacity: 0.3
                        enabled: false
                    }
                }
            ]
            MouseArea{
                anchors.fill: parent
                onClicked: {
                }
            }
        }
        Image {
            id: channelBtn5
            x: 76
            y: 444
            width: 200
            height: 120
            enabled: false
            state: database.ch5State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: channelBtn5
                        source: "img/channel/05-01.jpg"
                        opacity: 1
                        enabled: true
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: channelBtn5
                        source: "img/channel/05-01.jpg"
                        opacity: 0.3
                        enabled: false
                    }
                }
            ]
            MouseArea{
                anchors.fill: parent
                onClicked: {
                }
            }
        }
        Image {
            id: channelBtn6
            x: 292
            y: 444
            width: 200
            height: 120
            visible: true
            enabled: false
            state: database.ch6State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: channelBtn6
                        source: "img/channel/06-01.jpg"
                        opacity: 1
                        enabled: true
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: channelBtn6
                        source: "img/channel/06-01.jpg"
                        opacity: 0.3
                        enabled: false
                    }
                }
            ]
            MouseArea{
                anchors.fill: parent
                onClicked: {
                }
            }
        }
        Image {
            id: channelBtn7
            x: 518
            y: 444
            width: 200
            height: 120
            enabled: false
            state: database.ch7State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: channelBtn7
                        source: "img/channel/07-01.jpg"
                        opacity: 1
                        enabled: true
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: channelBtn7
                        source: "img/channel/07-01.jpg"
                        opacity: 0.3
                        enabled: false
                    }
                }
            ]
            MouseArea{
                anchors.fill: parent
                onClicked: {
                }
            }
        }
        Image {
            id: channelBtn8
            x: 743
            y: 444
            width: 200
            height: 120
            visible: true
            state: database.ch8State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: channelBtn8
                        source: "img/channel/08-01.jpg"
                        opacity: 1
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: channelBtn8
                        source: "img/channel/08-01.jpg"
                        opacity: 0.3
                    }
                }
            ]
            MouseArea{
                anchors.fill: parent
                onClicked: {
                }
            }
        }
        Image {
            id: channelBtn9
            x: 76
            y: 588
            width: 200
            height: 120
            visible: true
            state: database.ch9State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: channelBtn9
                        source: "img/channel/09-01.jpg"
                        opacity: 1
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: channelBtn9
                        source: "img/channel/09-01.jpg"
                        opacity: 0.3
                    }
                }
            ]
            MouseArea{
                anchors.fill: parent
                onClicked: {
                }
            }
        }
        Image {
            id: channelBtn10
            x: 292
            y: 588
            width: 200
            height: 120
            visible: true
            state: database.ch10State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: channelBtn10
                        source: "img/channel/10-01.jpg"
                        opacity: 1
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: channelBtn10
                        source: "img/channel/10-01.jpg"
                        opacity: 0.3
                    }
                }
            ]
            MouseArea{
                anchors.fill: parent
                onClicked: {
                }
            }
        }
        Image {
            id: channelBtn11
            x: 518
            y: 588
            width: 200
            height: 120
            visible: true
            state: database.ch11State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: channelBtn11
                        source: "img/channel/11-01.jpg"
                        opacity: 1
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: channelBtn11
                        source: "img/channel/11-01.jpg"
                        opacity: 0.3
                    }
                }
            ]
            MouseArea{
                anchors.fill: parent
                onClicked: {
                }
            }
        }
        Image {
            id: channelBtn12
            x: 743
            y: 588
            width: 200
            height: 120
            visible: true
            state: database.ch12State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: channelBtn12
                        source: "img/channel/12-01.jpg"
                        opacity: 1
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: channelBtn12
                        source: "img/channel/12-01.jpg"
                        opacity: 0.3
                    }
                }
            ]
            MouseArea{
                anchors.fill: parent
                onClicked: {
                }
            }
        }

        Rectangle {
            id: backtochooseBandSrectangle
            x: 531
            y: 701
            width: 262
            height: 91
            color: "#ffffff"

            Text {
                width: 262
                height: 91
                text: qsTr("回上一頁")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 60
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    timer_button.stop();
                    redirect.backtowelcomeNext();
                    timer_button.start();
                }
            }
        }

        Timer{
            id: timer_checkPayment
            interval: 2500
            repeat: true
            running: false
            triggeredOnStart: false
            onTriggered: {
                redirect.isPricePayed();
            }
        }
    }
    Image {
        id: displayPrice
        anchors.fill: parent
        state: redirect.displayPriceVisible
        source: "img/background.jpg"
        opacity: 0
        enabled: false
        states: [
            State {
                name: "nextPage"
                PropertyChanges {
                    target: displayPrice
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "thisPage"
                PropertyChanges {
                    target: displayPrice
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
            x: 715
            y: 449
            width: 200
            height: 200
            opacity: 1
            source: "image://colors/"+database.QRcode
            sourceSize.width: 200
            sourceSize.height: 200
//            MouseArea{
//                anchors.fill: parent
//                onClicked: {
//                    timer_button.stop();
//                    redirect.isPricePayed();
//                    timer_button.start();
//                }
//            }
        }

        Rectangle {
            id: backtochoosechannel
            x: 715
            y: 721
            width: 200
            height: 71
            color: "#ffffff"

            Text {
                text: qsTr("回上一頁")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                font.pixelSize: 48
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    timer_button.stop();
                    redirect.backtochoosechannel();
                    timer_button.start();
                }
            }
        }

    }

    Image {
        id: pricePayed
        anchors.fill: parent
        state: redirect.pricePayedVisible
        source: "img/background.jpg"
        opacity: 0
        enabled: false
        states: [
            State {
                name: "nextPage"
                PropertyChanges {
                    target: pricePayed
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "thisPage"
                PropertyChanges {
                    target: pricePayed
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
            timer_checkPayment.stop();
        }
    }


    Image {
        id: signupORsignin
        width: 800
        visible: true
        anchors.fill: parent
        state: redirect.signupORsigninVisible
        source: "img/background.jpg"
        opacity: 1
        enabled: false

        states: [
            State {
                name: "nextPage"
                PropertyChanges {
                    target: signupORsignin
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "thisPage"
                PropertyChanges {
                    target: signupORsignin
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
            id: signinButton
            x: 283
            y: 122
            width: 150
            height: 100
            source: "img/alreadyhave_button.png"
            MouseArea{
                id: mouseArea
                anchors.fill: parent
                onClicked: {
                    timer_button.stop();
                    redirect.toSignin();
                    timer_button.start();
                }
            }
        }
        Image {
            id: signupButton
            x: 610
            y: 122
            width: 150
            height: 100
            source: "img/signup_button.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    timer_button.stop();
                    redirect.toSignup();
                    timer_button.start();
                }
            }
        }

        Item {
            id: itemForsignin
            x: 162
            y: 379
            width: 700
            height: 432
            state: redirect.toSigninVisible
            states: [
                State {
                    name: "off"
                    PropertyChanges {
                        target: itemForsignin
                        opacity: 0
                        enabled: false
                    }
                },
                State {
                    name: "on"
                    PropertyChanges {
                        target: itemForsignin
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
                id: notverifiedText
                x: 247
                y: -8
                text: redirect.notverifyText
                color: "#FF0000"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 30
            }

            Text {
                id: accForSignin
                x: 154
                y: 33
                text: qsTr("帳號")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 30
            }
            Text {
                id: pwdForSignin
                x: 154
                y: 96
                text: qsTr("密碼")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 30
            }
            TextField {
                id: accInputForSignin
                x: 247
                y: 28
                text: ""
                onPressed: {
                    timer_button.stop();
                    inputPanel.visible = true; //需要輸入，顯示鍵盤
                    timer_button.start();
                }
                onTextChanged: {
                    timer_button.stop();
                    timer_button.start();
                }

            }

            TextField {
                id: pwdInputForSignin
                x: 247
                y: 96
                text: ""
                onPressed: {
                    timer_button.stop();
                    inputPanel.visible = true; //需要輸入，顯示鍵盤
                    timer_button.start();
                }
                onTextChanged: {
                    timer_button.stop();
                    timer_button.start();
                }
            }

            Button {
                id: submitForSignin
                x: 478
                y: 96
                text: qsTr("登入")
                onClicked: {
                    timer_button.stop()
                    redirect.to_uploadCH(
                                accInputForSignin.text
                                ,pwdInputForSignin.text
                                );
                    timer_button.start()
                }
            }
        }

        Item {
            id: itemForsignup
            x: 162
            y: 228
            width: 700
            height: 484
            state: redirect.toSignupVisible
            states: [
                State {
                    name: "off"
                    PropertyChanges {
                        target: itemForsignup
                        opacity: 0
                        enabled: false
                    }
                },
                State {
                    name: "on"
                    PropertyChanges {
                        target: itemForsignup
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
                id: signupnotifyText
                x: 224
                y: 20
                color: "#ff1515"
                text: redirect.signupnotifyText
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 30
            }
            Text {
                id: accForsignup
                x: 129
                y: 86
                text: qsTr("設定帳號")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 30
            }


            Text {
                id: pwdForsignup
                x: 129
                y: 132
                text: qsTr("設定密碼")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 30
            }


            Text {
                id: bankForsignup
                x: 129
                y: 178
                text: qsTr("銀行帳號")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 30
            }

            Text {
                id: emailForsignup
                x: 132
                y: 224
                text: qsTr("電子郵件")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 30
            }

            TextField {
                id: accInputForsignup
                x: 282
                y: 81
                text: ""
                onPressed: {
                    timer_button.stop();
                    inputPanel.visible = true; //需要輸入，顯示鍵盤
                    timer_button.start();
                }
                onTextChanged: {
                    timer_button.stop();
                    timer_button.start();
                }
            }
            TextField {
                id: pwdInputForsignup
                x: 282
                y: 127
                onPressed: {
                    timer_button.stop();
                    inputPanel.visible = true; //需要輸入，顯示鍵盤
                    timer_button.start();
                }
                onTextChanged: {
                    timer_button.stop();
                    timer_button.start();
                }
            }

            TextField {
                id: bankInputForsignup
                x: 282
                y: 173
                onPressed: {
                    timer_button.stop();
                    inputPanel.visible = true; //需要輸入，顯示鍵盤
                    timer_button.start();
                }
                onTextChanged: {
                    timer_button.stop();
                    timer_button.start();
                }
            }

            TextField {
                id: emailInputForSignup
                x: 282
                y: 218
                onPressed: {
                    timer_button.stop();
                    inputPanel.visible = true; //需要輸入，顯示鍵盤
                    timer_button.start();
                }
                onTextChanged: {
                    timer_button.stop();
                    timer_button.start();
                }
            }

            Button {
                id: submitForSignup
                x: 515
                y: 219
                text: qsTr("註冊")
                onClicked: {
                    timer_button.stop();
                    redirect.signup(
                                accInputForsignup.text,
                                pwdInputForsignup.text,
                                bankInputForsignup.text,
                                emailInputForSignup.text
                                );
                    timer_button.start();
                }
            }
        }
    }



    Image {
        id: uploadCH
        anchors.fill: parent
        state: redirect.uploadCHVisible
        source: "img/background.jpg"
        opacity: 0
        enabled: false

        states: [
            State {
                name: "nextPage"
                PropertyChanges {
                    target: uploadCH
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "thisPage"
                PropertyChanges {
                    target: uploadCH
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
            id: uploadchannelBtn1
            x: 76
            y: 299
            width: 200
            height: 120
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    timer_button.stop();
                    database.upload_whichSeleted(1);
                    redirect.to_uploadInput(1);
                    timer_button.start();
                }
            }
            state: database.ch1State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: uploadchannelBtn1
                        enabled: false
                        opacity: .3
                        source: "img/channel/01-01.jpg"
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: uploadchannelBtn1
                        enabled: true
                        opacity: 1
                        source: "img/channel/01-01.jpg"
                    }
                }]
        }

        Image {
            id: uploadchannelBtn2
            x: 292
            y: 299
            width: 200
            height: 120
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    timer_button.stop();
                    database.upload_whichSeleted(2);
                    redirect.to_uploadInput(2);
                    timer_button.start();
                }
            }
            state: database.ch2State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: uploadchannelBtn2
                        enabled: false
                        opacity: .3
                        source: "img/channel/01-01.jpg"
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: uploadchannelBtn2
                        enabled: true
                        opacity: 1
                        source: "img/channel/01-01.jpg"
                    }
                }]
        }

        Image {
            id: uploadchannelBtn3
            x: 518
            y: 299
            width: 200
            height: 120
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    timer_button.stop();
                    database.upload_whichSeleted(3);
                    redirect.to_uploadInput(3);
                    timer_button.start();
                }
            }
            state: database.ch3State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: uploadchannelBtn3
                        enabled: false
                        opacity: .3
                        source: "img/channel/01-01.jpg"
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: uploadchannelBtn3
                        enabled: true
                        opacity: 1
                        source: "img/channel/01-01.jpg"
                    }
                }]
        }

        Image {
            id: uploadchannelBtn4
            x: 743
            y: 299
            width: 200
            height: 120
            MouseArea {
                anchors.fill: parent
            }
            enabled: false
            visible: true
            state: database.ch4State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: uploadchannelBtn4
                        enabled: false
                        opacity: .3
                        source: "img/channel/01-01.jpg"
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: uploadchannelBtn4
                        enabled: true
                        opacity: 1
                        source: "img/channel/01-01.jpg"
                    }
                }]
        }

        Image {
            id: uploadchannelBtn5
            x: 76
            y: 444
            width: 200
            height: 120
            MouseArea {
                anchors.fill: parent
            }
            enabled: false
            state: database.ch5State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: uploadchannelBtn5
                        enabled: false
                        opacity: .3
                        source: "img/channel/01-01.jpg"
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: uploadchannelBtn5
                        enabled: true
                        opacity: 1
                        source: "img/channel/01-01.jpg"
                    }
                }]
        }

        Image {
            id: uploadchannelBtn6
            x: 292
            y: 444
            width: 200
            height: 120
            MouseArea {
                anchors.fill: parent
            }
            enabled: false
            visible: true
            state: database.ch6State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: uploadchannelBtn6
                        enabled: false
                        opacity: .3
                        source: "img/channel/01-01.jpg"
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: uploadchannelBtn6
                        enabled: true
                        opacity: 1
                        source: "img/channel/01-01.jpg"
                    }
                }]
        }

        Image {
            id: uploadchannelBtn7
            x: 518
            y: 444
            width: 200
            height: 120
            MouseArea {
                anchors.fill: parent
            }
            enabled: false
            state: database.ch7State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: uploadchannelBtn7
                        enabled: false
                        opacity: .3
                        source: "img/channel/01-01.jpg"
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: uploadchannelBtn7
                        enabled: true
                        opacity: 1
                        source: "img/channel/01-01.jpg"
                    }
                }]
        }

        Image {
            id: uploadchannelBtn8
            x: 743
            y: 444
            width: 200
            height: 120
            MouseArea {
                anchors.fill: parent
            }
            visible: true
            state: database.ch8State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: uploadchannelBtn8
                        enabled: false
                        opacity: .3
                        source: "img/channel/01-01.jpg"
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: uploadchannelBtn8
                        enabled: true
                        opacity: 1
                        source: "img/channel/01-01.jpg"
                    }
                }]
        }

        Image {
            id: uploadchannelBtn9
            x: 76
            y: 588
            width: 200
            height: 120
            MouseArea {
                anchors.fill: parent
            }
            visible: true
            state: database.ch9State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: uploadchannelBtn9
                        enabled: false
                        opacity: .3
                        source: "img/channel/01-01.jpg"
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: uploadchannelBtn9
                        enabled: true
                        opacity: 1
                        source: "img/channel/01-01.jpg"
                    }
                }]
        }

        Image {
            id: uploadchannelBtn10
            x: 292
            y: 588
            width: 200
            height: 120
            MouseArea {
                anchors.fill: parent
            }
            visible: true
            state: database.ch10State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: uploadchannelBtn10
                        enabled: false
                        opacity: .3
                        source: "img/channel/01-01.jpg"
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: uploadchannelBtn10
                        enabled: true
                        opacity: 1
                        source: "img/channel/01-01.jpg"
                    }
                }]
        }

        Image {
            id: uploadchannelBtn11
            x: 518
            y: 588
            width: 200
            height: 120
            MouseArea {
                anchors.fill: parent
            }
            visible: true
            state: database.ch11State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: uploadchannelBtn11
                        enabled: false
                        opacity: .3
                        source: "img/channel/01-01.jpg"
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: uploadchannelBtn11
                        enabled: true
                        opacity: 1
                        source: "img/channel/01-01.jpg"
                    }
                }]
        }

        Image {
            id: uploadchannelBtn12
            x: 743
            y: 588
            width: 200
            height: 120
            MouseArea {
                anchors.fill: parent
            }
            visible: true
            state: database.ch12State
            states: [
                State {
                    name: "available"
                    PropertyChanges {
                        target: uploadchannelBtn12
                        enabled: false
                        opacity: .3
                        source: "img/channel/01-01.jpg"
                    }
                },
                State {
                    name: "unavailable"
                    PropertyChanges {
                        target: uploadchannelBtn12
                        enabled: true
                        opacity: 1
                        source: "img/channel/01-01.jpg"
                    }
                }]
        }
    }


    Image {
        id: to_uploadInput
        anchors.fill: parent
        state: redirect.to_uploadInputVisible
        source: "img/background.jpg"
        opacity: 0
        enabled: false

        Text {
            id: infoForGood_text
            x: 259
            y: 317
            text: qsTr("商品資訊")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 30
        }

        Text {
            id: priceForGood_text
            x: 259
            y: 385
            text: qsTr("設定價格")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 30
        }

        Text {
            id: remarkForGood_text
            x: 259
            y: 460
            text: qsTr("商品備註")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 30
        }

        TextField {
            id: infoForGood_input
            x: 412
            y: 312
            text: ""
            onPressed: {
                timer_button.stop();
                inputPanel.visible = true; //需要輸入，顯示鍵盤
                timer_button.start();
            }
            onTextChanged: {
                timer_button.stop();
                timer_button.start();
            }
        }

        TextField {
            id: priceForGood_input
            x: 412
            y: 380
            text: ""
            onPressed: {
                timer_button.stop();
                inputPanel.visible = true; //需要輸入，顯示鍵盤
                timer_button.start();
            }
            onTextChanged: {
                timer_button.stop();
                timer_button.start();
            }
        }

        TextField {
            id: remarkForGood_input
            x: 412
            y: 455
            text: ""
            onPressed: {
                timer_button.stop();
                inputPanel.visible = true; //需要輸入，顯示鍵盤
                timer_button.start();
            }
            onTextChanged: {
                timer_button.stop();
                timer_button.start();
            }
        }

        Button {
            id: submitForGood
            x: 647
            y: 455
            text: qsTr("上架商品")
            onClicked: {
                timer_button.stop();
                redirect.uploadGood();
                checkChennelStatus.start();
                timer_button.start();
            }
        }
        states: [
            State {
                name: "nextPage"
                PropertyChanges {
                    target: to_uploadInput
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "thisPage"
                PropertyChanges {
                    target: to_uploadInput
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
        id: checkChennelStatus
        interval: 3000
        repeat: true
        running: false
        triggeredOnStart: false
        onTriggered: {
            redirect.waitForUpload(
                        infoForGood_input.text,
                        priceForGood_input.text,
                        remarkForGood_input.text
                        );
        }
    }



    Image {
        id: uploading
        anchors.fill: parent
        state: redirect.uploadingVisible
        source: "img/background.jpg"
        opacity: 0
        enabled: false

        Text {
            id: element
            x: 285
            y: 346
            width: 454
            height: 122
            text: qsTr("請將物品放入，並關上蓋子")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 36
        }
        states: [
            State {
                name: "nextPage"
                PropertyChanges {
                    target: uploading
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "thisPage"
                PropertyChanges {
                    target: uploading
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
        id: uploadFinished
        anchors.fill: parent
        state: redirect.uploadFinishedVisible
        source: "img/background.jpg"
        opacity: 0
        enabled: false
        states: [
            State {
                name: "nextPage"
                PropertyChanges {
                    target: uploadFinished
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "thisPage"
                PropertyChanges {
                    target: uploadFinished
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
        Connections{
            onStateChanged:{
                checkChennelStatus.stop();
            }
        }
    }

    Item {
        id: forInputPanel
        x: 90
        y: 546
        width: 845
        height: 254
        anchors.bottom: parent.bottom
        InputPanel {
            id: inputPanel
            visible: false
            x: 739
            y: 151
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            //这种集成方式下点击隐藏键盘的按钮是没有效果的，
            //只会改变active，因此我们自己处理一下
            onActiveChanged: {
                if(!active) { visible = false; }
            }
            Component.onCompleted: {
                VirtualKeyboardSettings.activeLocales=["zh_TW","en_US"]
            }
        }
    }

    Timer{
        id: timer_button
        interval: 10000
        repeat: false
        running: false
        triggeredOnStart: false
        onTriggered: {
            redirect.timeoutReset();
            timer_checkPayment.stop();
            checkChennelStatus.stop();
        }
    }

}

/*##^##
Designer {
    D{i:1;invisible:true}D{i:2;invisible:true}D{i:10;invisible:true}D{i:102;anchors_height:100;anchors_width:100}
D{i:103;invisible:true}D{i:21;invisible:true}D{i:113;invisible:true}D{i:104;invisible:true}
D{i:120;invisible:true}D{i:133;invisible:true}D{i:159;invisible:true}D{i:239;invisible:true}
D{i:254;invisible:true}D{i:262;invisible:true}D{i:270;invisible:true}
}
##^##*/
