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
    AnimatedImage {
        id: animatedImage
        x: 376
        y: 272
        width: 200
        height: 200
        anchors.verticalCenterOffset: 43
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "img/Spinner.gif"
    }

    BusyIndicator{
        width: 100
        height: 100
        opacity: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
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
                logout_button.anchors.horizontalCenterOffset = 60
                keepChooseChannel.enabled = true;
                keepChooseChannel.opacity = 1;
            }
            if(state=="0"){
                timer_CheckPayment.stop()
                logout_button.anchors.horizontalCenterOffset = 0
                keepChooseChannel.enabled = false;
                keepChooseChannel.opacity = 0;
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
            }
            if(state=="0"){
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
                keepChooseChannel.enabled = true
                keepChooseChannel.opacity = 1
            }
            if(state=="0"){
                logout_button.anchors.horizontalCenterOffset = 0
                keepChooseChannel.enabled = false
                keepChooseChannel.opacity = 0
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
                keepChooseChannel.enabled = true
                keepChooseChannel.opacity = 1
            }
            if(state=="0"){
                logout_button.anchors.horizontalCenterOffset = 0
                keepChooseChannel.enabled = false
                keepChooseChannel.opacity = 0
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

    }



    Timer{
        id: timer_CheckChannel
        interval: 2000
        repeat: true
        running: false
        triggeredOnStart: true
        onTriggered: {
            logout_button.enabled = false
            keepChooseChannel.enabled = false
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
                logout_button.anchors.horizontalCenterOffset = 0
                keepChooseChannel.enabled = false
                keepChooseChannel.opacity = 0
            }
            if(state=="1"){
                logout_button.anchors.horizontalCenterOffset = 60
                keepChooseChannel.enabled = true
                keepChooseChannel.opacity = 1
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
            anchors.bottomMargin: 200

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
                maximumLength: 10
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
                maximumLength: 10
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
                    enabled = false
                    keepChooseChannel.enabled = false
                    logout_button.enabled = false
                    ui.upload_submit(
                                upload_ItemName_Field.text,
                                upload_ItemPrice_Field.text,
                                upload_ItemRemark_Field.text
                                )
                    logout_button.enabled = true
                    keepChooseChannel.enabled = true
                    enabled = true
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
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 12
        onClicked: {
            timer_Reset.stop()
            timer_afterTHX.stop()
            ui.logout();
            ui.reset();
            reset_counter.c = ""
        }
    }
    Button{
        id: keepChooseChannel
        x: 488
        y: 678
        z: 98
        text: qsTr("重選格子")
        enabled: false
        opacity: 0
        anchors.horizontalCenterOffset: -60
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 12
        onClicked: {
            enabled = false
            timer_afterTHX.stop()
            timer_Reset.start()
            ui.keepChooseChannel()
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
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 12
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
                keepChooseChannel.opacity = 0
            }
            if(state=="1"){
                logout_button.anchors.horizontalCenterOffset = 70
                keepChooseChannel.enabled = true
                keepChooseChannel.opacity = 1
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
                keepChooseChannel.enabled = true
                keepChooseChannel.opacity = 1
            }
            if(state=="0"){
                logout_button.anchors.horizontalCenterOffset=0
                keepChooseChannel.opacity = 0
                keepChooseChannel.enabled = false
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
                anchors.verticalCenterOffset: -280
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
                id: chooseFunction_updataItemInfo
                source: "img/uploadButton.png"
                width: 200
                height: 200
                anchors.verticalCenterOffset: -58
                anchors.horizontalCenterOffset: 300
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
                source: "img/takeOff.png"
                width: 200
                height: 200
                anchors.horizontalCenterOffset: -300
                anchors.verticalCenterOffset: 192
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
                source: "img/updateUser.png"
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
                source: "img/forgetUser.png"
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
            }
        ]
        //        onStateChanged: {
        //            if(state=="1"){
        //                ui.setChannelVisible()
        //            }
        //        }
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

        Text {
            id: choseChannel_notifyText
            color: "#e60000"
            text: ui.choseChannel_notifyText
            onTextChanged: {
                if(text=="處理中 請稍後"){
                    logout_button.enabled = false
                }else{
                    logout_button.enabled = true
                }
            }

            anchors.verticalCenterOffset: -100
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 12
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
                    timer_Reset.restart()
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
            anchors.verticalCenterOffset: 22
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/welcome_Text.png"
        }
        AnimatedImage {
            id: clickNotify
            width: 375
            height: 75
            anchors.verticalCenterOffset: 262
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/clickToStart.gif"
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
                ui.initLogin_Lignup()
            }
        }

        Item {
            id: login_signup_Item
            y: 114
            width: 715
            height: 194
            //            anchors.verticalCenter: parent.verticalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 460
            anchors.horizontalCenterOffset: 1
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: login_signup_Text
                x: 290
                y: 118
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
                source: "img/signup_button.png"
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
            anchors.bottomMargin: 240
            anchors.horizontalCenterOffset: 0
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
                text: qsTr("帳號:")
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
                    logout_button.enabled = false
                    timer_Reset.restart()
                    ui.getUser(login_acc_Field.text,
                               login_pwd_Field.text)
                    enabled = true
                    logout_button.enabled = true
                }
            }
        }
        Item {
            id: signup_Item
            y: 306
            width: 1024
            height: parent.height*0.35
            anchors.horizontalCenterOffset: 1
            anchors.bottomMargin: 193
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
                text: qsTr("註冊帳號:")
                anchors.top: parent.top
                anchors.topMargin: 14
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
                anchors.topMargin: 8
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
                anchors.topMargin: 14
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
                id: signup_email_Text
                text: qsTr("電子郵件:")
                anchors.top: parent.top
                anchors.topMargin: 67
                anchors.left: parent.left
                anchors.leftMargin: 176
                font.pointSize: 18
            }
            TextField{
                id: signup_email_Field
                x: 310
                y: 62
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
                anchors.topMargin: 67
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
                anchors.topMargin: 62
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
                anchors.topMargin: 118
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
                anchors.topMargin: 113
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
                x: 750
                y: 168
                text: "註冊"
                font.pointSize: 18
                onClicked: {
                    enabled = false
                    logout_button.enabled = false
                    timer_Reset.restart()
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
            }

            Text {
                id: signup_bankCode_Text
                x: 516
                y: 113
                width: 128
                height: 40
                text: qsTr("銀行代碼:")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 18
                anchors.right: parent.right
                anchors.rightMargin: 380
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 116
            }

            TextField {
                id: signup_bankCode_Field
                x: 650
                y: 113
                width: 78
                height: 40
                maximumLength: 3
                placeholderText: "三位數字"
                anchors.right: parent.right
                anchors.rightMargin: 296
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 116
            }

            Text {
                id: signup_phone_Text
                x: 176
                y: 169
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
                y: 169
                text: ""
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
            }

            Text {
                id: updateUser_Text
                y: 207
                text: qsTr("更改使用者資料")
                anchors.left: parent.left
                anchors.leftMargin: 372
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 521
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
                x: 517
                y: 431
                text: qsTr("銀行代號:")
                anchors.bottom: parent.bottom
                horizontalAlignment: Text.AlignHCenter
                anchors.bottomMargin: 297
                font.pointSize: 24
                anchors.right: parent.right
                anchors.rightMargin: 337
                verticalAlignment: Text.AlignVCenter
            }

            TextField {
                id: updateUser_bankCode_Field
                x: 694
                y: 431
                width: 69
                height: 40
                maximumLength: 3
                placeholderText: "可空白"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 297
                anchors.right: parent.right
                anchors.rightMargin: 262
            }

            Button {
                id: updateUser_submit
                y: 500
                text: qsTr("送出")
                anchors.left: parent.left
                anchors.leftMargin: 463
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 226
                font.pointSize: 18
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
            }



        }
    }
}








/*##^##
Designer {
    D{i:2;invisible:true}D{i:4;invisible:true}D{i:3;invisible:true}D{i:22;anchors_x:203;anchors_y:216;invisible:true}
D{i:21;anchors_x:203;anchors_y:216}D{i:17;invisible:true}D{i:20;anchors_x:416;anchors_y:216}
D{i:19;anchors_x:416}D{i:16;invisible:true}D{i:29;anchors_height:200;anchors_width:200;anchors_x:123;anchors_y:133;invisible:true}
D{i:28;anchors_height:200;anchors_width:200;anchors_x:123;anchors_y:133;invisible:true}
D{i:25;anchors_x:664;anchors_y:133;invisible:true}D{i:24;anchors_x:664;anchors_y:133;invisible:true}
D{i:27;anchors_x:123;anchors_y:133;invisible:true}D{i:26;anchors_x:664;invisible:true}
D{i:23;anchors_x:203;anchors_y:216;invisible:true}D{i:36;anchors_height:200;anchors_width:200;anchors_x:694;anchors_y:88;invisible:true}
D{i:35;anchors_x:694;invisible:true}D{i:32;anchors_x:123;anchors_y:133;invisible:true}
D{i:31;anchors_x:123;anchors_y:133;invisible:true}D{i:34;anchors_x:123;anchors_y:133;invisible:true}
D{i:33;anchors_x:123;anchors_y:133;invisible:true}D{i:30;anchors_x:123;anchors_y:133;invisible:true}
D{i:43;invisible:true}D{i:42;invisible:true}D{i:39;invisible:true}D{i:38;anchors_height:200;anchors_width:200;anchors_x:108;anchors_y:88;invisible:true}
D{i:41;invisible:true}D{i:40;invisible:true}D{i:37;anchors_height:200;anchors_width:200;anchors_x:108;anchors_y:88;invisible:true}
D{i:51;invisible:true}D{i:50;invisible:true}D{i:49;invisible:true}D{i:46;invisible:true}
D{i:45;invisible:true}D{i:48;invisible:true}D{i:47;invisible:true}D{i:44;invisible:true}
D{i:58;invisible:true}D{i:57;invisible:true}D{i:54;invisible:true}D{i:53;invisible:true}
D{i:56;invisible:true}D{i:55;invisible:true}D{i:52;invisible:true}D{i:66;invisible:true}
D{i:65;invisible:true}D{i:64;invisible:true}D{i:61;invisible:true}D{i:60;invisible:true}
D{i:63;invisible:true}D{i:62;invisible:true}D{i:59;invisible:true}D{i:67;invisible:true}
D{i:68;invisible:true}D{i:69;invisible:true}D{i:78;invisible:true}D{i:80;invisible:true}
D{i:81;invisible:true}D{i:82;invisible:true}D{i:77;invisible:true}D{i:76;invisible:true}
D{i:75;invisible:true}D{i:72;invisible:true}D{i:71;invisible:true}D{i:74;invisible:true}
D{i:73;invisible:true}D{i:70;invisible:true}D{i:90;invisible:true}D{i:89;invisible:true}
D{i:94;anchors_height:200;anchors_width:200}D{i:95;anchors_height:200;anchors_width:200;invisible:true}
D{i:104;invisible:true}D{i:105;invisible:true}D{i:106;invisible:true}D{i:107;anchors_height:150;anchors_width:1024;invisible:true}
D{i:108;anchors_height:768;anchors_width:1024;invisible:true}D{i:109;anchors_height:200;anchors_width:200;invisible:true}
D{i:110;anchors_height:200;anchors_width:200;invisible:true}D{i:111;invisible:true}
D{i:112;invisible:true}D{i:103;invisible:true}D{i:102;anchors_height:200;anchors_width:200;invisible:true}
D{i:101;anchors_height:200;anchors_width:200;invisible:true}D{i:98;invisible:true}
D{i:97;invisible:true}D{i:100;anchors_height:768;anchors_width:1024;invisible:true}
D{i:99;anchors_height:768;anchors_width:1024;invisible:true}D{i:96;invisible:true}
D{i:119;anchors_x:123;anchors_y:133;invisible:true}D{i:118;anchors_x:123;anchors_y:133;invisible:true}
D{i:115;anchors_height:200;anchors_width:200;anchors_x:664;invisible:true}D{i:114;anchors_height:200;anchors_width:200;anchors_x:664;invisible:true}
D{i:117;anchors_x:123;anchors_y:133;invisible:true}D{i:116;anchors_height:200;anchors_width:200;anchors_x:123;anchors_y:133;invisible:true}
D{i:113;anchors_height:150;anchors_width:200;anchors_x:664;invisible:true}D{i:128;anchors_height:768;anchors_width:1024;invisible:true}
D{i:130;anchors_height:200;anchors_width:200;invisible:true}D{i:129;anchors_height:768;anchors_width:1024;invisible:true}
D{i:132;invisible:true}D{i:131;anchors_height:200;anchors_width:200;invisible:true}
D{i:134;anchors_height:200;anchors_width:200;anchors_x:664;invisible:true}D{i:133;invisible:true}
D{i:136;invisible:true}D{i:135;invisible:true}D{i:138;anchors_height:200;anchors_width:200;anchors_x:664;invisible:true}
D{i:137;anchors_height:200;anchors_width:200;anchors_x:664;invisible:true}D{i:140;anchors_height:200;anchors_width:200;anchors_x:123;anchors_y:133;invisible:true}
D{i:139;anchors_height:200;anchors_width:200;anchors_x:664;invisible:true}D{i:127;invisible:true}
D{i:126;invisible:true}D{i:125;invisible:true}D{i:122;anchors_height:200;anchors_width:200;invisible:true}
D{i:121;anchors_height:768;anchors_width:1024;invisible:true}D{i:124;invisible:true}
D{i:123;anchors_height:200;anchors_width:200;invisible:true}D{i:120;anchors_height:768;anchors_width:1024;invisible:true}
D{i:152;invisible:true}D{i:154;invisible:true}D{i:153;invisible:true}D{i:156;invisible:true}
D{i:155;invisible:true}D{i:151;invisible:true}D{i:158;invisible:true}D{i:160;invisible:true}
D{i:159;invisible:true}D{i:162;invisible:true}D{i:161;invisible:true}D{i:157;invisible:true}
D{i:164;anchors_height:150;anchors_width:200;invisible:true}D{i:166;anchors_height:150;anchors_width:200;invisible:true}
D{i:165;anchors_height:150;anchors_width:200;invisible:true}D{i:168;invisible:true}
D{i:167;anchors_height:150;anchors_width:200;invisible:true}D{i:163;anchors_height:150;invisible:true}
D{i:170;invisible:true}D{i:172;anchors_height:200;anchors_width:200;invisible:true}
D{i:171;anchors_height:768;anchors_width:1024;invisible:true}D{i:174;anchors_height:200;anchors_width:200;invisible:true}
D{i:173;anchors_height:200;anchors_width:200;invisible:true}D{i:169;invisible:true}
D{i:176;anchors_height:200;anchors_width:200;invisible:true}D{i:178;invisible:true}
D{i:177;invisible:true}D{i:180;anchors_height:768;anchors_width:1024;invisible:true}
D{i:179;anchors_height:768;anchors_width:1024;invisible:true}D{i:175;anchors_height:200;anchors_width:200;invisible:true}
D{i:182;anchors_height:200;anchors_width:200;invisible:true}D{i:184;anchors_height:200;anchors_width:200;invisible:true}
D{i:183;anchors_height:200;anchors_width:200;invisible:true}D{i:186;invisible:true}
D{i:185;invisible:true}D{i:181;anchors_height:200;anchors_width:200;invisible:true}
D{i:192;invisible:true}D{i:191;invisible:true}D{i:194;invisible:true}D{i:193;invisible:true}
D{i:318;invisible:true}D{i:319;invisible:true}D{i:150;invisible:true}D{i:320;invisible:true}
D{i:149;invisible:true}D{i:148;anchors_x:123;anchors_y:133;invisible:true}D{i:143;anchors_x:123;anchors_y:133;invisible:true}
D{i:142;anchors_x:123;anchors_y:133;invisible:true}D{i:145;anchors_x:123;anchors_y:133;invisible:true}
D{i:144;anchors_x:123;anchors_y:133;invisible:true}D{i:147;invisible:true}D{i:146;anchors_x:123;anchors_y:133;invisible:true}
D{i:141;anchors_x:123;anchors_y:133;invisible:true}D{i:329;anchors_height:200;anchors_width:200;invisible:true}
D{i:330;anchors_height:150;anchors_width:200;invisible:true}D{i:331;anchors_height:150;anchors_width:200;invisible:true}
D{i:332;anchors_height:150;anchors_width:200;invisible:true}D{i:333;anchors_height:150;anchors_width:200;invisible:true}
D{i:328;anchors_height:200;anchors_width:200;invisible:true}D{i:327;anchors_height:200;anchors_width:200;invisible:true}
D{i:326;anchors_height:200;anchors_width:200;invisible:true}D{i:323;anchors_height:200;anchors_width:200;invisible:true}
D{i:322;anchors_height:200;anchors_width:200;invisible:true}D{i:325;anchors_height:200;anchors_width:200;invisible:true}
D{i:324;anchors_height:200;anchors_width:200;invisible:true}D{i:321;anchors_height:200;anchors_width:200;invisible:true}
D{i:341;anchors_height:150;invisible:true}D{i:342;anchors_height:150;anchors_width:200;anchors_x:664;invisible:true}
D{i:343;anchors_height:150;invisible:true}D{i:344;anchors_height:150;anchors_width:200;anchors_x:664;invisible:true}
D{i:340;anchors_height:150;invisible:true}D{i:339;invisible:true}D{i:336;anchors_height:150;anchors_width:1024;invisible:true}
D{i:335;anchors_height:150;anchors_width:1024;invisible:true}D{i:338;anchors_height:150;anchors_width:1024;invisible:true}
D{i:337;anchors_height:150;anchors_width:1024;invisible:true}D{i:334;anchors_height:150;anchors_width:1024;invisible:true}
D{i:353;invisible:true}D{i:355;anchors_height:150;invisible:true}D{i:354;anchors_height:150;invisible:true}
D{i:357;anchors_height:150;invisible:true}D{i:356;anchors_height:150;invisible:true}
D{i:359;anchors_height:150;invisible:true}D{i:358;anchors_height:150;invisible:true}
D{i:352;anchors_height:150;invisible:true}D{i:367;anchors_height:150;invisible:true}
D{i:368;anchors_height:150;invisible:true}D{i:369;invisible:true}D{i:370;anchors_height:200;anchors_width:200;invisible:true}
D{i:371;anchors_height:200;anchors_width:200;invisible:true}D{i:366;anchors_height:150;invisible:true}
D{i:365;anchors_height:150;invisible:true}D{i:362;anchors_height:150;invisible:true}
D{i:361;anchors_height:150;invisible:true}D{i:364;anchors_height:150;invisible:true}
D{i:363;anchors_height:150;invisible:true}D{i:360;anchors_height:150;invisible:true}
D{i:379;anchors_height:200;anchors_width:200;invisible:true}D{i:380;anchors_height:200;anchors_width:200;invisible:true}
D{i:381;anchors_height:200;anchors_width:200;invisible:true}D{i:382;anchors_height:200;anchors_width:200;invisible:true}
D{i:383;anchors_height:150;anchors_width:1024;invisible:true}D{i:384;anchors_height:150;anchors_width:1024;invisible:true}
D{i:385;anchors_height:150;anchors_width:1024;invisible:true}D{i:386;anchors_height:150;anchors_width:1024;invisible:true}
D{i:387;anchors_height:150;anchors_width:1024;invisible:true}D{i:388;anchors_height:150;invisible:true}
D{i:389;invisible:true}D{i:390;invisible:true}D{i:391;anchors_height:150;anchors_width:200;anchors_x:664;invisible:true}
D{i:392;invisible:true}D{i:393;anchors_height:150;anchors_width:200;anchors_x:664;invisible:true}
D{i:378;anchors_height:200;anchors_width:200;invisible:true}D{i:377;anchors_height:200;anchors_width:200;invisible:true}
D{i:374;anchors_height:200;anchors_width:200;invisible:true}D{i:373;anchors_height:150;anchors_width:200;invisible:true}
D{i:376;anchors_height:200;anchors_width:200;invisible:true}D{i:375;anchors_height:200;anchors_width:200;invisible:true}
D{i:372;anchors_height:150;anchors_width:200;invisible:true}D{i:351;anchors_height:150;invisible:true}
D{i:350;anchors_height:150;invisible:true}D{i:347;invisible:true}D{i:346;invisible:true}
D{i:349;anchors_height:150;invisible:true}D{i:348;anchors_height:150;invisible:true}
D{i:345;invisible:true}D{i:402;invisible:true}D{i:403;invisible:true}D{i:404;invisible:true}
D{i:405;anchors_height:768;anchors_width:1024;invisible:true}D{i:406;anchors_height:768;anchors_width:1024;invisible:true}
D{i:407;anchors_height:200;anchors_width:200;invisible:true}D{i:408;anchors_height:200;anchors_width:200;invisible:true}
D{i:409;invisible:true}D{i:410;invisible:true}D{i:411;invisible:true}D{i:412;invisible:true}
D{i:401;invisible:true}D{i:400;invisible:true}D{i:399;invisible:true}D{i:396;anchors_height:150;anchors_x:123;anchors_y:133;invisible:true}
D{i:395;anchors_height:150;anchors_x:123;anchors_y:133;invisible:true}D{i:398;invisible:true}
D{i:397;invisible:true}D{i:394;anchors_height:150;anchors_x:123;anchors_y:133;invisible:true}
}
##^##*/
