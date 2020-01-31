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

void redirect::signup(QString studentNumber,QString pwd,QString bankACC,QString email){
    database *db = new database();
    qsrand(QTime(0,0,0).secsTo(QTime::currentTime()));
    QString verifyCode = QString("%1").arg(qrand()%(9999+1),4,10,QLatin1Char('0'));
    verifyCode += QString("%1").arg(qrand()%(9999+1),4,10,QLatin1Char('0'));
    verifyCode += QString("%1").arg(qrand()%(99+1),2,10,QLatin1Char('0'));
    int singupHandler = db->signupUSER(studentNumber,pwd,bankACC,email,verifyCode);
    if(singupHandler==1){
        qDebug() << "true";
        verifyUSER *vUser = new verifyUSER(email,studentNumber,verifyCode);
    }else if(singupHandler==2){
        qDebug() << "帳號至少五碼";
        signupnotifyText = "帳號至少五碼";
        emit signupnotifyTextchanged();
    }else if(singupHandler==3){
    }else{
        qDebug() << "false";
    }
}

void redirect::to_uploadCH(QString acc, QString pwd){
    database *db = new database();
    int signinHandler = db->verifyUSER(acc, pwd);
    if(signinHandler==1){
        userACC = acc;
        qDebug("上架_選擇格子");
        setVisible(QString("nextPage"));
        emit signupORsigninVisibleChanged();

        setVisible(QString("thisPage"));
        emit uploadCHVisibleChanged();
    }else if(signinHandler==2){
        qDebug() << "帳號還沒驗證";
        verifiedText = "帳號還沒驗證";
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

