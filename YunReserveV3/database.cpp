#include "database.h"

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
    qDebug("database checked");
    for(int i=1;i<13;i++){
        setChannelVisible("unavailable",i);
    }
    QSqlDatabase sql = QSqlDatabase::addDatabase("QMYSQL");
    sql.setHostName("127.0.0.1");
    sql.setUserName("root");
    sql.setPassword("1234");
    sql.setDatabaseName("yunreserve");
    if(!sql.open()){
        qDebug("fail");
    }else{
        qDebug("suceess");
        QSqlQuery query(sql);
//        query.prepare("INSERT INTO inchannel(item,price,box_ch)" "VALUES(:item,:price,:box_ch)");
//        query.bindValue(":item","幹幹幹幹幹");
//        query.bindValue(":price","2000");
//        query.bindValue(":box_ch","3");
//        query.exec();

        query.exec("SELECT id, item, price, box_ch FROM inchannel");
        while(query.next()){
            QString id = query.value(0).toString();
            QString item = query.value(1).toString();
            QString price = query.value(2).toString();
            QString box_ch = query.value(3).toString();
            qDebug() << id << item << price << box_ch;
            setChannelVisible("available",box_ch.toInt());
        }
    }
}

void database::uploadGood(QString item,QString price,QString remark){
    qDebug() << item<<price<<remark;
    qDebug() << upload_whichCH;
    QSqlDatabase sql = QSqlDatabase::addDatabase("QMYSQL");
    sql.setHostName("127.0.0.1");
    sql.setUserName("root");
    sql.setPassword("1234");
    sql.setDatabaseName("yunreserve");
    if(!sql.open()){
        qDebug("fail");
    }else{
        qDebug("suceess");
        QSqlQuery query(sql);
        query.prepare("INSERT INTO inchannel(item,price,remark,box_ch)" "VALUES(:item,:price,:remark,:box_ch)");
        query.bindValue(":item",item);
        query.bindValue(":price",price);
        query.bindValue(":remark",remark);
        query.bindValue(":box_ch",upload_whichCH);
        query.exec();
    }
}

void database::upload_whichSeleted(int i){
    switch (i) {
    case 1:
    qDebug("顯示loading.gif");
    upload_whichCH = "1";
    qDebug()<<upload_whichCH;
    break;
    case 2:
        upload_whichCH = "2";
    setQRcode("QRcode for channel 2 !!!",i);
    break;
    case 3:
        upload_whichCH = "3";
    setQRcode("QRcode for channel 3 !!!",i);
    break;
    case 4:
        upload_whichCH = "4";
    setQRcode("QRcode for channel 4 !!!",i);
    break;
    case 5:
        upload_whichCH = "5";
    setQRcode("QRcode for channel 5 !!!",i);
    break;
    case 6:
        upload_whichCH = "6";
    setQRcode("QRcode for channel 6 !!!",i);
    break;
    case 7:
    setQRcode("QRcode for channel 7 !!!",i);
    break;
    case 8:
    setQRcode("QRcode for channel 8 !!!",i);
    break;
    case 9:
    setQRcode("QRcode for channel 9 !!!",i);
    break;
    case 10:
    setQRcode("QRcode for channel 10 !!!",i);
    break;
    case 11:
    setQRcode("QRcode for channel 11 !!!",i);
    break;
    case 12:
    setQRcode("QRcode for channel 12 !!!",i);
    break;
    }
}

void database::whichSeleted(int i){

    switch (i) {
    case 1:
    qDebug("顯示loading.gif");
    setQRcode("TWQRP://芯生文創/158/01/V1?D1=10000&D2=0001&D3=AcDtT2zBCHtp&D10=901&D11=00,00400482497653500150010001&D20=***",i);
    break;
    case 2:
    setQRcode("TWQRP://芯生文創/158/01/V1?D1=15000&D2=0002&D3=AcDtT2zBCHtp&D10=901&D11=00,00400482497653500150010001&D20=***",i);
    break;
    case 3:
    setQRcode("TWQRP://芯生文創/158/01/V1?D1=20000&D2=0003&D3=AcDtT2zBCHtp&D10=901&D11=00,00400482497653500150010001&D20=***",i);
    break;
    case 4:
    setQRcode("QRcode for channel 4 !!!",i);
    break;
    case 5:
    setQRcode("QRcode for channel 5 !!!",i);
    break;
    case 6:
    setQRcode("QRcode for channel 6 !!!",i);
    break;
    case 7:
    setQRcode("QRcode for channel 7 !!!",i);
    break;
    case 8:
    setQRcode("QRcode for channel 8 !!!",i);
    break;
    case 9:
    setQRcode("QRcode for channel 9 !!!",i);
    break;
    case 10:
    setQRcode("QRcode for channel 10 !!!",i);
    break;
    case 11:
    setQRcode("QRcode for channel 11 !!!",i);
    break;
    case 12:
    setQRcode("QRcode for channel 12 !!!",i);
    break;
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

void database::isPricePayed(){
////    qDebug()<<QSslSocket::supportsSsl();
//    //設定url
//    QString baseUrl = "https://yunreserve.com/";
////    QString focusUrl = "";
////    QString loginUrl = "";
//    //設定url完成

//    //準備post的資料
////    QByteArray data;
////    data.append("pLoginName: B10723058");
////    data.append("pLoginPassword: up42j4g8g.3");
//    //準備post的資料完成

//    //定義變數
//    QNetworkAccessManager* manager = new QNetworkAccessManager(this);
////    qDebug() << manager->supportedSchemes();
//    QNetworkRequest request;
//    //定義變數完成

//    //準備ssl
//    QSslConfiguration config;
//    QSslConfiguration conf = request.sslConfiguration();
//    conf.setPeerVerifyMode(QSslSocket::VerifyNone);
//    conf.setProtocol(QSsl::TlsV1SslV3);
//    request.setSslConfiguration(conf);
//    //準備ssl完成

//    //設定url與header
//    request.setUrl(QUrl(baseUrl));
//    request.setRawHeader("Content-Type","application/x-www-form-urlencoded");
//    //設定url與header完成

//    //傳輸完成列出資料
//    QNetworkReply *pReplay = manager->get(request);
//    QEventLoop eventLoop;
//    QObject::connect(manager, &QNetworkAccessManager::finished,&eventLoop,&QEventLoop::quit);
//    eventLoop.exec();
//    QByteArray bytes = pReplay->readAll();
//    qDebug() << bytes;
//    //傳輸完成列出資料完成
}

void database::pricePayed(QString currentCh){
    qDebug()<<currentCh;
    QSqlDatabase sql = QSqlDatabase::addDatabase("QMYSQL");
    sql.setHostName("127.0.0.1");
    sql.setUserName("root");
    sql.setPassword("1234");
    sql.setDatabaseName("yunreserve");
    if(!sql.open()){
        qDebug("fail");
    }else{
        qDebug("suceess");
        QSqlQuery query(sql);
        query.prepare("DELETE FROM inchannel WHERE box_ch = ?");
        query.addBindValue(currentCh);
        query.exec();
    }
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
