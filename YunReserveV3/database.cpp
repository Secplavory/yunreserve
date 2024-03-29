﻿#include "database.h"

QPixmap ColorImageProvider::requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
{
    QByteArray ba = QUrl::toPercentEncoding(id);
    qDebug()<< ba.constData();
    QString tmpstr = ba.constData();

    QrCode qr0 = QrCode::encodeText(tmpstr.toUtf8(), QrCode::Ecc::MEDIUM);
    QImage QrCode_Image=QImage(qr0.getSize(),qr0.getSize(),QImage::Format_RGB888);

    for (int y = 0; y < qr0.getSize(); y++) {
        for (int x = 0; x < qr0.getSize(); x++) {
            if(qr0.getModule(x, y)==0)
                QrCode_Image.setPixel(x,y,qRgb(255,255,255));
            else
                QrCode_Image.setPixel(x,y,qRgb(0,0,0));
        }
    }
    QrCode_Image=QrCode_Image.scaled(320,320,Qt::KeepAspectRatio);

    return QPixmap::fromImage(QrCode_Image);
}

database::database(QObject *parent) : QObject(parent)
{
}

void database::check(){
    qDebug("檢查資料庫連接");
    for(int i=1;i<13;i++){
        setChannelVisible("unavailable",i);
    }
    QSqlDatabase sql = QSqlDatabase::addDatabase("QMYSQL");
    sql.setHostName("127.0.0.1");
    sql.setUserName("root");
    sql.setPassword("up42j4g8g.3");
    sql.setDatabaseName("yunreserve");
    if(!sql.open()){
        qDebug("資料庫連接失敗!!!!!");
    }else{
        qDebug("資料庫連接成功");
        QSqlQuery query(sql);
//        query.prepare("INSERT INTO inchannel(item,price,box_ch)" "VALUES(:item,:price,:box_ch)");
//        query.bindValue(":item","123123");
//        query.bindValue(":price","2000");
//        query.bindValue(":box_ch","3");
//        query.exec();

        query.exec("SELECT id, item, price, box_ch FROM inchannel");
        while(query.next()){
            QString id = query.value(0).toString();
            QString item = query.value(1).toString();
            QString price = query.value(2).toString();
            QString box_ch = query.value(3).toString();
            qDebug() << "通道:" << box_ch << "有物件";
            setChannelVisible("available",box_ch.toInt());
        }
    }
}

void database::upload_whichSeleted(int i){
    upload_whichCH = QString::number(i);
    qDebug() << "已選擇通道:" << upload_whichCH;
}

bool database::uploadGood(QString item, QString price, QString remark,QString userACC,QString box_ch){
    qDebug() << "\n商品名稱:" << item << "\n商品價格" << price << "\n商品資訊" << remark;
    qDebug() << "放入通道:" << upload_whichCH;
    QString email;
    QString bankACC;
    QSqlDatabase sql = QSqlDatabase::addDatabase("QMYSQL");
    sql.setHostName("127.0.0.1");
    sql.setUserName("root");
    sql.setPassword("up42j4g8g.3");
    sql.setDatabaseName("yunreserve");
    if(!sql.open()){
        qDebug("資料庫連接失敗!!!!!");
    }else{
        qDebug("資料庫連接成功");
        QSqlQuery query(sql);
        query.prepare("SELECT bankACC,email FROM account WHERE studentNumber=?");
        query.addBindValue(userACC);
        query.exec();
        if(query.next()){
            qDebug() << "進入進入";
            bankACC = query.value(0).toString();
            email = query.value(1).toString();
            qDebug() << bankACC << email;
            QSqlQuery query(sql);
            query.prepare("INSERT INTO inchannel(item,price,remark,seller,email,bankACC,box_ch)"
                          "VALUES(:item,:price,:remark,:seller,:email,:bankACC,:box_ch)");
            query.bindValue(":item",item);
            query.bindValue(":price",price);
            query.bindValue(":remark",remark);
            query.bindValue(":seller",userACC);
            query.bindValue(":email",email);
            query.bindValue(":bankACC",bankACC);
            query.bindValue(":box_ch",box_ch);
            if(query.exec()){
                return true;
            }
        }
    }
    return false;
}

void database::whichSeleted(int i){
    QSqlDatabase sql = QSqlDatabase::addDatabase("QMYSQL");
    sql.setHostName("127.0.0.1");
    sql.setUserName("root");
    sql.setPassword("up42j4g8g.3");
    sql.setDatabaseName("yunreserve");
    if(!sql.open()){
        qDebug("資料庫連接失敗!!!!!");
    }else{
        QSqlQuery query(sql);
        query.prepare("SELECT id,item,price,remark FROM inchannel WHERE box_ch = ?");
        query.addBindValue(i);
        query.exec();
        if(query.next()){
            QString id = query.value(0).toString();
            QString item = query.value(1).toString();
            QString price = query.value(2).toString();
            QString remark = query.value(3).toString();
            qDebug() << "ID：" << id << "\n物件：" << item << "\n價格：" << price << "\n商品資訊：" << remark << "\n通道：" << i;
            qDebug() << "將第" << i << "通道內的付款資訊製作成QRcode";
            id = QString("%1").arg(id.toInt()%1000000, 6,10,QLatin1Char('0'));
            setQRcode("TWQRP://芯生文創/158/01/V1?D1="+price+"00&D2="+id+"&D3=AcDtT2zBCHtp&D10=901&D11=00,00400482497653500150010001;01,00400482497653500150010001",i);
//            setQRcode("TWQRP://芯生文創/158/01/V1?D1="+price+"00&D2="+id+"&D3=AcDtT2zBCHtp&D10=901&D11=00,00400482497653500150010001;51,0040000031001014097",i);

        }
    }
}

void database::setQRcode(QString st, int ch){
    QRcodeSRC = st;
    buy_whichCH = QString::number(ch);
    emit QRcodeSetted();
}

void database::setVisible(QString st){
    state = st;
}

void database::setChannelVisible(QString st,int ch){
    state = st;
    switch(ch) {
    case 1:
        emit ch1StateChanged();
        break;
    case 2:
        emit ch2StateChanged();
        break;
    case 3:
        emit ch3StateChanged();
        break;
    case 4:
        emit ch4StateChanged();
        break;
    case 5:
        emit ch5StateChanged();
        break;
    case 6:
        emit ch6StateChanged();
        break;
    case 7:
        emit ch7StateChanged();
        break;
    case 8:
        emit ch8StateChanged();
        break;
    case 9:
        emit ch9StateChanged();
        break;
    case 10:
        emit ch10StateChanged();
        break;
    case 11:
        emit ch11StateChanged();
        break;
    case 12:
        emit ch12StateChanged();
        break;
    }
}

int database::signupUSER(QString acc, QString pwd, QString bankACC, QString email, QString verifyCode){
    if(acc.length()<6){
        return 2;
    }
    if(pwd.length()<6){
        return 3;
    }

    QSqlDatabase sql = QSqlDatabase::addDatabase("QMYSQL");
    sql.setHostName("127.0.0.1");
    sql.setUserName("root");
    sql.setPassword("up42j4g8g.3");
    sql.setDatabaseName("yunreserve");
    if(!sql.open()){
        qDebug("資料庫連接失敗!!!!!");
        return 0;
    }
    qDebug("資料庫連接成功");
    QSqlQuery query(sql);

    query.prepare("SELECT * FROM account WHERE studentNumber=?");
    query.addBindValue(acc);
    query.exec();
    if(query.next()){
        return 4;
    }
    query.prepare("SELECT * FROM account WHERE bankACC=?");
    query.addBindValue(bankACC);
    query.exec();
    if(query.next()){
        return 5;
    }
    query.prepare("SELECT * FROM account WHERE email=?");
    query.addBindValue(email);
    query.exec();
    if(query.next()){
        return 6;
    }

    class verifyUSER *vUser = new class verifyUSER(email,acc,verifyCode);
    int emailSent = vUser->toverifyUser();

    if(emailSent==2){
        return 7;
    }

    query.prepare("INSERT INTO account (studentNumber,pwd,bankACC,email,verified,verifyCode)"
                  "VALUES(:studentNumber,:pwd,:bankACC,:email,:verified,:verifyCode)");
    query.bindValue(":studentNumber",acc);
    query.bindValue(":pwd",pwd);
    query.bindValue(":bankACC",bankACC);
    query.bindValue(":email",email);
    query.bindValue(":verified",0);
    query.bindValue(":verifyCode",verifyCode);
    if(query.exec()){
        return 1;
    }


    return 0;
}


int database::verifyUSER(QString acc,QString pwd){
    QSqlDatabase sql = QSqlDatabase::addDatabase("QMYSQL");
    sql.setHostName("127.0.0.1");
    sql.setUserName("root");
    sql.setPassword("up42j4g8g.3");
    sql.setDatabaseName("yunreserve");
    if(!sql.open()){
        qDebug("資料庫連接失敗!!!!!");
    }else{
        qDebug("資料庫連接成功");
        QSqlQuery query(sql);
        query.prepare("SELECT verified FROM account WHERE studentNumber=:studentNumber AND pwd=:pwd");
        query.bindValue(":studentNumber",acc);
        query.bindValue(":pwd",pwd);
        query.exec();
        if(query.next()){
            QString verifyHandler = query.value(0).toString();
            if(verifyHandler=="1"){
                return 1;
            }else{
                return 2;
            }
        }
    }
    return 0;
}


int database::check_payment(QString currentCh){
    qDebug() << "檢查資料庫付款訊息";
    QSqlDatabase sql = QSqlDatabase::addDatabase("QMYSQL");
    sql.setHostName("127.0.0.1");
    sql.setUserName("root");
    sql.setPassword("up42j4g8g.3");
    sql.setDatabaseName("yunreserve");
    if(!sql.open()){
        qDebug("資料庫連接失敗!!!");
    }else{
        QString orderID;
        QString orderPrice;
        QString orderNumber;

        QSqlQuery query(sql);
        query.prepare("SELECT * FROM inchannel WHERE box_ch=?");
        query.addBindValue(currentCh);
        query.exec();
        if(query.next()){
            orderID = query.value(0).toString();
            orderPrice = QString("%1").arg(query.value(2).toString().toInt()*100, 12, 10, QLatin1Char('0'));
            orderNumber = QString("%1").arg(orderID.toInt()%99999, 5,10,QLatin1Char('0'));
            QSqlDatabase sql = QSqlDatabase::addDatabase("QMYSQL");
            sql.setHostName("127.0.0.1");
            sql.setUserName("root");
            sql.setPassword("up42j4g8g.3");
            sql.setDatabaseName("xmlstorage");
            if(!sql.open()){
                qDebug() << "資料庫連接失敗";
            }else{
                QSqlQuery query(sql);
                query.prepare("SELECT * FROM xmlPost_testing WHERE orderNumber=? AND amt=?");
                query.addBindValue(orderNumber);
                query.addBindValue(orderPrice);
                query.exec();
                if(query.next()){
                    return 1;
                }
            }
        }
    }
    return 0;
}

void database::transferTOhistory(QString currentCh){
    qDebug() << "將inchannel刪除，轉移至history";
    QSqlDatabase sql = QSqlDatabase::addDatabase("QMYSQL");
    sql.setHostName("127.0.0.1");
    sql.setUserName("root");
    sql.setPassword("up42j4g8g.3");
    sql.setDatabaseName("yunreserve");
    if(!sql.open()){
        qDebug("資料庫連接失敗!!!");
    }else{
        QString id;
        QString item;
        QString price;
        QString remark;
        QString box_ch;
        QString seller;
        QString email;
        QString bankACC;
        QSqlQuery query(sql);
        query.prepare("SELECT * FROM inchannel WHERE box_ch=?");
        query.addBindValue(currentCh);
        query.exec();
        if(query.next()){
            id = query.value(0).toString();
            item = query.value(1).toString();
            price = query.value(2).toString();
            remark = query.value(3).toString();
            seller = query.value(4).toString();
            email = query.value(5).toString();
            bankACC = query.value(6).toString();
            box_ch = query.value(7).toString();
            qDebug() << id << item << price << remark << box_ch;
            query.prepare("DELETE FROM inchannel WHERE box_ch = ?");
            query.addBindValue(currentCh);
            query.exec();
            query.prepare("INSERT INTO transaction_history(item,price,remark,seller,email,bankACC,box_ch)"
                          "VALUES(:item,:price,:remark,:seller,:email,:bankACC,:box_ch)");
            query.bindValue(":item",item);
            query.bindValue(":price",price);
            query.bindValue(":remark",remark);
            query.bindValue(":seller",seller);
            query.bindValue(":email",email);
            query.bindValue(":bankACC",bankACC);
            query.bindValue(":box_ch",box_ch);
            query.exec();
        }

    }

}


QString database::get_item_name(QString currentCh){
    QSqlDatabase sql = QSqlDatabase::addDatabase("QMYSQL");
    sql.setHostName("127.0.0.1");
    sql.setUserName("root");
    sql.setPassword("up42j4g8g.3");
    sql.setDatabaseName("yunreserve");
    if(!sql.open()){
        qDebug("資料庫連接失敗!!!!!");
    }else{
        qDebug("資料庫連接成功");
        QSqlQuery query(sql);
        query.prepare("SELECT item FROM inchannel WHERE box_ch=:box_ch");
        query.bindValue(":box_ch",currentCh);
        query.exec();
        if(query.next()){
            return query.value(0).toString();
        }
    }
    return "資料庫錯誤";
}

QString database::get_remark_name(QString currentCh){
    QSqlDatabase sql = QSqlDatabase::addDatabase("QMYSQL");
    sql.setHostName("127.0.0.1");
    sql.setUserName("root");
    sql.setPassword("up42j4g8g.3");
    sql.setDatabaseName("yunreserve");
    if(!sql.open()){
        qDebug("資料庫連接失敗!!!!!");
    }else{
        qDebug("資料庫連接成功");
        QSqlQuery query(sql);
        query.prepare("SELECT remark FROM inchannel WHERE box_ch=:box_ch");
        query.bindValue(":box_ch",currentCh);
        query.exec();
        if(query.next()){
            return query.value(0).toString();
        }
    }
    return "資料庫錯誤";

}

QString database::get_price_name(QString currentCh){
    QSqlDatabase sql = QSqlDatabase::addDatabase("QMYSQL");
    sql.setHostName("127.0.0.1");
    sql.setUserName("root");
    sql.setPassword("up42j4g8g.3");
    sql.setDatabaseName("yunreserve");
    if(!sql.open()){
        qDebug("資料庫連接失敗!!!!!");
    }else{
        qDebug("資料庫連接成功");
        QSqlQuery query(sql);
        query.prepare("SELECT price FROM inchannel WHERE box_ch=:box_ch");
        query.bindValue(":box_ch",currentCh);
        query.exec();
        if(query.next()){
            return query.value(0).toString();
        }
    }
    return "資料庫錯誤";

}

QString database::getAccFromEmail(QString email){
    QSqlDatabase sql = QSqlDatabase::addDatabase("QMYSQL");
    sql.setHostName("127.0.0.1");
    sql.setUserName("root");
    sql.setPassword("up42j4g8g.3");
    sql.setDatabaseName("yunreserve");
    if(!sql.open()){
        qDebug("資料庫連接失敗!!!!!");
    }else{
        qDebug("資料庫連接成功");
        QSqlQuery query(sql);
        query.prepare("SELECT studentNumber,pwd,bankACC,verifyCode FROM account WHERE email=:email");
        query.bindValue(":email",email);
        query.exec();
        if(query.next()){
            return query.value(0).toString()+","+query.value(1).toString()+","+query.value(2).toString()+","+query.value(3).toString();
        }
        return "0";
    }
}


void database::toTakeOFF_signin(QString acc){
    takeOFF_channel_StateHandler = "unavailable";
    emit takeOFF_channel1_StateChanged();
    emit takeOFF_channel2_StateChanged();
//    emit takeOFF_channel3_StateChanged();


    QSqlDatabase sql = QSqlDatabase::addDatabase("QMYSQL");
    sql.setHostName("127.0.0.1");
    sql.setUserName("root");
    sql.setPassword("up42j4g8g.3");
    sql.setDatabaseName("yunreserve");
    if(!sql.open()){
        qDebug("資料庫連接失敗!!!!!");
    }else{
        qDebug("資料庫連接成功");
        QSqlQuery query(sql);
        query.prepare("SELECT box_ch FROM inchannel WHERE seller=:seller");
        query.bindValue(":seller",acc);
        query.exec();
        takeOFF_channel_StateHandler = "available";
        while(query.next()){
            QString box_ch = query.value(0).toString();
            switch(box_ch.toInt()){
            case 1:
                emit takeOFF_channel1_StateChanged();
                break;
            case 2:
                emit takeOFF_channel2_StateChanged();
                break;
            }
        }
    }
}


int database::takeOFF(int i){
    qDebug() << "將inchannel刪除";
    QSqlDatabase sql = QSqlDatabase::addDatabase("QMYSQL");
    sql.setHostName("127.0.0.1");
    sql.setUserName("root");
    sql.setPassword("up42j4g8g.3");
    sql.setDatabaseName("yunreserve");
    if(!sql.open()){
        qDebug("資料庫連接失敗!!!");
    }else{
        QSqlQuery query(sql);
        query.prepare("DELETE FROM inchannel WHERE box_ch = ?");
        query.addBindValue(i);
        query.exec();
    }
}






