#include "ui.h"

UI::UI(QObject *parent) : QObject(parent)
{
    db_yunreserve = QSqlDatabase::addDatabase("QMYSQL");
    db_yunreserve.setHostName("127.0.0.1");
    db_yunreserve.setDatabaseName("yunreserve");
    db_yunreserve.setUserName("root");
    db_yunreserve.setPassword("up42j4g8g.3");
}

void UI::setFunction(QString i){
    functionHandler = i;
    notify = "";
    emit login_notifyChanged();
}

void UI::setChannelVisible(){
    QEventLoop eventLoop;
    QTimer::singleShot(50,&eventLoop,SLOT(quit()));
    eventLoop.exec();
    if(!db_yunreserve.open()){
        setChannelState(0, 99);
        return;
    }
    if(functionHandler=="1"){
        setChannelState(0, 99);
        QSqlQuery query;
        query.exec("SELECT box_ch FROM inchannel");
        while (query.next()) {
            int box_ch = query.value(0).toString().toInt();
            setChannelState(1, box_ch);
        }
    }
    if(functionHandler=="2"){
        setChannelState(1, 99);
        QSqlQuery query;
        query.exec("SELECT box_ch FROM inchannel");
        while (query.next()) {
            int box_ch = query.value(0).toString().toInt();
            setChannelState(0, box_ch);
        }
    }
    db_yunreserve.close();
}

void UI::setChannel(QString channel){
    box_ch = channel;
    notify = "";
    emit upload_notifyChanged();
}

void UI::setItemInfo(){
    QEventLoop eventLoop;
    QTimer::singleShot(50,&eventLoop,SLOT(quit()));
    eventLoop.exec();
    itemInfo = "";
    emit itemNameChanged();
    if(!db_yunreserve.open()){
        return;
    }
    QSqlQuery query;
    query.prepare("SELECT item, price FROM inchannel WHERE box_ch=?");
    query.addBindValue(box_ch);
    query.exec();
    if(query.next()){
        itemInfo = query.value(0).toString();
        emit itemNameChanged();
        itemInfo = query.value(1).toString();
        emit itemPriceChanged();
    }
    db_yunreserve.close();
}

bool UI::login_submit(QString acc, QString pwd){
    notify = "";
    emit login_notifyChanged();
    QEventLoop eventLoop;
    QTimer::singleShot(50,&eventLoop,SLOT(quit()));
    eventLoop.exec();
    if(!db_yunreserve.open()){
        notify = "資料庫錯誤，請稍號在試";
        emit login_notifyChanged();
        return false;
    }
    QRegularExpression re_acc("^\\w{6,12}$", QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_acc = re_acc.match(acc);
    QRegularExpression re_pwd("^\\w{6,12}$", QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_pwd = re_pwd.match(pwd);
    if(!match_acc.hasMatch()){
        notify = "帳號請輸入六碼英數組合";
        emit login_notifyChanged();
        return false;
    }
    if(!match_pwd.hasMatch()){
        notify = "密碼請輸入六碼英數組合";
        emit login_notifyChanged();
        return false;
    }
    QCryptographicHash *hash = new QCryptographicHash(QCryptographicHash::Sha256);
    hash->addData(pwd.toUtf8());
    QByteArray pwd_hash = hash->result().toHex();

    QSqlQuery query;
    query.prepare("SELECT * FROM account WHERE studentNumber=? AND pwd=?");
    query.addBindValue(acc);
    query.addBindValue(pwd_hash);
    query.exec();
    if(!query.next()){
        notify = "帳密錯誤，無法登入";
        emit login_notifyChanged();
        return false;
    }
    notify = "";
    emit login_notifyChanged();
    return true;
}

bool UI::upload_submit(QString item, QString price){
    notify = "";
    emit upload_notifyChanged();
    QEventLoop eventLoop;
    QTimer::singleShot(50,&eventLoop,SLOT(quit()));
    eventLoop.exec();



    return true;
}





