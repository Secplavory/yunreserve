import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.2
import QtQuick.VirtualKeyboard 2.3 //打包需要將qtQuick/virtualkeyboard 和 Qt5VirtualKeyboard加入
//import QtQuick.virtualkeyboard.setting 2.3

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

            source: "img/uploadButton.jpg"
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
//                    timer_checkPayment.start();
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
                    redirect.toDisplayPrice();                    timer_checkPayment.start();
//                    timer_checkPayment.start();

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
                    redirect.toDisplayPrice();                    timer_checkPayment.start();
//                    timer_checkPayment.start();

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
            x: 362
            y: 331
//            source: "image://QZXing/encode/" + database.QRcode +
//                    "?correctionLevel=M" +
//                    "&format=qrcode"
//            Connections{
//                target:CodeImage
//                onCallQmlRefeshImg:{
//                    console.log("onCallQmlRefeshImg被呼叫")
//                    img.source=""
//                    img.source="image://CodeImg"
//                }
//            }
            source: "image://colors/"+database.QRcode

            sourceSize.width: 320
            sourceSize.height: 320
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    timer_button.stop();
//                    timer_checkPayment.stop();
//                    database.pricePayed();
                    redirect.isPricePayed();
//                    redirect.pricePayed();
                    timer_button.start();
                }
            }
        }

    }
    Timer{
        id: timer_checkPayment
        interval: 2500
        repeat: true
        running: false
        triggeredOnStart: true
        onTriggered: {
            database.isPricePayed();
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
    }


    Image {
        id: signupORsignin
        width: 800
        visible: true
        anchors.fill: parent
        state: redirect.signupORsigninVisible
        source: "img/background.jpg"
        opacity: 0
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
            x: 277
            y: 262
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
            x: 604
            y: 262
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
                id: accForSignin
                x: 154
                y: 33
                text: qsTr("學號")
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
            }

            Button {
                id: submitForSignin
                x: 478
                y: 96
                text: qsTr("送出")
            }
        }

        Item {
            id: itemForsignup
            x: 162
            y: 340
            width: 700
            height: 432
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
                id: accForsignup
                x: 157
                y: 30
                text: qsTr("學號")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 30
            }


            Text {
                id: pwdForsignup
                x: 127
                y: 76
                text: qsTr("設定密碼")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 30
            }


            Text {
                id: bankForsignup
                x: 127
                y: 122
                text: qsTr("銀行帳號")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 30
            }

            Text {
                id: emailForsignup
                x: 130
                y: 168
                text: qsTr("電子郵件")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 30
            }

            TextField {
                id: accInputForsignup
                x: 280
                y: 25
                text: ""
                onPressed: {
                    timer_button.stop();
                    inputPanel.visible = true; //需要輸入，顯示鍵盤
                    timer_button.start();
                }
            }
            TextField {
                id: pwdInputForsignup
                x: 280
                y: 71
                onPressed: {
                    timer_button.stop();
                    inputPanel.visible = true; //需要輸入，顯示鍵盤
                    timer_button.start();
                }
            }

            TextField {
                id: bankInputForsignup
                x: 280
                y: 117
                onPressed: {
                    timer_button.stop();
                    inputPanel.visible = true; //需要輸入，顯示鍵盤
                    timer_button.start();
                }
            }

            TextField {
                id: pwdInputForSignup
                x: 280
                y: 162
                onPressed: {
                    timer_button.stop();
                    inputPanel.visible = true; //需要輸入，顯示鍵盤
                    timer_button.start();
                }
            }

            Button {
                id: submitForSignup
                x: 513
                y: 163
                text: qsTr("送出")
                onClicked: {
                    redirect.to_uploadCH();
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
                    redirect.to_uploadInput();
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
                    redirect.to_uploadInput();
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
                    redirect.to_uploadInput();
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

        }

        Button {
            id: submitForGood
            x: 647
            y: 455
            text: qsTr("送出")
            onClicked: {
                timer_button.stop();
                database.uploadGood(infoForGood_input.text,
                                    priceForGood_input.text,
                                    remarkForGood_input.text);
                redirect.upload_finished();
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
        }
    }



    Timer{
        id: timer_button
        interval: 5000
        repeat: false
        running: false
        triggeredOnStart: false
        onTriggered: {
            redirect.timeoutReset();
            timer_checkPayment.stop();
        }
    }
    BusyIndicator {
        id: busyIndicator
        x: 934
        y: 691
    }






    /*TextField {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        onPressed: {
            inputPanel.visible = true; //当选择输入框的时候才显示键盘
        }
    }

    Text {
            text: qsTr("Hello world")
            anchors.horizontalCenterOffset: 0
            anchors.verticalCenterOffset: 1
            anchors.centerIn: parent
        }*/



    /*Rectangle{
        id: root
        anchors.fill: parent
        width: parent.width
        height: parent.height
        enabled: true
        visible: true
        transitions: [
            Transition {
                NumberAnimation {
                    property: "opacity";
                    easing.type: Easing.InOutQuad;
                    duration: 1000;
                }
            }
        ]

        states: [
            State {
                name: "initial"
                PropertyChanges {
                    target: backGroundIMG
                    opacity: 0
                    enabled: false
                }
                PropertyChanges {
                    target: welcome
                    opacity: 1
                    enabled: true
                }
            },
            State {
                name: "displayBackGroundIMG"
                PropertyChanges {
                    target: welcome
                    opacity: 0
                    enabled: false
                }
                PropertyChanges {
                    target: backGroundIMG
                    opacity: 1
                    enabled: true
                }
            }
        ]

        Image {
            id: welcome
            anchors.fill: parent
            width: parent.width
            height: parent.height
            enabled: true
            visible: true

            source: "welcome.jpg"

            NumberAnimation on opacity {
            id: createAnimation
            from: 1
            to: 0
            duration: 2000
            onRunningChanged: {
                if (!running) {
                    welcome.destroy();
                }
            }
        }

            MouseArea{
                id: welcomeDestroyButton
                anchors.fill: parent
                onClicked: {
                    //gemini.begin()
                    //connectMYSQL.begin()
                    //welcomeDestroyButton.visible=false;
                    //welcome.visible = false
                    //welcomeDestroyButton.visible = false
                    //root.state = "displayBackGroundIMG"
                    //backGroundIMG.state = "start"
                    //timer_button.start()
                    //connectMYSQL.begin()
                    fadeOut()
                }
            }
        }
        Image {
            id: backGroundIMG
            anchors.fill: parent
            width: parent.width
            height: parent.height
            clip: false
            source: "background.jpg"
            state: "initial"
            transitions: [
                Transition {
                    NumberAnimation {
                        property: "opacity";
                        easing.type: Easing.InOutQuad;
                        duration: 1000;
                    }
                }
            ]
            states: [
                State {
                    name: "initial"
                    PropertyChanges {
                        target: purchaseORuploadWidget
                        opacity: 0
                        enabled: false
                    }
                    PropertyChanges {
                        target: choseChannal
                        opacity: 0
                        enabled: false
                    }
                },
                State {
                    name: "start"
                    PropertyChanges {
                        target: choseChannal
                        opacity: 0
                        enabled: false
                    }
                    PropertyChanges {
                        target: purchaseORuploadWidget
                        opacity: 1
                        enabled: true
                    }
                },
                State {
                    name: "toPurchase"
                    PropertyChanges {
                        target: purchaseORuploadWidget
                        opacity: 0
                        enabled: false
                    }
                    PropertyChanges {
                        target: choseChannal
                        opacity: 1
                        enabled: true
                    }
                },
                State {
                    name: "itemINFO"
                    PropertyChanges {
                        target: purchaseORuploadWidget
                        opacity: 0
                        enabled: false
                    }
                    PropertyChanges {
                        target: choseChannal
                        opacity: 0
                        enabled: false
                    }
                },
                State {
                    name: "toUpload"
                    PropertyChanges {
                        target: purchaseORuploadWidget
                        opacity: 0
                        enabled: false
                    }
                    PropertyChanges {
                        target: choseChannal
                        opacity: 0
                        enabled: false
                    }
                }
            ]

            Item {
                id: purchaseORuploadWidget
                Image {
                    id: purchaseIMG
                    x: 180
                    y: 300
                    width: 160
                    height: 120
                    source: "purchaseButton.jpg"
                    fillMode: Image.PreserveAspectFit
                    MouseArea{
                        id: toPerchaseButton
                        anchors.fill: parent
                        onClicked: {
                            backGroundIMG.state = "toPurchase"
                        }
                    }
                }
                Image {
                    id: uploadIMG
                    x: 450
                    y: 300
                    width: 160
                    height: 120
                    source: "uploadButton.jpg"
                    fillMode: Image.PreserveAspectFit
                    MouseArea{
                        id: toUploadButton
                        anchors.fill: parent
                        onClicked: {
                            backGroundIMG.state = "toUpload"
                        }
                    }
                }
            }

            Item {
                id: choseChannal

                Image {
                    id: channal01
                    x: 180
                    y: 203
                    width: 100
                    height: 100
                    source: "purchaseButton.jpg"
                    fillMode: Image.PreserveAspectFit
                    MouseArea{
                        id: purchaseChannal01
                        anchors.fill: parent
                        onClicked: {
                            backGroundIMG.state = "itemINFO"
                        }
                    }
                }

                Image {
                    id: channal02
                    x: 306
                    y: 203
                    width: 100
                    height: 100
                    source: "purchaseButton.jpg"
                    fillMode: Image.PreserveAspectFit
                }


            }


            TextField {
                id: textField
                x: 300
                y: 229
                onPressed: {
                    inputPanel.visible = true; //当选择输入框的时候才显示键盘
                }
            }
        }
    }*/
}

