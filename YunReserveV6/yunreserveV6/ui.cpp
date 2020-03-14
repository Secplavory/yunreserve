#include "ui.h"

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



UI::UI(QObject *parent) : QObject(parent)
{
    db_yunreserve = QSqlDatabase::addDatabase("QMYSQL");
    db_yunreserve.setHostName("127.0.0.1");
    db_yunreserve.setDatabaseName("yunreserve");
    db_yunreserve.setUserName("root");
    db_yunreserve.setPassword("up42j4g8g.3");

    welcome_state = "1";
    state = "0";
}
void UI::reset(){
    welcome_state = "1";
    emit welcomeChanged();
    state = "0";
    emit chooseFunctionChanged();
    emit chooseChannelChanged();
    emit contractChanged();
    emit scanQrcodeChanged();
    emit loginChanged();
    emit signupChanged();
    emit thanksYouChanged();

    emit upload_itemInfoChanged();
}

void UI::welcome_clicked(){
    welcome_state = "0";
    emit welcomeChanged();
    state = "1";
    emit chooseFunctionChanged();
}

void UI::choose_perchase(){
    state = "0";
    emit chooseFunctionChanged();
    state = "1";
    emit chooseChannelChanged();
}

void UI::toContract(){
    state = "0";
    emit chooseChannelChanged();
    state = "1";
    emit contractChanged();
}

void UI::chooseChannel_toChooseFunction(){
    state = "0";
    emit chooseChannelChanged();
    state = "1";
    emit chooseFunctionChanged();
}
void UI::contract_toChooseChannel(){
    state = "0";
    emit contractChanged();
    state = "1";
    emit chooseChannelChanged();
}

void UI::chooseChannel_chosen(){
    state = "0";
    emit chooseChannelChanged();
    state = "1";
    if(getFunction()==1){
        emit scanQrcodeChanged();
        notify = "";
        emit scanQrcode_notifyChanged();
    }
    if(getFunction()==2){
        emit upload_itemInfoChanged();
    }
    if(getFunction()==3){
        if(!db_yunreserve.open()){
            return;
        }
        QSqlQuery query;
        query.prepare("DELETE FROM inchannel WHERE seller=? AND box_ch=?");
        query.addBindValue(userACC);
        query.addBindValue(box_ch);
        if(!query.exec()){
            db_yunreserve.close();
            return ;
        }
        db_yunreserve.close();
        QString filePath="C:/Users/user/Desktop/cabinet/Control.txt";
        QString statuPath="C:/Users/user/Desktop/cabinet/Status.txt";
        QFile file(filePath);
        if(!file.open(QIODevice::WriteOnly|QIODevice::Text)){
            notify = "資料庫連接失敗，請聯絡機台負責人員";
            emit upload_notifyChanged();
            state = "1";
            emit upload_itemInfoChanged();
            return;
        }else{
            QTextStream out(&file);
            out << "Cmd=Unlock-"+box_ch+"\nEnd";
            file.close();
            QEventLoop loop;
            QTimer::singleShot(1000,&loop,SLOT(quit()));
            loop.exec();
            QFile file(statuPath);
            file.remove();
            QTimer::singleShot(1000,&loop,SLOT(quit()));
            loop.exec();
        }
        emit waitCloseChanged();
    }
    if(getFunction()==99){
        QString filePath="C:/Users/user/Desktop/cabinet/Control.txt";
        QString statuPath="C:/Users/user/Desktop/cabinet/Status.txt";
        QFile file(filePath);
        if(!file.open(QIODevice::WriteOnly|QIODevice::Text)){
            emit chooseChannelChanged();
            return;
        }else{
            QTextStream out(&file);
            out << "Cmd=Unlock-"+box_ch+"\nEnd";
            file.close();
            QEventLoop loop;
            QTimer::singleShot(1000,&loop,SLOT(quit()));
            loop.exec();
            QFile file(statuPath);
            file.remove();
            QTimer::singleShot(1000,&loop,SLOT(quit()));
            loop.exec();
            emit chooseChannelChanged();
        }
    }
}
void UI::upload_toChooseChannel(){
    notify = "";
    emit upload_notifyChanged();
    state = "0";
    emit upload_itemInfoChanged();
    state = "1";
    emit chooseChannelChanged();
}
void UI::signup_toChooseFunction(){
    state = "0";
    emit signupChanged();
    state = "1";
    emit chooseFunctionChanged();
}

void UI::chooseChannel_changeUser(){
    state = "0";
    emit chooseFunctionChanged();
    state = "1";
    emit changeUserChanged();
}
void UI::changeUser_toChooseFunction(){
    state = "0";
    emit changeUserChanged();
    state = "1";
    emit chooseFunctionChanged();
}

void UI::chooseChannel_forgetUser(){
    state = "0";
    emit chooseFunctionChanged();
    state = "1";
    emit forgetUserChanged();

}
void UI::forgetUser_toChooseFunction(){
    state = "0";
    emit forgetUserChanged();
    state = "1";
    emit chooseFunctionChanged();
}

void UI::thanksYou_toChooseChannel(){
    state = "0";
    emit thanksYouChanged();
    state = "1";
    emit chooseChannelChanged();

}
void UI::thanksYou_toHome(){
    state = "0";
    emit thanksYouChanged();
    state = "1";
    emit chooseFunctionChanged();

}


void UI::scanQrcode_toChooseChannel(){
    state = "0";
    emit scanQrcodeChanged();
    state = "1";
    emit chooseChannelChanged();
}

void UI::toLogin(){
    state = "0";
    emit chooseFunctionChanged();
    state = "1";
    emit loginChanged();
}

void UI::login_toChooseFunction(){
    state = "0";
    emit loginChanged();
    state = "1";
    emit chooseFunctionChanged();
}

void UI::chooseChannel_signup(){
    state = "0";
    emit chooseFunctionChanged();
    state = "1";
    emit signupChanged();
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
    if(functionHandler=="3"){
        setChannelState(0, 99);
        QSqlQuery query;
        query.prepare("SELECT box_ch FROM inchannel WHERE seller=?");
        query.addBindValue(userACC);
        query.exec();
        while (query.next()) {
            int box_ch = query.value(0).toInt();
            setChannelState(1, box_ch);
        }
    }
    if(functionHandler=="99"){
        setChannelState(1, 99);
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
    emit itemPriceChanged();
    scanQrcode_qrcode_text = "";
    emit scanQrcode_qrcodeChanged();
    if(!db_yunreserve.open()){
        return;
    }
    QSqlQuery query;
    query.prepare("SELECT id, item, price FROM inchannel WHERE box_ch=?");
    query.addBindValue(box_ch);
    query.exec();
    if(query.next()){
        item_ID = query.value(0).toString();
        item_Name = query.value(1).toString();
        item_Price = query.value(2).toString();
        itemInfo = item_Name;
        emit itemNameChanged();
        itemInfo = item_Price;
        emit itemPriceChanged();
    }
    db_yunreserve.close();

    QString id = QString("%1").arg(item_ID.toInt()%1000000, 6,10,QLatin1Char('0'));

    scanQrcode_qrcode_text = "TWQRP://藏藝點/158/01/V1?D1="+item_Price+"00&D2="+id+"&D3=AeHoYzwSULbZ&D10=901&D11=00,00400482497653500150010001;01,00400482497653500150010001";
    emit scanQrcode_qrcodeChanged();
}

bool UI::login_submit(QString acc, QString pwd){
    notify = "處理中 請稍號";
    emit login_notifyChanged();
    state = "2";
    emit loginChanged();
    QEventLoop eventLoop;
    QTimer::singleShot(50,&eventLoop,SLOT(quit()));
    eventLoop.exec();
    if(!db_yunreserve.open()){
        notify = "資料庫錯誤，請稍號在試";
        emit login_notifyChanged();
        state = "1";
        emit loginChanged();
        return false;
    }
    QRegularExpression re_acc("^\\w{6,12}$", QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_acc = re_acc.match(acc);
    QRegularExpression re_pwd("^\\w{6,12}$", QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_pwd = re_pwd.match(pwd);
    if(!match_acc.hasMatch()){
        notify = "帳號請輸入六碼英數組合";
        emit login_notifyChanged();
        db_yunreserve.close();
        state = "1";
        emit loginChanged();
        return false;
    }
    if(!match_pwd.hasMatch()){
        notify = "密碼請輸入六碼英數組合";
        emit login_notifyChanged();
        db_yunreserve.close();
        state = "1";
        emit loginChanged();
        return false;
    }
    QCryptographicHash *hash = new QCryptographicHash(QCryptographicHash::Sha256);
    hash->addData(pwd.toUtf8());
    QByteArray pwd_hash = hash->result().toHex();

    QSqlQuery query;
    query.prepare("SELECT name, email FROM account WHERE studentNumber=? AND pwd=?");
    query.addBindValue(acc);
    query.addBindValue(pwd_hash);
    query.exec();
    if(!query.next()){
        notify = "帳密錯誤，無法登入";
        emit login_notifyChanged();
        db_yunreserve.close();
        state = "1";
        emit loginChanged();
        return false;
    }
    notify = "";
    emit login_notifyChanged();
    userACC = acc;
    userName = query.value(0).toString();
    userEmail = query.value(1).toString();
    db_yunreserve.close();
    state = "0";
    emit loginChanged();
    state = "1";
    emit chooseChannelChanged();
    return true;
}

bool UI::upload_submit(QString item, QString price){
    notify = "處理中 請稍後";
    emit upload_notifyChanged();
    state = "2";
    emit upload_itemInfoChanged();
    QEventLoop eventLoop;
    QTimer::singleShot(50,&eventLoop,SLOT(quit()));
    eventLoop.exec();
    QRegularExpression re_item("^[\u4e00-\u9fa5a-zA-Z0-9]{1,18}$", QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_item = re_item.match(item);
    QRegularExpression re_price("^[1-9][0-9]{1,4}$", QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_price = re_price.match(price);
    if(!match_item.hasMatch()){
        notify = "商品名稱只能包含、中英數字";
        emit upload_notifyChanged();
        state = "1";
        emit upload_itemInfoChanged();
        return false;
    }
    if(!match_price.hasMatch()){
        notify = "請輸入數字（最低賣十元）";
        emit upload_notifyChanged();
        state = "1";
        emit upload_itemInfoChanged();
        return false;
    }
    if(!db_yunreserve.open()){
        notify = "資料庫連接失敗，請聯絡機台負責人員";
        emit upload_notifyChanged();
        state = "1";
        emit upload_itemInfoChanged();
        return false;
    }
    QString upload_dateTime = QDateTime::currentDateTime().toString("yyyyMMdd");
    QSqlQuery query(db_yunreserve);
    query.prepare("INSERT INTO inchannel(item,price,seller,box_ch,upload_dateTime,seller_name)"
                  "VALUES(:item,:price,:seller,:box_ch,:upload_dateTime,:seller_name)");
    query.bindValue(":item",item);
    query.bindValue(":price",price);
    query.bindValue(":seller",userACC);
    query.bindValue(":box_ch",box_ch);
    query.bindValue(":upload_dateTime",upload_dateTime);
    query.bindValue(":seller_name",userName);
    if(!query.exec()){
        notify = "資料庫連接失敗，請聯絡機台負責人員";
        emit upload_notifyChanged();
        db_yunreserve.close();
        state = "1";
        emit upload_itemInfoChanged();
        return false;
    }
    QString filePath="C:/Users/user/Desktop/cabinet/Control.txt";
    QString statuPath="C:/Users/user/Desktop/cabinet/Status.txt";
    QFile file(filePath);
    if(!file.open(QIODevice::WriteOnly|QIODevice::Text)){
        notify = "資料庫連接失敗，請聯絡機台負責人員";
        emit upload_notifyChanged();
        db_yunreserve.close();
        state = "1";
        emit upload_itemInfoChanged();
        return false;
    }else{
        QTextStream out(&file);
        out << "Cmd=Unlock-"+box_ch+"\nEnd";
        file.close();
        QEventLoop loop;
        QTimer::singleShot(1000,&loop,SLOT(quit()));
        loop.exec();
        QFile file(statuPath);
        file.remove();
        QTimer::singleShot(1000,&loop,SLOT(quit()));
        loop.exec();
    }
    notify = "";
    emit upload_notifyChanged();
    db_yunreserve.close();
    state = "0";
    emit upload_itemInfoChanged();
    state = "1";
    emit waitCloseChanged();
    item_Name = item;
    item_Price = price;
    return true;
}

bool UI::upload_sendMail(){
    QString upload_dateTime = QDateTime::currentDateTime().toString("yyyyMMdd");
    QNetworkAccessManager* manager = new QNetworkAccessManager();
    QNetworkRequest request;
    request.setUrl(QUrl("http://yunreserve.com/user/upload_notify"));
    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
    //post信箱
    QHttpPart emailPart;
    emailPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"emailPart\""));
    emailPart.setBody(userEmail.toUtf8());
    //post學號
    QHttpPart accPart;
    accPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"accPart\""));
    accPart.setBody(userACC.toUtf8());
    //post姓名
    QHttpPart namePart;
    namePart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"namePart\""));
    namePart.setBody(userName.toUtf8());
    //post商品名稱
    QHttpPart itemPart;
    itemPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"itemPart\""));
    itemPart.setBody(item_Name.toUtf8());
    //post價格
    QHttpPart pricePart;
    pricePart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"pricePart\""));
    pricePart.setBody(item_Price.toUtf8());
    //post上架日期
    QHttpPart dateTimePart;
    dateTimePart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"dateTimePart\""));
    dateTimePart.setBody(upload_dateTime.toUtf8());
    //post密碼
    QHttpPart pwdPart;
    pwdPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"pwdPart\""));
    pwdPart.setBody("OFA824976535001123");

    multiPart->append(emailPart);
    multiPart->append(accPart);
    multiPart->append(namePart);
    multiPart->append(itemPart);
    multiPart->append(pricePart);
    multiPart->append(dateTimePart);
    multiPart->append(pwdPart);

    QNetworkReply *pReply = manager->post(request, multiPart);
    QEventLoop eventLoop;
    QObject::connect(manager,&QNetworkAccessManager::finished,
                     &eventLoop,&QEventLoop::quit);
    eventLoop.exec();
    QByteArray bytes = pReply->readAll();
    QString strTMP = bytes;
    qDebug() << strTMP;
    pReply->deleteLater();
    return true;
}

bool UI::checkChannel(){
    QString filePath="C:/Users/user/Desktop/cabinet/Status.txt";
    QString statusPath="C:/Users/user/Desktop/cabinet/Status.txt";
    QFile file(filePath);
    if(!file.open(QIODevice::ReadOnly|QIODevice::Text)){
        qDebug() << "無法開啟檔案";
        return false;
    }else{
        while(!file.atEnd()){
            QByteArray line = file.readLine();
            QString str(line);
            qDebug() << str;
            if(str.mid(6,1)=="0"){
                file.close();
                QFile file(statusPath);
                file.remove();
                return false;
            }
        }
        state = "0";
        emit waitCloseChanged();
        state = "1";
        emit thanksYouChanged();
        return true;
    }
}

void UI::scanQrcode_PayMoney(){
    state = "2";
    emit scanQrcodeChanged();
    notify = "處理中 請稍後";
    emit scanQrcode_notifyChanged();
    QEventLoop loop;
    QTimer::singleShot(50,&loop,SLOT(quit()));
    loop.exec();

    db_yunreserve.setDatabaseName("xmlstorage");
    if(!db_yunreserve.open()){
        state = "1";
        emit scanQrcodeChanged();
        notify = "資料庫錯誤";
        emit scanQrcode_notifyChanged();
        return;
    }
    QString orderNumber = QString("%1").arg(item_ID.toInt()%1000000, 6,10,QLatin1Char('0'));
    QString orderPrice = QString("%1").arg(item_Price.toInt()*100, 12, 10, QLatin1Char('0'));
    QSqlQuery query;
    query.prepare("SELECT otherInfo FROM xmlPost_testing WHERE orderNumber=? AND amt=?");
    query.addBindValue(orderNumber);
    query.addBindValue(orderPrice);
    query.exec();
    if(!query.next()){
        db_yunreserve.close();
        db_yunreserve.setDatabaseName("yunreserve");
        state = "1";
        emit scanQrcodeChanged();
        notify = "您尚未付款";
        emit scanQrcode_notifyChanged();
        return;
    }
    QString otherInfo = query.value(0).toString();

    db_yunreserve.close();
    db_yunreserve.setDatabaseName("yunreserve");
    QJsonObject obj;
    QJsonDocument doc;
    if(otherInfo.length()!=0){
        doc = QJsonDocument::fromJson(otherInfo.toUtf8());
        if(doc.isObject()){
            obj = doc.object();
        }
    }
    if(obj["tag11"].toString()!="0000"){
        state = "1";
        emit scanQrcodeChanged();
        notify = "付款資訊有誤，請聯絡管理員";
        emit scanQrcode_notifyChanged();
        return;
    }
    if(!db_yunreserve.open()){
        state = "1";
        emit scanQrcodeChanged();
        notify = "資料庫錯誤";
        emit scanQrcode_notifyChanged();
        return;
    }
    query.prepare("DELETE FROM inchannel WHERE id=?");
    query.addBindValue(item_ID);
    if(!query.exec()){
        db_yunreserve.close();
        state = "1";
        emit scanQrcodeChanged();
        notify = "資料庫錯誤";
        emit scanQrcode_notifyChanged();
        return;
    }
    db_yunreserve.close();

    QString filePath="C:/Users/user/Desktop/cabinet/Control.txt";
    QString statuPath="C:/Users/user/Desktop/cabinet/Status.txt";
    QFile file(filePath);
    if(!file.open(QIODevice::WriteOnly|QIODevice::Text)){
        state = "1";
        emit scanQrcodeChanged();
        notify = "資料庫錯誤";
        emit scanQrcode_notifyChanged();
        return;
    }else{
        QTextStream out(&file);
        out << "Cmd=Unlock-"+box_ch+"\nEnd";
        file.close();
        QTimer::singleShot(1000,&loop,SLOT(quit()));
        loop.exec();
        QFile file(statuPath);
        file.remove();
        QTimer::singleShot(1000,&loop,SLOT(quit()));
        loop.exec();
    }
    state = "0";
    emit scanQrcodeChanged();
    state = "1";
    emit waitCloseChanged();
    notify = "";
    emit scanQrcode_notifyChanged();
}

void UI::admin(){
    if(!db_yunreserve.open()){
        return;
    }
    QSqlQuery query;
    query.prepare("SELECT * FROM admin WHERE id=\"1\" AND handler=\"1\"");
    if(!query.exec()){
        db_yunreserve.close();
        return;
    }
    if(query.next()){
        setFunction("99");
        state = "0";
        emit chooseFunctionChanged();
        state = "1";
        emit chooseChannelChanged();
    }
    db_yunreserve.close();
}
