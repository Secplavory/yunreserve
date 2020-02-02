#include "redirect.h"

redirect::redirect(QObject *parent) : QObject(parent)
{
}

void redirect::timeoutReset(){
    qDebug("time to reset");
    setVisible(QString("nextPage"));
    emit buyORsellVisibleChanged();
    emit chosechannelVisibleChanged();
    emit displayPriceVisibleChanged();
    emit pricePayedVisibleChanged();
    emit signupORsigninVisibleChanged();
    emit uploadCHVisibleChanged();
    emit to_uploadInputVisibleChanged();
    emit uploadFinishedVisibleChanged();
    emit setuploadingVisibleChanged();
    emit thankForBuyingVisibleChanged();
    emit changeAccountVisibleChanged();
    emit takeOFFVisibleChanged();


    verifiedText = " ";
    emit notverified();
    signupnotifyText = " ";
    emit signupnotifyTextchanged();


    setVisible(QString("thisPage"));
    emit welcomeVisibleChanged();
}

void redirect::welcomeNext(){
    qDebug("welcomeNext called");
    setVisible(QString("nextPage"));
    emit welcomeVisibleChanged();

    qDebug("display buyORsell");
    setVisible(QString("thisPage"));
    emit buyORsellVisibleChanged();

}

void redirect::toBuy(){
    qDebug("toBuy called");
    setVisible(QString("nextPage"));
    emit buyORsellVisibleChanged();

    qDebug("call choseChanal");
    setVisible(QString("thisPage"));
    emit chosechannelVisibleChanged();
}
void redirect::backtowelcomeNext(){
    setVisible(QString("nextPage"));
    emit chosechannelVisibleChanged();

    setVisible(QString("thisPage"));
    emit buyORsellVisibleChanged();
}


void redirect::toDisplayPrice(int i){
    currentCh = QString::number(i);
    qDebug("toDisplayPrice called");
    setVisible(QString("nextPage"));
    emit chosechannelVisibleChanged();

    qDebug("call displayPrice");
    setVisible(QString("thisPage"));
    emit displayPriceVisibleChanged();


    database *db = new database();
    item_name_text = db->get_item_name(currentCh);
    item_remark_text = db->get_remark_name(currentCh);
    item_price_text = db->get_price_name(currentCh);

    emit item_nameChanged();
    emit item_remarkChanged();
    emit item_priceChanged();


}
void redirect::backtochoosechannel(){
    setVisible(QString("nextPage"));
    emit displayPriceVisibleChanged();

    setVisible(QString("thisPage"));
    emit chosechannelVisibleChanged();
}
void redirect::isPricePayed(){
    qDebug()<<"檢查付款"<<currentCh;
    //執行電文交換
    database *db = new database();
    int rec = db->check_payment(currentCh);
    rec = 1;
    if(rec==1){
        //如果付款完成切換UI
        pricePayed();
        //將櫃子打開
        controlChannel *cc = new controlChannel();
        cc->openChannel(currentCh.toUInt());
        //調整資料庫
        db->transferTOhistory(currentCh);
    }
}

void redirect::pricePayed(){
    qDebug("price have payed");
    setVisible(QString("nextPage"));
    emit displayPriceVisibleChanged();

    qDebug("call pricePayed");
    setVisible(QString("thisPage"));
    emit pricePayedVisibleChanged();
}

void redirect::toSell(){
    qDebug("toSell called");

    setVisible(QString("off"));
    emit toSigninVisibleChanged();
    emit toSignupVisibleChanged();

    setVisible(QString("nextPage"));
    emit buyORsellVisibleChanged();

    qDebug("call signupORsignin");
    setVisible(QString("thisPage"));
    emit signupORsigninVisibleChanged();
}

void redirect::toSignin(){
    setVisible(QString("off"));
    emit toSignupVisibleChanged();

    setVisible(QString("on"));
    emit toSigninVisibleChanged();
}
void redirect::toSignup(){
    setVisible(QString("off"));
    emit toSigninVisibleChanged();

    setVisible(QString("on"));
    emit toSignupVisibleChanged();
}

void redirect::signup(QString studentNumber,QString pwd,QString bankACC,QString email,QString email_confirm){
    if(email!=email_confirm){
        qDebug() << "確認電子郵件錯誤\n"
                    "與電子郵件不相符";
        signupnotifyText = "確認電子郵件錯誤\n"
                           "與電子郵件不相符";
        emit signupnotifyTextchanged();
        return ;
    }
    database *db = new database();
    qsrand(QTime(0,0,0).secsTo(QTime::currentTime()));
    QString verifyCode = QString("%1").arg(qrand()%(9999+1),4,10,QLatin1Char('0'));
    verifyCode += QString("%1").arg(qrand()%(9999+1),4,10,QLatin1Char('0'));
    verifyCode += QString("%1").arg(qrand()%(99+1),2,10,QLatin1Char('0'));
    int singupHandler = db->signupUSER(studentNumber,pwd,bankACC,email,verifyCode);

    if(singupHandler==1){
        qDebug() << "資料庫和寄信接已完成" << "，跳轉頁面";
        signupnotifyText = " ";
        emit signupnotifyTextchanged();

        signupfinishText = "請至信箱驗證帳號\n"
                           "驗證後即可登入";
        emit signupfinishTextchanged();




    }
    if(singupHandler==2){
        qDebug() << "帳號至少五碼";
        signupnotifyText = "帳號至少六碼";
        emit signupnotifyTextchanged();
    }
    if(singupHandler==3){
        signupnotifyText = "密碼至少六碼";
        emit signupnotifyTextchanged();
    }
    if(singupHandler==4){
        qDebug() << "11111";
        signupnotifyText = "帳號已經被註冊";
        emit signupnotifyTextchanged();
    }
    if(singupHandler==5){
        signupnotifyText = "銀行帳號已經被註冊";
        emit signupnotifyTextchanged();
    }
    if(singupHandler==6){
        signupnotifyText = "郵件信箱已經被註冊";
        emit signupnotifyTextchanged();
    }
    if(singupHandler==7){
        signupnotifyText = "郵件錯誤，請輸入gmail\n"
                           "如：yunreserve@gmail.com";
        emit signupnotifyTextchanged();
    }
}

void redirect::to_uploadCH(QString acc, QString pwd){
    database *db = new database();
    int signinHandler = db->verifyUSER(acc, pwd);
    if(signinHandler==1){
        verifiedText = " ";
        emit notverified();
        userACC = acc;
        qDebug("上架_選擇格子");
        setVisible(QString("nextPage"));
        emit signupORsigninVisibleChanged();

        setVisible(QString("thisPage"));
        emit uploadCHVisibleChanged();
    }else if(signinHandler==2){
        qDebug() << "帳號還沒驗證";
        verifiedText = "帳號還沒驗證\n"
                       "請至您的郵件信箱驗證帳號";
        emit notverified();
    }else{
        qDebug() << "帳號錯誤";
        verifiedText = "帳號密碼錯誤";
        emit notverified();
    }
}

void redirect::to_uploadInput(int channel){
    box_ch = QString::number(channel);
    qDebug("已選格子，輸入商品資訊");
    setVisible(QString("nextPage"));
    emit uploadCHVisibleChanged();

    setVisible(QString("thisPage"));
    emit to_uploadInputVisibleChanged();
}

void redirect::uploadGood(){
    controlChannel *cc = new controlChannel();
    if(cc->openChannel(box_ch.toInt())){
        setVisible(QString("nextPage"));
        emit to_uploadInputVisibleChanged();

        setVisible(QString("thisPage"));
        emit setuploadingVisibleChanged();
    }
}

void redirect::waitForbuying(){
    controlChannel *cc = new controlChannel();
    if(cc->checkStatus()){
        qDebug() << "完整上架程序，已關上蓋子";
        setVisible("nextPage");
        emit pricePayedVisibleChanged();

        setVisible("thisPage");
        emit thankForBuyingVisibleChanged();
    }else{
        qDebug() << "還沒關閉";
    }
}

void redirect::waitForUpload(QString item,QString price,QString remark){
    qDebug() << "正在等待關閉";
    controlChannel *cc = new controlChannel();
    if(cc->checkStatus()){
        upload_finished(item,price,remark);
        emit stopChecking();
    }
}

void redirect::upload_finished(QString item,QString price,QString remark){
    database *db = new database();
    if(db->uploadGood(item,price,remark,userACC,box_ch)){
        setVisible(QString("nextPage"));
        emit setuploadingVisibleChanged();

        setVisible(QString("thisPage"));
        emit uploadFinishedVisibleChanged();
    }else{
        qDebug("上架失敗");
    }
}

void redirect::setVisible(QString st){
    state = st;
}

void redirect::toChangeAccount(){
    setVisible("nextPage");
    emit buyORsellVisibleChanged();
    changeAccount_text = "請輸入註冊的信箱，以找回帳號";
    emit changeAccountTextChanged();

    setVisible("thisPage");
    emit changeAccountVisibleChanged();
}
void redirect::toFindAcc_sendEmail(QString email){
    database *db = new database();
    //str為三個欄位
    QString str = db->getAccFromEmail(email);
    qDebug() << str;
    if(str=="0"){
        return;
    }
    str += ","+email;
    QNetworkAccessManager* manager = new QNetworkAccessManager();
    QNetworkRequest request;
    request.setUrl(QUrl("http://sinshengcci.com/send/findACC"));
    QNetworkReply *pReply = manager->post(request, str.toUtf8());
    QEventLoop eventLoop;
    QObject::connect(manager,&QNetworkAccessManager::finished,
                     &eventLoop,&QEventLoop::quit);
    eventLoop.exec();
    QByteArray bytes = pReply->readAll();
    QString strTMP = bytes;
    qDebug() << strTMP;
    pReply->deleteLater();
}

void redirect::toTakeOFF(){
    setVisible("nextPage");
    emit buyORsellVisibleChanged();
    setVisible("thisPage");
    emit takeOFFVisibleChanged();

    takeOFF_thankYouState_Text = "takeOFF_thankYou_End";
    emit takeOFF_thankYouStateChanged();
    takeOFF_choseChannelState = "takeOFF_choseChannel_End";
    emit takeOFF_choseChannelVisibleChanged();
    signinForTakeOFFItemText = "signinForTakeOFF_Start";
    emit signinForTakeOFFItemVisibleChanged();

    signinForTakeOFF_Text = " ";
    emit signinForTakeOFFTextChanged();


}

void redirect::toTakeOFF_signin(QString acc, QString pwd){
    database *db = new database();
    int handler = db->verifyUSER(acc,pwd);
    if(handler==1){
        signinForTakeOFFItemText = "signinForTakeOFF_End";
        emit signinForTakeOFFItemVisibleChanged();
        signinForTakeOFF_Text = " ";
        emit signinForTakeOFFTextChanged();
        takeOFF_choseChannelState = "takeOFF_choseChannel_Start";
        emit takeOFF_choseChannelVisibleChanged();
    }
    if(handler==2){
        signinForTakeOFF_Text = "請先至Email驗證帳號";
        emit signinForTakeOFFTextChanged();
    }
    if(handler==0){
        signinForTakeOFF_Text = "帳號或密碼錯誤";
        emit signinForTakeOFFTextChanged();
    }

}

void redirect::toTakeOFF_openChannel(int i){
    database *db = new database();
    db->takeOFF(i);

    controlChannel *cc = new controlChannel();
    cc->openChannel(i);

}

void redirect::checkChennelStatus_TakeOFF(){
    controlChannel *cc = new controlChannel();
    if(cc->checkStatus()){
        qDebug() << "完整上架程序，已關上蓋子";
        takeOFF_choseChannelState = "takeOFF_choseChannel_End";
        emit takeOFF_choseChannelVisibleChanged();

        takeOFF_thankYouState_Text = "takeOFF_thankYou_Start";
        emit takeOFF_thankYouStateChanged();
    }else{
        qDebug() << "還沒關閉";
    }
}


