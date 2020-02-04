#include "ui.h"

UI::UI(QObject *parent) : QObject(parent)
{
    widgetVisible = "0";
    welcomeVisible_Text = "1";



//    emit chooseFunctionVisibleChanged();
//    emit choseChannelVisibleChanged();
//    emit thanksForPerchaseVisibleChanged();
//    emit login_signupVisibleChanged();
//    emit upload_ItemInfoVisibleChanged();
//    emit upload_thankYouVisibleChanged();
//    emit takeOff_thankYouVisibleChanged();
//    emit updateItem_thankYouVisibleChanged();
//    emit signup_thankYouVisibleChanged();
//    emit updateUserVisibleChanged();
//    emit updateItemVisibleChanged();
//    emit forgetUserVisibleChanged();
//    emit forgetUser_thankYouVisibleChanged();
}

void UI::chooseFunction(){
    welcomeVisible_Text = "0";
    emit welcomeVisibleChanged();
    widgetVisible = "1";
    emit chooseFunctionVisibleChanged();
}

void UI::setFunctionHandler(int i){
    functionHandler = i;
}

void UI::choseChannel(){
    widgetVisible = "0";
    emit chooseFunctionVisibleChanged();

    widgetVisible = "1";
    emit choseChannelVisibleChanged();
}

void UI::setBox_ch(int i){
    box_ch = i;
}

void UI::execFunction(){
    switch (functionHandler) {
    case 1:
        displayQRcode();
    break;
    }
}

void UI::displayQRcode(){
    widgetVisible = "0";
    emit choseChannelVisibleChanged();
    widgetVisible = "1";
    emit perchase_PayingVisibleChanged();
}

void UI::checkPayment(){
    DB *db = new DB();
    widgetVisible = "0";
    emit perchase_PayingVisibleChanged();

    if(db->checkPayment(box_ch)){
        widgetVisible = "1";
        emit thanksForPerchaseVisibleChanged();
    }else{
        widgetVisible = "1";
        emit perchase_PayingVisibleChanged();
    }
}





