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

void redirect::toDisplayPrice(int i){
    currentCh = QString::number(i);
    qDebug("toDisplayPrice called");
    setVisible(QString("nextPage"));
    emit chosechannelVisibleChanged();

    qDebug("call displayPrice");
    setVisible(QString("thisPage"));
    emit displayPriceVisibleChanged();
}

void redirect::isPricePayed(){
    qDebug()<<"檢查付款"<<currentCh;

    //執行電文交換
    postXML *post = new postXML();
    post->check_payment();

    if(true){
        //如果付款完成切換UI
        pricePayed();
        //將櫃子打開
        controlChannel *cc = new controlChannel();
        cc->openChannel(currentCh.toUInt());
        //調整資料庫
        database *db = new database();
//        db->pricePayed(currentCh);
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

void redirect::to_uploadCH(){
    qDebug("上架_選擇格子");
    setVisible(QString("nextPage"));
    emit signupORsigninVisibleChanged();

    setVisible(QString("thisPage"));
    emit uploadCHVisibleChanged();
}

void redirect::to_uploadInput(){
    qDebug("已選格子，輸入商品資訊");
    setVisible(QString("nextPage"));
    emit uploadCHVisibleChanged();

    setVisible(QString("thisPage"));
    emit to_uploadInputVisibleChanged();
}

void redirect::upload_finished(){
    qDebug("完成上架程序");
    setVisible(QString("nextPage"));
    emit to_uploadInputVisibleChanged();

    setVisible(QString("thisPage"));
    emit uploadFinishedVisibleChanged();
}










void redirect::setVisible(QString st){
    state = st;
}

