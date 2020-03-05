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
    visibility: Window.FullScreen
    color: "#ffffff"
    title: qsTr("新生文創")

    AnimatedImage {
        id: animatedImage
        x: 376
        y: 272
        width: 200
        height: 200
        anchors.verticalCenterOffset: 45
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "img/Spinner.gif"
    }


    Timer{
        id: timer_CheckChannel
        interval: 2000
        repeat: true
        running: false
        triggeredOnStart: false
        onTriggered: {
            //            logout_button.enabled = false
            //            keepChooseChannel.enabled = false
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
                a = 45;
            }
        }
        onTriggered: {
            reset_counter.c = "距離登出剩餘:"+a+"秒"
            a-=1
            if(a<0){
                ui.reset()
                ui.logout();
                keepChooseChannel.enabled = false
                running = false
                reset_counter.c = ""
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
                upload_ItemInfo_Item.anchors.bottomMargin+=50
                login_signup_Item.anchors.bottomMargin+=100
                signup_Item.anchors.bottomMargin+=100
                login_Item.anchors.bottomMargin+=50
                updateUser_Item.anchors.bottomMargin+=100
                updateItem_Item.anchors.bottomMargin+=100
                forgetUser_Item.anchors.bottomMargin+=100

            }
            if(!active) {
                login_signup_Item.anchors.bottomMargin-=100
                signup_Item.anchors.bottomMargin-=100
                login_Item.anchors.bottomMargin-=50
                upload_ItemInfo_Item.anchors.bottomMargin-=50
                updateUser_Item.anchors.bottomMargin-=100
                updateItem_Item.anchors.bottomMargin-=100
                forgetUser_Item.anchors.bottomMargin-=100
                animatedImage.forceActiveFocus()
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

    Image {
        id: logout_button
        source: "img/HOME.png"
        x: 518
        y: 686
        z: 98
        width: 75
        height: 75
        anchors.horizontalCenterOffset: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        onEnabledChanged: {
            if(enabled==false){
                opacity = 0.5
            }
            if(enabled==true){
                opacity = 1
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                keepChooseChannel.enabled = false
                timer_Reset.stop()
                timer_afterTHX.stop()
                ui.logout();
                ui.reset();
                reset_counter.c = ""
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
        id: keepChooseChannel
        source: "img/keepChooseChannel.png"
        x: 488
        y: 678
        width: 75
        height: 75
        z: 98
        enabled: false
        opacity: 0
        anchors.horizontalCenterOffset: -60
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        onEnabledChanged: {
            if(enabled==false){
                opacity = 0
            }
            if(enabled==true){
                opacity = 1
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                enabled = false
                timer_afterTHX.stop()
                timer_Reset.start()
                ui.keepChooseChannel()
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

    Text{
        id: reset_counter
        property var c: ""
        x: 429
        y: 705
        z: 98
        text: c
        font.family: "Microsoft YaHei UI"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 12
    }





    Image {
        id: welcome
        anchors.fill: parent

        source: "img/background.jpg"
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
        Image {
            id: welcome_icon
            source: "img/brandIcon2.png"
            width: 300
            height: 300
            anchors.verticalCenterOffset: -280
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        Image {
            id: welcome_Text
            x: 174
            y: 278
            width: 628
            height: 231
            anchors.verticalCenterOffset: 30
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/welcome_Text.png"
        }
        AnimatedImage {
            id: clickNotify
            width: 375
            height: 75
            anchors.verticalCenterOffset: 230
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/clickToStart.gif"
        }
    }
    Image {
        id: upload_thankYou
        source: "img/background.jpg"
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
                keepChooseChannel.enabled = true
            }
            if(state=="0"){
                logout_button.anchors.horizontalCenterOffset = 0
                keepChooseChannel.enabled = false
            }
        }

        Image {
            id: upload_thankYou_icon
            width: 300
            height: 300
            anchors.verticalCenterOffset: -280
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/brandIcon2.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: upload_thankYou_Text
            x: 1
            y: -6
            width: 1000
            height: 200
            anchors.verticalCenterOffset: 30
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: "img/thankYou_Text.png"
            fillMode: Image.PreserveAspectFit
        }

    }
    Image {
        id: updateItem_thankYou
        source: "img/background.jpg"
        anchors.fill: parent
        state: ui.updateItem_thankYouVisible
        onStateChanged: {
            if(state=="1"){
                timer_Reset.stop()
                timer_afterTHX.start()
                logout_button.enabled = true
                logout_button.anchors.horizontalCenterOffset = 60
                keepChooseChannel.enabled = true
            }
            if(state=="0"){
                logout_button.anchors.horizontalCenterOffset = 0
                keepChooseChannel.enabled = false
            }
        }

        Image {
            id: updateItem_thankYou_icon
            width: 300
            height: 300
            anchors.verticalCenterOffset: -280
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/brandIcon2.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: updateItem_thankYou_Text
            x: 1
            y: -6
            width: 1000
            height: 200
            anchors.verticalCenterOffset: 30
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: "img/thankYou_Text.png"
            fillMode: Image.PreserveAspectFit
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
    }
    Image {
        id: takeOff_thankYou
        source: "img/background.jpg"
        anchors.fill: parent
        state: ui.takeOff_thankYouVisible
        onStateChanged: {
            if(state=="1"){
                timer_Reset.stop()
                timer_afterTHX.start()
                logout_button.anchors.horizontalCenterOffset = 60
                keepChooseChannel.enabled = true
            }
            if(state=="0"){
                logout_button.anchors.horizontalCenterOffset = 0
                keepChooseChannel.enabled = false
            }
        }

        Image {
            id: takeOff_thankYou_icon
            width: 300
            height: 300
            anchors.verticalCenterOffset: -280
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/brandIcon2.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: takeOff_thankYou_Text
            width: 1000
            height: 200
            anchors.verticalCenterOffset: 30
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/thankYou_Text.png"
            fillMode: Image.PreserveAspectFit
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

    }
    Image {
        id: thanksForPerchase
        anchors.fill: parent
        source: "img/background.jpg"
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
                keepChooseChannel.enabled = true
            }
            if(state=="0"){
                logout_button.anchors.horizontalCenterOffset=0
                keepChooseChannel.enabled = false
            }
        }

        Image {
            id: thanksForPerchase_icon
            width: 300
            height: 300
            anchors.verticalCenterOffset: -280
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/brandIcon2.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: thanksForPerchase_Text
            width: 1000
            height: 200
            anchors.verticalCenterOffset: 30
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/thankYou_Text.png"
            fillMode: Image.PreserveAspectFit
        }
    }
    Image {
        id: forgetUser_thankYou
        source: "img/background.jpg"
        anchors.fill: parent
        state: ui.forgetUser_thankYouVisible
        onStateChanged: {
            if(state=="1"){
                timer_Reset.stop()
                timer_afterTHX.start()
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

        Image {
            id: forgetUser_icon
            source: "img/brandIcon2.png"
            width: 300
            height: 300
            anchors.verticalCenterOffset: -280
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        AnimatedImage {
            id: forgetUser_icon_bird
            width: 200
            height: 200
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/mail_icon.gif"
        }

        AnimatedImage {
            id: forgetUser_thankYou_Text
            x: 262
            y: 414
            width: 700
            height: 100
            currentFrame: 2
            paused: false
            anchors.horizontalCenterOffset: 0
            anchors.verticalCenterOffset: 120
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/verifyMail_Text.gif"
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
                keepChooseChannel.enabled = false
                keepChooseChannel.opacity = 0
            }
            if(state=="0"){
                timer_CheckChannel.stop()
                logout_button.enabled = true
            }
        }

        Image {
            id: waitForClose_icon
            width: 300
            height: 300
            anchors.verticalCenterOffset: -280
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/brandIcon2.png"
            fillMode: Image.PreserveAspectFit
        }

        AnimatedImage {
            id: animatedImage1
            width: 500
            height: 100
            anchors.verticalCenterOffset: 50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/pleaseCloseDoor.gif"
        }
    }
    Image {
        id: updateUser_thankYou
        source: "img/background.jpg"
        anchors.fill: parent
        state: ui.updateUser_thankYouVisible
        onStateChanged: {
            if(state=="1"){
                timer_Reset.stop()
                timer_afterTHX.start()
            }
        }

        Image {
            id: updateUser_thankYou_icon
            width: 300
            height: 300
            anchors.verticalCenterOffset: -280
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/brandIcon2.png"
            fillMode: Image.PreserveAspectFit
        }

        AnimatedImage {
            id: updateUser_thankYou_Text
            x: 1
            y: -6
            width: 750
            height: 150
            anchors.verticalCenterOffset: 30
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: "img/verifyMail_Text.gif"
            fillMode: Image.PreserveAspectFit
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
        id: signup_thankYou
        source: "img/background.jpg"
        anchors.fill: parent
        state: ui.signup_thankYouVisible
        onStateChanged: {
            if(state=="1"){
                timer_Reset.stop()
                timer_afterTHX.start()
            }
        }

        Image {
            id: signup_thankYou_icon
            width: 300
            height: 300
            anchors.verticalCenterOffset: -280
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/brandIcon2.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: signup_thankYou_Text
            x: 1
            y: -6
            width: 750
            height: 150
            anchors.verticalCenterOffset: 30
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: "img/verifyMail_Text.gif"
            fillMode: Image.PreserveAspectFit
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
                logout_button.anchors.horizontalCenterOffset = 0
                keepChooseChannel.enabled = false
            }
            if(state=="1"){
                logout_button.anchors.horizontalCenterOffset = 60
                logout_button.opacity=1
                logout_button.enabled=true
                keepChooseChannel.enabled = true
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
            Image {
                id: updateItem_submit
                source: "img/submit.png"
                x: 662
                y: 255
                width: 70
                height: 70
                anchors.left: parent.left
                anchors.leftMargin: 449
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 89
                MouseArea{
                    anchors.fill: parent
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
                    onPressed: parent.opacity=0.5
                    onReleased: parent.opacity=1
                }
            }
            TextField{
                id: updateItem_RemarkField
                x: 432
                y: 269
                anchors.left: parent.left
                placeholderText: "空白即不更改此項目"
                maximumLength: 30
                anchors.leftMargin: 220
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 104
                onPressed: {
                    inputPanel.active
                    timer_Reset.restart()
                }
                onTextChanged: timer_Reset.restart()
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
                placeholderText: "空白即不更改此項目"
                maximumLength: 5
                anchors.leftMargin: 220
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 176
                onPressed: {
                    inputPanel.active
                    timer_Reset.restart()
                }
                onTextChanged: timer_Reset.restart()
            }

            TextField{
                id: updateItem_NameField
                x: 432
                y: 123
                anchors.left: parent.left
                placeholderText: "空白即不更改此項目"
                maximumLength: 20
                anchors.leftMargin: 220
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 250
                onPressed: {
                    inputPanel.active
                    timer_Reset.restart()
                }
                onTextChanged: timer_Reset.restart()

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
                onTextChanged: {
                    if(text=="處理中，請稍後"){
                        keepChooseChannel.enabled = false
                        logout_button.enabled = false
                    }else{
                        keepChooseChannel.enabled = true
                        logout_button.enabled = true
                    }
                }

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
        id: updateUser
        width: 300
        height: 300
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
            updateUser_bankCode_Field.text = ""
            updateUser_phone_Field.text = ""
            updateUser_EmailField_ensure.text = ""
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
                anchors.verticalCenterOffset: -104
                anchors.horizontalCenterOffset: 1
                verticalAlignment: Text.AlignBottom
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.family: "Microsoft YaHei UI"

            }

            Text {
                id: updateUser_Text
                y: 207
                text: qsTr("更改使用者資料")
                anchors.left: parent.left
                anchors.leftMargin: 372
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 520
                font.pointSize: 24
            }
            Text {
                id: updateUser_PWDText
                y: 320
                text: qsTr("更改密碼:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 408
                anchors.left: parent.left
                anchors.leftMargin: 137
                font.pointSize: 24
            }
            TextField{
                id: updateUser_PWDField
                y: 320
                anchors.bottom: parent.bottom
                maximumLength: 12
                echoMode: "Password"
                placeholderText: "空白即不更改此項目"
                anchors.bottomMargin: 408
                anchors.left: parent.left
                anchors.leftMargin: 313
                onPressed: timer_Reset.restart()
            }

            Text {
                id: updateUser_BankACCText
                y: 431
                text: qsTr("銀行帳號:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 297
                anchors.left: parent.left
                anchors.leftMargin: 137
                font.pointSize: 24
            }
            TextField{
                id: updateUser_BankACCField
                y: 431
                placeholderText: "空白即不更改此項目"
                maximumLength: 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 297
                anchors.left: parent.left
                anchors.leftMargin: 313
            }

            Text {
                id: updateUser_EmailText
                y: 377
                text: qsTr("電子郵件:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 351
                anchors.left: parent.left
                anchors.leftMargin: 137
                font.pointSize: 24
            }
            TextField{
                id:updateUser_EmailField
                y: 377
                placeholderText: "空白即不更改此項目"
                anchors.bottom: parent.bottom
                maximumLength: 45
                anchors.bottomMargin: 351
                anchors.left: parent.left
                anchors.leftMargin: 313
            }

            Text {
                id: updateUser_EmailText_ensure
                x: 1
                y: 377
                text: qsTr("確認郵件:")
                anchors.leftMargin: 519
                anchors.bottomMargin: 351
                anchors.left: parent.left
                font.pointSize: 24
                anchors.bottom: parent.bottom
            }

            TextField {
                id: updateUser_EmailField_ensure
                x: 1
                y: 377
                placeholderText: "請重複輸入電子郵件"
                anchors.leftMargin: 695
                maximumLength: 45
                anchors.bottomMargin: 351
                anchors.left: parent.left
                anchors.bottom: parent.bottom
            }

            Text {
                id: updateUser_phone_Text
                x: 517
                y: 320
                text: qsTr("更改電話:")
                anchors.right: parent.right
                anchors.rightMargin: 337
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 408
                font.pointSize: 24
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            TextField {
                id: updateUser_phone_Field
                placeholderText: "空白即不更改此項目"
                x: 694
                y: 320
                maximumLength: 15
                anchors.right: parent.right
                anchors.rightMargin: 131
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 408
            }

            Text {
                id: updateUser_bankCode_Text
                x: 519
                y: 431
                text: qsTr("銀行代號:")
                anchors.bottom: parent.bottom
                horizontalAlignment: Text.AlignHCenter
                anchors.bottomMargin: 297
                font.pointSize: 24
                anchors.right: parent.right
                anchors.rightMargin: 335
                verticalAlignment: Text.AlignVCenter
            }

            TextField {
                id: updateUser_bankCode_Field
                x: 695
                y: 431
                width: 69
                height: 40
                maximumLength: 3
                placeholderText: "可空白"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 297
                anchors.right: parent.right
                anchors.rightMargin: 260
            }
            Image {
                id: updateUser_submit
                source: "img/submit.png"
                y: 500
                width: 75
                height: 75
                anchors.verticalCenterOffset: 131
                anchors.horizontalCenterOffset: 1
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        enabled = false
                        timer_Reset.restart()
                        logout_button.enabled = false
                        ui.updateUser_submit(
                                    updateUser_PWDField.text,
                                    updateUser_BankACCField.text,
                                    updateUser_EmailField.text,
                                    updateUser_EmailField_ensure.text,
                                    updateUser_phone_Field.text,
                                    updateUser_bankCode_Field.text
                                    )
                        enabled = true
                        logout_button.enabled = true
                    }
                    onPressed: parent.opacity = 0.5
                    onReleased: parent.opacity = 1
                }
            }

            Image {
                id: changedUser_qrcode
                x: 39
                y: 16
                width: 100
                height: 100
                anchors.verticalCenterOffset: -144
                anchors.horizontalCenterOffset: 283
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/changeUser_qrcode.jpg"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: changedUser_text
                color: "#ff0000"
                text: qsTr("歡迎使用手機更改")
                anchors.verticalCenterOffset: -213
                anchors.horizontalCenterOffset: 283
                font.pointSize: 16
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignBottom
                horizontalAlignment: Text.AlignHCenter
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
        onStateChanged: {
            if(state=="0"){
                forgetUser_EmailField.text = ""
            }
        }

        Item {
            id: forgetUser_Item
            x: 222
            y: 220
            width: 581
            height: 266
            visible: false
            anchors.right: parent.right
            anchors.rightMargin: 222
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 282
            Text {
                id: forgetUser_notify
                x: 234
                y: 103
                color: "#f43a3a"
                verticalAlignment: Text.AlignBottom
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 12
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                text: ui.forgetUser_notify
                anchors.verticalCenterOffset: 1
                anchors.horizontalCenterOffset: 0
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
                    timer_Reset.restart()
                    inputPanel.active
                }
                onTextChanged: {
                    timer_Reset.restart()
                }
            }
            Image {
                id: forgetUser_submit
                source: "img/submit.png"
                x: 407
                y: 152
                width: 70
                height: 70
                anchors.right: parent.right
                anchors.rightMargin: 104
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 45
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.restart()
                        logout_button.enabled = false
                        enabled = false
                        ui.forgetUser_submit(forgetUser_EmailField.text)
                        enabled = true
                        logout_button.enabled = true
                    }
                    onPressed: parent.opacity = 0.5
                    onReleased: parent.opacity = 1
                }
            }
        }

        Text {
            id: forgetUser_text
            x: 709
            y: 188
            color: "#181616"
            text: qsTr("請由網頁進行帳密恢復")
            font.family: "Microsoft YaHei UI"
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenterOffset: -38
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 16
        }

        Image {
            id: forgetUser_qrcode
            x: 767
            y: 221
            width: 150
            height: 150
            anchors.verticalCenterOffset: 78
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/forgetUser_qrcode.jpg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: image
            width: 300
            height: 300
            anchors.verticalCenterOffset: -280
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/brandIcon2.png"
            fillMode: Image.PreserveAspectFit
        }

    }
    Image {
        id: signup
        source: "img/background.jpg"
        anchors.fill: parent
        state: ui.signupVisible

        Image {
            id: signup_icon
            width: 300
            height: 300
            anchors.verticalCenterOffset: -280
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/brandIcon2.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: signup_text
            text: qsTr("請由網頁進行註冊")
            font.family: "Microsoft YaHei UI"
            anchors.verticalCenterOffset: -48
            anchors.horizontalCenterOffset: 0
            font.pointSize: 16
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        Image {
            id: signup1_qrcode
            width: 150
            height: 150
            anchors.verticalCenterOffset: 68
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/signup_qrcode.jpg"
            fillMode: Image.PreserveAspectFit
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
                    duration: 1000;
                }
            }
        ]

    }

    Image {
        id: changeUser
        source: "img/background.jpg"
        state: ui.changedUserVisble
        anchors.fill: parent

        Image {
            id: changeUser_icon
            width: 300
            height: 300
            anchors.verticalCenterOffset: -280
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/brandIcon2.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: changeUser_text
            text: qsTr("請由網頁更改帳戶資訊")
            font.family: "Microsoft YaHei UI"
            anchors.verticalCenterOffset: -43
            anchors.horizontalCenterOffset: 0
            font.pointSize: 16
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        Image {
            id: changeUser_qrcode
            width: 150
            height: 150
            anchors.verticalCenterOffset: 65
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/changeUser_qrcode.jpg"
            fillMode: Image.PreserveAspectFit
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
                    duration: 1000;
                }
            }
        ]
    }

    Image {
        id: contract
        source: "img/background.jpg"
        width: 1024
        height: 768
        state: ui.contractVisible
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
            },
            State {
                name: "2"
                PropertyChanges {
                    target: contract
                    opacity: 1
                    enabled: true
                }
            },
            State {
                name: "3"
                PropertyChanges {
                    target: contract
                    opacity: 1
                    enabled: true
                }
            }
        ]
        onStateChanged: {
            if(state=="0"){
                backLogin_signup_button.enabled = false
                backLogin_signup_button.opacity = 0
                backChannel_button.enabled = false
                backChannel_button.opacity = 0
                logout_button.enabled = true
                logout_button.opacity = 1
                contract_button.anchors.bottomMargin = 0
            }else{
                logout_button.enabled = false
                logout_button.opacity = 0
                nextPage_button.enabled = false
                lastPage_button.enabled = false
                nextPage_button.opacity = 0
                lastPage_button.opacity = 0
            }
            if(state=="1"){
                backLogin_signup_button.enabled = false
                backLogin_signup_button.opacity = 0
                backChannel_button.enabled = true
                backChannel_button.opacity = 1
            }
            if(state=="2"){
                backLogin_signup_button.enabled = true
                backLogin_signup_button.opacity = 1
                backChannel_button.enabled = false
                backChannel_button.opacity = 0
            }
            if(state=="3"){
                backLogin_signup_button.enabled = false
                backLogin_signup_button.opacity = 0
                backChannel_button.enabled = true
                backChannel_button.opacity = 1
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
        Image {
            id: backChannel_button
            source: "img/keepChooseChannel.png"
            width: 75
            height: 75
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    timer_Reset.restart()
                    ui.contract_to_choseChannel()
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
            id: backLogin_signup_button
            source: "img/keepChooseChannel.png"
            width: 100
            height: 100
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    timer_Reset.restart()
                    ui.contract_to_Login_signup()
                }
                onPressed: {
                    parent.opacity = 0.5
                }
                onReleased: {
                    parent.opacity = 1
                }
            }
        }

        Item {
            id: contract_button
            width: 1024
            height: 768
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0

            Button {
                id: sellContract
                text: qsTr("寄賣契約")
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: -200
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                enabled: false
                opacity: 0
                onClicked: {
                    timer_Reset.restart()
                    ui.seeSellContract()
                    contract_button.anchors.bottomMargin = 300
                    nextPage_button.enabled = true
                    lastPage_button.enabled = true
                    nextPage_button.opacity = 1
                    lastPage_button.opacity = 1
                }
            }
            Button {
                id: useContract
                text: qsTr("使用契約")
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                enabled: false
                opacity: 0
                onClicked: {
                    timer_Reset.restart()
                    ui.seeUseContract()
                    contract_button.anchors.bottomMargin = 300
                    nextPage_button.enabled = true
                    lastPage_button.enabled = true
                    nextPage_button.opacity = 1
                    lastPage_button.opacity = 1
                }
            }
            Button {
                id: priContract
                x: 51
                y: 52
                text: qsTr("隱私權政策")
                anchors.horizontalCenterOffset: 200
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                enabled: false
                opacity: 0
                onClicked: {
                    timer_Reset.restart()
                    ui.seePriContract()
                    contract_button.anchors.bottomMargin = 300
                    nextPage_button.enabled = true
                    lastPage_button.enabled = true
                    nextPage_button.opacity = 1
                    lastPage_button.opacity = 1
                }
            }

            Text {
                id: contract_text
                x: 410
                y: 259
                width: 273
                height: 33
                text: ui.contract_text
                anchors.verticalCenterOffset: 50
                font.pointSize: 24
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenterOffset: 0
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Button {
            id: lastPage_button
            text: qsTr("上一頁")
            anchors.verticalCenterOffset: 225
            anchors.horizontalCenterOffset: -100
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                timer_Reset.restart()
                ui.contractLastPage()
            }
        }

        Button {
            id: nextPage_button
            x: 71
            y: 8
            text: qsTr("下一頁")
            anchors.verticalCenterOffset: 225
            anchors.horizontalCenterOffset: 100
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                timer_Reset.restart()
                ui.contractNextPage()
            }
        }
        Text {
            id: contractContent
            text: ui.contractContent
            anchors.top: parent.top
            anchors.topMargin: 160
            font.pointSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignLeft
        }
        Text {
            id: currentPage_Text
            text: ui.contractPage
            anchors.verticalCenterOffset: 225
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        Image {
            id: contract_qrcode
            width: 150
            height: 150
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "img/contract_qrcode.png"
        }

        Text {
            id: contract_qrcode_text
            text: qsTr("請掃碼閱讀合約內容")
            font.family: "Microsoft YaHei UI"
            anchors.verticalCenterOffset: -100
            font.pointSize: 16
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
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
                anchors.verticalCenterOffset: -280
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/brandIcon2.png"
            }

            Image {
                id: chooseFunction_perchase
                x: 64
                y: 247
                source: "img/purchaseButton.png"
                width: 200
                height: 200
                anchors.horizontalCenterOffset: -250
                anchors.verticalCenterOffset: 0
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
                x: 64
                y: 247
                source: "img/uploadButton.png"
                width: 200
                height: 200
                anchors.horizontalCenterOffset: 0
                anchors.verticalCenterOffset: 0
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
                id: chooseFunction_updataItemInfo
                x: 64
                y: 247
                source: "img/updateItem.png"
                width: 200
                height: 200
                visible: false
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 115
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
                id: chooseFunction_takeOff
                x: 64
                y: 247
                source: "img/takeOff.png"
                width: 200
                height: 200
                anchors.horizontalCenterOffset: 250
                anchors.verticalCenterOffset: 0
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
                id: chooseFunction_updataUserInfo
                x: 64
                y: 247
                source: "img/updateUser.png"
                width: 100
                height: 100
                anchors.horizontalCenterOffset: 0
                anchors.verticalCenterOffset: 180
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        enabled = false
                        timer_Reset.restart()
                        //                        ui.setFunctionHandler(5)
                        //                        ui.login_signup()
                        ui.changeUser()
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
                x: 64
                y: 247
                source: "img/forgetUser.png"
                width: 100
                height: 100
                anchors.horizontalCenterOffset: 160
                anchors.verticalCenterOffset: 180
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

            Image {
                id: chooseFunction_signup
                x: 64
                y: 247
                width: 100
                height: 100
                source: "img/signup_button.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        enabled = false
                        timer_Reset.restart()
                        ui.signupUser()
                        enabled = true
                    }
                    onPressed: {
                        parent.opacity = 0.5
                    }
                    onReleased: {
                        parent.opacity = 1
                    }
                }
                anchors.verticalCenterOffset: 180
                anchors.horizontalCenterOffset: -170
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                id: admin
                anchors.left: parent.left
                anchors.leftMargin: -50
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                opacity: 0
                onClicked: ui.admin()
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
                signup_phone_Field.text = ""
                signup_bankCode_Field.text = ""
                //                ui.initLogin_Lignup()
            }
        }

        Item {
            id: login_signup_Item
            y: 114
            width: 715
            height: 194
            visible: false
            //            anchors.verticalCenter: parent.verticalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 460
            anchors.horizontalCenterOffset: 1
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                id: login_button
                width: 150
                height: 150
                anchors.verticalCenterOffset: -25
                anchors.horizontalCenterOffset: -170
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                source: "img/alreadyhave_button.png"

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        opacity = 0.3
                        enabled = false
                        timer_Reset.restart()
                        ui.login()
                        opacity = 1
                        enabled = true
                    }
                }
            }

            Image {
                id: signup_button
                x: 283
                y: 22
                width: 150
                height: 150
                anchors.verticalCenterOffset: -25
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                source: "img/signup_button.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        opacity = 0.3
                        enabled = false
                        timer_Reset.restart()
                        ui.signup()
                        opacity = 1
                        enabled = true
                    }
                }
            }

            Image {
                id: forgetUser_button
                x: 277
                y: 22
                width: 150
                height: 150
                anchors.horizontalCenterOffset: 170
                source: "img/forgetUser.png"
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -25
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        enabled = false
                        opacity = 0.3
                        timer_Reset.restart()
                        ui.forgetUser()
                        enabled = true
                        opacity = 1
                    }
                }
                anchors.horizontalCenter: parent.horizontalCenter
            }

        }
        Item {
            id: login_Item
            y: 298
            width: parent.width*0.5
            height: parent.height*0.3
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 220
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            state: "1"
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
                id: login_text
                x: 290
                y: 24
                text: "請登入帳號"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 230
                anchors.horizontalCenterOffset: 0
                font.pointSize: 20
                verticalAlignment: Text.AlignBottom
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Microsoft YaHei UI"
            }
            Text {
                id: login_signup_Text
                x: 290
                y: 24
                color: "#fa1717"
                text: ui.login_signup_Text
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 180
                anchors.horizontalCenterOffset: 1
                font.pointSize: 12
                verticalAlignment: Text.AlignBottom
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Microsoft YaHei UI"
            }
            Text {
                id: login_acc_text
                y: 53
                text: qsTr("帳號:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 138
                anchors.left: parent.left
                anchors.leftMargin: 65
                font.pointSize: 18
                font.family: "Microsoft YaHei UI"
            }
            TextField{
                id: login_acc_Field
                x: 157
                y: 57
                anchors.bottom: parent.bottom
                maximumLength: 18
                anchors.bottomMargin: 133
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
                y: 123
                text: qsTr("密碼:")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 68
                anchors.left: parent.left
                anchors.leftMargin: 65
                font.pointSize: 18
                font.family: "Microsoft YaHei UI"
            }
            TextField{
                id: login_pwd_Field
                x: 157
                y: 128
                anchors.bottom: parent.bottom
                echoMode: "Password"
                maximumLength: 12
                anchors.bottomMargin: 62
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
            Image {
                id: login_submit
                source: "img/submit.png"
                x: 375
                y: 113
                width: 70
                height: 70
                anchors.right: parent.right
                anchors.rightMargin: 67
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 47
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        enabled = false
                        logout_button.enabled = false
                        timer_Reset.restart()
                        ui.getUser(login_acc_Field.text,
                                   login_pwd_Field.text)
                        enabled = true
                        logout_button.enabled = true
                    }
                    onPressed: parent.opacity = 0.5
                    onReleased: parent.opacity = 1
                }
            }
        }
        Item {
            id: signup_Item
            y: 259
            width: 1024
            height: parent.height*0.35
            visible: false
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 240
            anchors.horizontalCenterOffset: 0
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
                text: qsTr("註冊帳號:")
                anchors.top: parent.top
                anchors.topMargin: 60
                anchors.left: parent.left
                anchors.leftMargin: 176
                font.pointSize: 18
            }
            TextField{
                id: signup_acc_Field
                x: 310
                placeholderText: "此欄位會公開顯示"
                maximumLength: 18
                anchors.right: parent.right
                anchors.rightMargin: 514
                anchors.top: parent.top
                anchors.topMargin: 54
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
                anchors.topMargin: 60
                anchors.left: parent.left
                anchors.leftMargin: 516
                font.pointSize: 18
            }
            TextField{
                id: signup_pwd_Field
                x: 650
                placeholderText: "至少六碼"
                maximumLength: 12
                echoMode: "Password"
                anchors.right: parent.right
                anchors.rightMargin: 174
                anchors.top: parent.top
                anchors.topMargin: 55
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
                anchors.topMargin: 113
                anchors.left: parent.left
                anchors.leftMargin: 176
                font.pointSize: 18
            }
            TextField{
                id: signup_email_Field
                x: 310
                y: 108
                maximumLength: 45
                placeholderText: "請使用gmail"
                anchors.right: parent.right
                anchors.rightMargin: 514
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
                anchors.topMargin: 113
                anchors.left: parent.left
                anchors.leftMargin: 516
                font.pointSize: 18
            }
            TextField{
                id: signup_ensureEmail_Field
                x: 650
                maximumLength: 45
                placeholderText: "重複輸入電子郵件"
                anchors.right: parent.right
                anchors.rightMargin: 174
                anchors.top: parent.top
                anchors.topMargin: 108
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
                anchors.topMargin: 164
                anchors.left: parent.left
                anchors.leftMargin: 176
                font.pointSize: 18
            }

            TextField{
                id: signup_bankACC_Field
                x: 310
                placeholderText: "交易成功，金額匯入此帳號"
                maximumLength: 20
                anchors.right: parent.right
                anchors.rightMargin: 514
                anchors.top: parent.top
                anchors.topMargin: 159
                onPressed: {
                    timer_Reset.restart()

                    inputPanel.active
                }
                onTextChanged: {
                    timer_Reset.restart()
                }
            }
            Text {
                id: signup_bankCode_Text
                x: 516
                y: 159
                width: 128
                height: 40
                text: qsTr("銀行代碼:")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 18
                anchors.right: parent.right
                anchors.rightMargin: 380
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 70
            }

            TextField {
                id: signup_bankCode_Field
                x: 650
                y: 159
                width: 78
                height: 40
                maximumLength: 3
                placeholderText: "三位數字"
                anchors.right: parent.right
                anchors.rightMargin: 296
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 70
            }

            Text {
                id: signup_phone_Text
                x: 176
                y: 210
                width: 128
                height: 40
                text: qsTr("電話號碼:")
                font.pointSize: 18
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            TextField {
                id: signup_phone_Field
                maximumLength: 10
                placeholderText: "例:09650*****"
                x: 310
                y: 210
                text: ""
            }

            Text {
                id: bankCodeQRcode_Text
                x: 516
                y: 210
                width: 128
                height: 40
                text: qsTr("代碼列表:")
                verticalAlignment: Text.AlignVCenter
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                font.pointSize: 18
                horizontalAlignment: Text.AlignHCenter
                anchors.rightMargin: 380
                anchors.bottomMargin: 19
            }

            Image {
                id: bankCodeQRcode_img
                x: 651
                y: 205
                width: 100
                height: 100
                fillMode: Image.PreserveAspectFit
                source: "img/bankCode_view.png"
            }

            Image {
                id: signup_submit
                source: "img/submit.png"
                x: 775
                y: 159
                width: 75
                height: 75
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        enabled = false
                        logout_button.enabled = false
                        timer_Reset.restart();
                        ui.signupSubmit(
                                    signup_acc_Field.text,
                                    signup_pwd_Field.text,
                                    signup_bankACC_Field.text,
                                    signup_email_Field.text,
                                    signup_ensureEmail_Field.text,
                                    signup_bankCode_Field.text,
                                    signup_phone_Field.text
                                    )
                        enabled = true
                        logout_button.enabled = true
                    }
                    onPressed: parent.opacity = 0.5
                    onReleased: parent.opacity = 1
                }
            }


            Text {
                id: signup_contract_Text
                text: qsTr("註冊帳號前，請詳閱條款。點擊此處           閱讀條款")
                font.pointSize: 12
                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignHCenter
                anchors.verticalCenterOffset: 156
                anchors.horizontalCenterOffset: -107
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            Image {
                id: signup_contract_button
                width: 66
                height: 68
                anchors.verticalCenterOffset: 156
                anchors.horizontalCenterOffset: 13
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.PreserveAspectFit
                source: "img/dataFile.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.restart()
                        ui.toSeeContract(1)
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
                id: signup_qrcode
                x: 850
                y: -99
                width: 100
                height: 100
                anchors.horizontalCenterOffset: 387
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 268
                anchors.horizontalCenter: parent.horizontalCenter
                source: "img/signup_qrcode.jpg"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: signup_qrcode_Text
                x: 836
                y: -128
                color: "#a91111"
                text: qsTr("歡迎使用網頁註冊")
                anchors.horizontalCenterOffset: 387
                anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 374
                font.pointSize: 14
            }



        }

        Image {
            id: login_icon
            width: 300
            height: 300
            anchors.verticalCenterOffset: -280
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/brandIcon2.png"
            fillMode: Image.PreserveAspectFit
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
            },
            State {
                name: "2"
                PropertyChanges {
                    target: upload_ItemInfo
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
                    duration: 1000;
                }
            }
        ]
        onStateChanged: {
            if(state=="0"){
                upload_ItemName_Field.text = ""
                upload_ItemPrice_Field.text = ""
                upload_ItemRemark_Field.text = ""
                logout_button.anchors.horizontalCenterOffset = 0
            }
            if(state=="1"){
                logout_button.anchors.horizontalCenterOffset = 60
                keepChooseChannel.enabled = true
                logout_button.enabled = true
                login_button.opacity = 1
                keepChooseChannel.opacity = 1
            }
            if(state=="2"){
                keepChooseChannel.enabled = false
                logout_button.enabled = false
                keepChooseChannel.opacity = .5
                logout_button.opacity = .5
            }
        }

        Item {
            id: upload_ItemInfo_Item
            x: 154
            y: 189
            width: 715
            height: 430
            anchors.horizontalCenterOffset: 5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 149

            Text {
                id: upload_ItemInfo_Text
                y: 90
                text: qsTr("商品資訊")
                verticalAlignment: Text.AlignBottom
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 20
                font.family: "Microsoft YaHei UI"
                anchors.left: parent.left
                anchors.leftMargin: 292
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 298
            }
            Text {
                id: upload_ItemInfo_notify
                x: 430
                y: 138
                color: "#fa1f1f"
                text: ui.upload_ItemInfo_notify
                anchors.horizontalCenterOffset: 0
                verticalAlignment: Text.AlignBottom
                horizontalAlignment: Text.AlignHCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 266
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
                font.family: "Microsoft YaHei UI"
            }

            Text {
                id: upload_ItemName_Text
                y: 181
                text: qsTr("名稱:")
                font.pointSize: 18
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 211
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                anchors.leftMargin: 161
                font.family: "Microsoft YaHei UI"
            }
            TextField{
                id: upload_ItemName_Field
                y: 180
                anchors.bottom: parent.bottom
                maximumLength: 20
                anchors.bottomMargin: 210
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
                y: 257
                text: qsTr("價格:")
                font.pointSize: 18
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 135
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                anchors.leftMargin: 161
                font.family: "Microsoft YaHei UI"
            }

            TextField {
                id: upload_ItemPrice_Field
                x: -9
                y: 257
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 133
                maximumLength: 5
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
                y: 275
                text: qsTr("備註:")
                visible: false
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 106
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                anchors.leftMargin: 143
                font.pixelSize: 38
                font.family: "Microsoft YaHei UI"
            }


            TextField {
                id: upload_ItemRemark_Field
                x: -3
                y: 284
                visible: false
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 106
                maximumLength: 10
                anchors.left: parent.left
                anchors.leftMargin: 265
                onPressed: {
                    timer_Reset.restart()
                    inputPanel.active
                }
                onTextChanged: {
                    timer_Reset.restart()
                }
            }
            Image {
                id: upload_ItemInfo_submit
                source: "img/submit.png"
                y: 241
                width: 70
                height: 70
                anchors.left: parent.left
                anchors.leftMargin: 479
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 119
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        timer_Reset.stop()
                        ui.upload_submit(
                                    upload_ItemName_Field.text,
                                    upload_ItemPrice_Field.text,
                                    upload_ItemRemark_Field.text
                                    )
                        //                    logout_button.enabled = true
                        //                    keepChooseChannel.enabled = true
                    }
                    onPressed: parent.opacity = 0.5
                    onReleased: parent.opacity = 1
                }
            }
        }

        Image {
            id: upload_brand
            width: 300
            height: 300
            anchors.verticalCenterOffset: -280
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/brandIcon2.png"
            fillMode: Image.PreserveAspectFit
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
            repeat: false
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
                logout_button.anchors.horizontalCenterOffset = 60
                keepChooseChannel.enabled = true;
                logout_button.enabled = true;
                logout_button.opacity = 1
            }
            if(state=="0"){
                timer_CheckPayment.stop()
                logout_button.anchors.horizontalCenterOffset = 0
            }
            if(state=="2"){
                keepChooseChannel.enabled = false
                logout_button.enabled = false
            }
            if(state=="3"){
                timer_Reset.restart()
            }
        }
        Image {
            id: displayQRcode
            x: 681
            y: 488
            width: 200
            height: 200
            anchors.horizontalCenterOffset: 270
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 80
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
            text: "商品名稱："+ui.itemNameDisplay
            anchors.left: parent.left
            anchors.leftMargin: 85
            anchors.top: parent.top
            anchors.topMargin: 226
            font.pixelSize: 36
            font.family: "Microsoft YaHei UI"

        }
        Text {
            id: payingNotify_Text
            x: 636
            y: 404
            color: "#b70000"
            text: qsTr("此為付款條碼\n請使用【台灣pay】掃此QR碼")
            anchors.horizontalCenterOffset: 270
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 18
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 286
            font.family: "Microsoft YaHei UI"

        }

        Image {
            id: paying_brand
            width: 300
            height: 300
            anchors.verticalCenterOffset: -280
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/brandIcon2.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: reset_notify_paying
            color: "#b70000"
            text: qsTr("請注意，如果您已經付款完成。\n但畫面已經回朔，請再選一次便會自動開櫃")
            font.family: "Microsoft YaHei UI"
            font.pointSize: 18
            anchors.left: parent.left
            anchors.leftMargin: 85
            anchors.top: parent.top
            anchors.topMargin: 531
            horizontalAlignment: Text.AlignLeft
        }

        Text {
            id: itemPrice
            y: 300
            text: "價格："+ui.itemPriceDisplay
            anchors.left: parent.left
            anchors.leftMargin: 85
            anchors.top: parent.top
            anchors.topMargin: 352
            font.pixelSize: 36
            font.family: "Microsoft YaHei UI"

        }
        Text {
            id: itemRemark
            text: "備註："+ui.itemRemarkDisplay
            visible: false
            anchors.left: parent.left
            anchors.leftMargin: 129
            anchors.top: parent.top
            anchors.topMargin: 400
            font.pixelSize: 36
            font.family: "Microsoft YaHei UI"

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
            },
            State {
                name: "2"
                PropertyChanges {
                    target: choseChannel
                    opacity: 1
                    enabled: false
                }
            },
            State {
                name: "3"
                PropertyChanges {
                    target: choseChannel
                    opacity: 1
                    enabled: true
                }
            }
        ]
        onStateChanged: {
            if(state=="3"){
                keepChooseChannel.enabled = false
                keepChooseChannel.opacity = 0
            }
            if(state=="2"){
                logout_button.enabled = false
                logout_button.opacity = .5
            }
            if(state=="1"){
                logout_button.enabled = true
                logout_button.opacity = 1
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
                            source: "img/channel/01-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_1
                            opacity: 0.3
                            source: "img/channel/01-01.png"
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
                            source: "img/channel/02-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_2
                            opacity: 0.3
                            source: "img/channel/02-01.png"
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
                            source: "img/channel/03-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_3
                            opacity: 0.3
                            source: "img/channel/03-01.png"
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
                            source: "img/channel/04-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_4
                            opacity: 0.3
                            source: "img/channel/04-01.png"
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
                            source: "img/channel/05-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_5
                            opacity: 0.3
                            source: "img/channel/05-01.png"
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
                            source: "img/channel/06-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_6
                            opacity: 0.3
                            source: "img/channel/06-01.png"
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
                            source: "img/channel/07-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_7
                            opacity: 0.3
                            source: "img/channel/07-01.png"
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
                    id: mouseArea
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
                            source: "img/channel/08-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_8
                            opacity: 0.3
                            source: "img/channel/08-01.png"
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
                            source: "img/channel/09-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_9
                            opacity: 0.3
                            source: "img/channel/09-01.png"
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
                            source: "img/channel/10-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_10
                            opacity: 0.3
                            source: "img/channel/10-01.png"
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
                            source: "img/channel/11-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_11
                            opacity: 0.3
                            source: "img/channel/11-01.png"
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
                            source: "img/channel/12-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_12
                            opacity: 0.3
                            source: "img/channel/12-01.png"
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
                            source: "img/channel/13-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_13
                            opacity: 0.3
                            source: "img/channel/13-01.png"
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
                            source: "img/channel/14-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_14
                            opacity: 0.3
                            source: "img/channel/14-01.png"
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
                            opacity: 0.3
                            source: "img/channel/15-01.png"
                            enabled: false
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_15
                            opacity: 0.3
                            source: "img/channel/15-01.png"
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
                            opacity: 0.3
                            source: "img/channel/16-01.png"
                            enabled: false
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_16
                            opacity: 0.3
                            source: "img/channel/16-01.png"
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
                            opacity: 0.3
                            source: "img/channel/17-01.png"
                            enabled: false
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_17
                            opacity: 0.3
                            source: "img/channel/17-01.png"
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
                            opacity: 0.3
                            source: "img/channel/18-01.png"
                            enabled: false
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_18
                            opacity: 0.3
                            source: "img/channel/18-01.png"
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
                            opacity: 0.3
                            source: "img/channel/19-01.png"
                            enabled: false
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_19
                            opacity: 0.3
                            source: "img/channel/19-01.png"
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
                            opacity: 0.3
                            source: "img/channel/20-01.png"
                            enabled: false
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_20
                            opacity: 0.3
                            source: "img/channel/20-01.png"
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
                            source: "img/channel/21-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_21
                            opacity: 0.3
                            source: "img/channel/21-01.png"
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
                            source: "img/channel/22-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_22
                            opacity: 0.3
                            source: "img/channel/22-01.png"
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
                            source: "img/channel/23-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_23
                            opacity: 0.3
                            source: "img/channel/23-01.png"
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
                            source: "img/channel/24-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_24
                            opacity: 0.3
                            source: "img/channel/24-01.png"
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
                            source: "img/channel/25-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_25
                            opacity: 0.3
                            source: "img/channel/25-01.png"
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
                            source: "img/channel/26-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_26
                            opacity: 0.3
                            source: "img/channel/26-01.png"
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
                            source: "img/channel/27-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_27
                            opacity: 0.3
                            source: "img/channel/27-01.png"
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
                            source: "img/channel/28-01.png"
                            enabled: true
                        }
                    },
                    State {
                        name: "0"
                        PropertyChanges {
                            target: choseChannel_28
                            opacity: 0.3
                            source: "img/channel/28-01.png"
                            enabled: false
                        }
                    }]
            }

            Image {
                id: choseChannel_icon
                width: 300
                height: 300
                anchors.verticalCenterOffset: -280
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "img/brandIcon2.png"
                fillMode: Image.PreserveAspectFit
            }

        }
        Text {
            id: choseChannel_notifyText
            color: "#e60000"
            text: ui.choseChannel_notifyText
            font.family: "Microsoft YaHei UI"
            anchors.horizontalCenterOffset: 0
            anchors.verticalCenterOffset: -144
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 12
        }
        Text {
            id: choseChannel_contract_Text
            text: ui.choseChannel_contract_Text
            font.family: "Microsoft YaHei UI"
            font.pointSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignHCenter
        }
        Image {
            id: toSeeContract
            width: 50
            height: 50
            state: ui.toSeeContractState
            states: [
                State {
                    name: "0"
                    PropertyChanges {
                        target: toSeeContract
                        opacity: 0
                        enabled: false
                    }
                },
                State {
                    name: "1"
                    PropertyChanges {
                        target: toSeeContract
                        opacity: 1
                        enabled: true
                    }
                }
            ]
            anchors.horizontalCenterOffset: -20
            anchors.verticalCenterOffset: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/dataFile.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    timer_Reset.restart()
                    ui.toSeeContract()
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





















/*##^##
Designer {
    D{i:217;anchors_x:64;anchors_y:247}D{i:219;anchors_x:64;anchors_y:247}D{i:221;anchors_x:64;anchors_y:247}
D{i:223;anchors_x:64;anchors_y:247}D{i:225;anchors_x:64;anchors_y:247}D{i:227;anchors_x:64;anchors_y:247}
D{i:229;anchors_x:64;anchors_y:247}
}
##^##*/
