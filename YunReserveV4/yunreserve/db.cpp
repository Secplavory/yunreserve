#include "db.h"

QPixmap ColorImageProvider::requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
{
    QByteArray ba = QUrl::toPercentEncoding(id);
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

DB::DB()
{
    boxState = "0";
    db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("127.0.0.1");
    db.setUserName("root");
    db.setPassword("up42j4g8g.3");
}

void DB::receiveFunctionHandler(int i){
    functionHandler = i;
    switch (functionHandler) {
    case 1:
        perchase();
        break;
    case 2:
//        upload();
        break;
    case 3:
//        update();
        break;
    }
}

void DB::perchase(){
    db.setDatabaseName("yunreserve");
    if(!db.open()){
        qDebug("資料庫未連接");
        return ;
    }
    boxState = "1";
    QSqlQuery query(db);
    query.exec("SELECT box_ch FROM inchannel");
    while(query.next()){
        switch (query.value(0).toInt()) {
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
        }
    }
    query.clear();
    db.close();
}

void DB::setBox_ch(int i){
    box_ch = i;
}

void DB::execFunction(){
    switch (functionHandler) {
    case 1:
        displayQRcode();
    break;
    }
}

void DB::displayQRcode(){
    db.setDatabaseName("yunreserve");
    if(!db.open()){
        qDebug("資料庫未連接");
        return ;
    }
    QSqlQuery query(db);
    query.prepare("SELECT id,item,price,remark,seller FROM inchannel WHERE box_ch=?");
    query.addBindValue(box_ch);
    query.exec();
    if(query.next()){
        QString id = query.value(0).toString();
        id = QString("%1").arg(id.toInt()%1000000, 6,10,QLatin1Char('0'));
        itemName_Text = query.value(1).toString();
        itemPrice_Text = query.value(2).toString();
        itemRemark_Text = query.value(3).toString();
        itemSeller_Text = query.value(4).toString();
        itemQRcode_Text = "TWQRP://芯生文創/158/01/V1?D1="+itemPrice_Text+"00&D2="+id+"&D3=AcDtT2zBCHtp&D10=901&D11=00,00400482497653500150010001;01,00400482497653500150010001";
        emit itemNameChanged();
        emit itemPriceChanged();
        emit itemRemarkChanged();
        emit itemQRcodeChanged();
    }
}

bool DB::checkPayment(int i){
    db.setDatabaseName("yunreserve");
    if(!db.open()){
        return false;
    }
    QString orderID;
    QString orderPrice;
    QString orderNumber;

    QSqlQuery query(db);
    query.prepare("SELECT * FROM inchannel WHERE box_ch=?");
    query.addBindValue(i);
    query.exec();
    if(!query.next()){
        qDebug("資料庫連接失敗");
        return false;
    }
    orderID = query.value(0).toString();
    orderPrice = QString("%1").arg(query.value(2).toString().toInt()*100, 12, 10, QLatin1Char('0'));
    orderNumber = QString("%1").arg(orderID.toInt()%1000000, 6,10,QLatin1Char('0'));
    query.clear();
    db.close();
    db.setDatabaseName("xmlstorage");
    if(!db.open()){
        qDebug("資料庫連接失敗");
        return false;
    }
    query.prepare("SELECT * FROM xmlPost_testing WHERE orderNumber=? AND amt=?");
    query.addBindValue(orderNumber);
    query.addBindValue(orderPrice);
    query.exec();
    if(!query.next()){
        return false;
    }
    query.clear();
    db.close();
    return true;
}












