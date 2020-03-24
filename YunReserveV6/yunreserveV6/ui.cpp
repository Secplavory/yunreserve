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

    welcome_state = "1";
    state = "0";
    busyIndicator_state = 0;
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
        busyIndicator_state = 1;
        emit BusyIndicatorChanged();
        QNetworkAccessManager* manager = new QNetworkAccessManager();
        QNetworkRequest request;
        request.setUrl(QUrl("http://yunreserve.com/machineFunction/takeOFF"));
        QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
        //securityCode
        QHttpPart securityCode;
        securityCode.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"securityCode\""));
        securityCode.setBody("up42j4g8g.3");
        //securityCode
        QHttpPart accPart;
        accPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"accPart\""));
        accPart.setBody(userACC.toUtf8());
        //securityCode
        QHttpPart boxChannelPart;
        boxChannelPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"boxChannelPart\""));
        boxChannelPart.setBody(box_ch.toUtf8());

        multiPart->append(securityCode);
        multiPart->append(accPart);
        multiPart->append(boxChannelPart);

        QNetworkReply *pReply = manager->post(request, multiPart);
        QEventLoop eventLoop;
        QObject::connect(manager,&QNetworkAccessManager::finished,
                         &eventLoop,&QEventLoop::quit);
        eventLoop.exec();
        QByteArray bytes = pReply->readAll();
        QString strTMP = bytes;

        QStringList channel_list = strTMP.split(",");
        qDebug() << strTMP;
        if(strTMP!="1"){
            busyIndicator_state = 0;
            emit BusyIndicatorChanged();
            emit chooseChannelChanged();
            return ;
        }
        QString filePath="C:/Users/user/Desktop/cabinet/Control.txt";
        QString statuPath="C:/Users/user/Desktop/cabinet/Status.txt";
        QFile file(filePath);
        if(!file.open(QIODevice::WriteOnly|QIODevice::Text)){
            state = "1";
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
        }
        emit waitCloseChanged();
        busyIndicator_state = 0;
        emit BusyIndicatorChanged();
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
    busyIndicator_state = 1;
    emit BusyIndicatorChanged();
    if(functionHandler=="1"){
        setChannelState(0, 99);
        QNetworkAccessManager* manager = new QNetworkAccessManager();
        QNetworkRequest request;
        request.setUrl(QUrl("http://yunreserve.com/machineFunction/checkChannel"));
        QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
        //securityCode
        QHttpPart securityCode;
        securityCode.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"securityCode\""));
        securityCode.setBody("up42j4g8g.3");

        multiPart->append(securityCode);

        QNetworkReply *pReply = manager->post(request, multiPart);
        QEventLoop eventLoop;
        QObject::connect(manager,&QNetworkAccessManager::finished,
                         &eventLoop,&QEventLoop::quit);
        eventLoop.exec();
        QByteArray bytes = pReply->readAll();
        QString strTMP = bytes;

        QStringList channel_list = strTMP.split(",");

        for(int i=0;i<channel_list.size();i++){
            qDebug() << channel_list[i];
            setChannelState(1, channel_list[i].toInt());
        }
        busyIndicator_state = 0;
        emit BusyIndicatorChanged();
    }
    if(functionHandler=="2"){
        setChannelState(1, 99);
        QNetworkAccessManager* manager = new QNetworkAccessManager();
        QNetworkRequest request;
        request.setUrl(QUrl("http://yunreserve.com/machineFunction/checkChannel"));
        QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
        //securityCode
        QHttpPart securityCode;
        securityCode.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"securityCode\""));
        securityCode.setBody("up42j4g8g.3");

        multiPart->append(securityCode);

        QNetworkReply *pReply = manager->post(request, multiPart);
        QEventLoop eventLoop;
        QObject::connect(manager,&QNetworkAccessManager::finished,
                         &eventLoop,&QEventLoop::quit);
        eventLoop.exec();
        QByteArray bytes = pReply->readAll();
        QString strTMP = bytes;

        QStringList channel_list = strTMP.split(",");

        for(int i=0;i<channel_list.size();i++){
            qDebug() << channel_list[i];
            setChannelState(0, channel_list[i].toInt());
        }
        busyIndicator_state = 0;
        emit BusyIndicatorChanged();
    }
    if(functionHandler=="3"){
        setChannelState(0, 99);
        QNetworkAccessManager* manager = new QNetworkAccessManager();
        QNetworkRequest request;
        request.setUrl(QUrl("http://yunreserve.com/machineFunction/checkChannel"));
        QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
        //securityCode
        QHttpPart securityCode;
        securityCode.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"securityCode\""));
        securityCode.setBody("up42j4g8g.3");
        //acc
        QHttpPart acc;
        acc.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"acc\""));
        acc.setBody(userACC.toUtf8());

        multiPart->append(securityCode);
        multiPart->append(acc);

        QNetworkReply *pReply = manager->post(request, multiPart);
        QEventLoop eventLoop;
        QObject::connect(manager,&QNetworkAccessManager::finished,
                         &eventLoop,&QEventLoop::quit);
        eventLoop.exec();
        QByteArray bytes = pReply->readAll();
        QString strTMP = bytes;

        QStringList channel_list = strTMP.split(",");

        for(int i=0;i<channel_list.size();i++){
            qDebug() << channel_list[i];
            setChannelState(1, channel_list[i].toInt());
        }
        busyIndicator_state = 0;
        emit BusyIndicatorChanged();
    }
    if(functionHandler=="99"){
        setChannelState(1, 99);
        busyIndicator_state = 0;
        emit BusyIndicatorChanged();
    }
    busyIndicator_state = 0;
    emit BusyIndicatorChanged();
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

    QNetworkAccessManager* manager = new QNetworkAccessManager();
    QNetworkRequest request;
    request.setUrl(QUrl("http://yunreserve.com/machineFunction/itemInfo"));
    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
    //securityCode
    QHttpPart securityCode;
    securityCode.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"securityCode\""));
    securityCode.setBody("up42j4g8g.3");
    //box_ch
    QHttpPart box_chPart;
    box_chPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"boxChannel\""));
    box_chPart.setBody(box_ch.toUtf8());

    multiPart->append(securityCode);
    multiPart->append(box_chPart);

    QNetworkReply *pReply = manager->post(request, multiPart);
    QObject::connect(manager,&QNetworkAccessManager::finished,
                     &eventLoop,&QEventLoop::quit);
    eventLoop.exec();
    QByteArray bytes = pReply->readAll();
    QString strTMP = bytes;

    QStringList channel_list = strTMP.split(",");
    qDebug() << strTMP;
    item_ID = channel_list[0];
    item_Name = channel_list[1];
    item_Price = channel_list[2];
    itemInfo = item_Name;
    emit itemNameChanged();
    itemInfo = item_Price;
    emit itemPriceChanged();

    QString id = QString("%1").arg(item_ID.toInt()%1000000, 6,10,QLatin1Char('0'));

    scanQrcode_qrcode_text = "image://colors/TWQRP://藏藝點/158/01/V1?D1="+item_Price+"00&D2="+id+"&D3=AeHoYzwSULbZ&D10=901&D11=00,00400482497653500150010001;01,00400482497653500150010001";
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
    QRegularExpression re_acc("^\\w{6,18}$", QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_acc = re_acc.match(acc);
    QRegularExpression re_pwd("^\\w{6,12}$", QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_pwd = re_pwd.match(pwd);
    if(!match_acc.hasMatch()){
        notify = "帳號請輸入六碼英數組合";
        emit login_notifyChanged();
        state = "1";
        emit loginChanged();
        return false;
    }
    if(!match_pwd.hasMatch()){
        notify = "密碼請輸入六碼英數組合";
        emit login_notifyChanged();
        state = "1";
        emit loginChanged();
        return false;
    }
    QCryptographicHash *hash = new QCryptographicHash(QCryptographicHash::Sha256);
    hash->addData(pwd.toUtf8());
    QByteArray pwd_hash = hash->result().toHex();

    QNetworkAccessManager* manager = new QNetworkAccessManager();
    QNetworkRequest request;
    request.setUrl(QUrl("http://yunreserve.com/machineFunction/login"));
    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
    //securityCode
    QHttpPart securityCode;
    securityCode.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"securityCode\""));
    securityCode.setBody("up42j4g8g.3");
    //acc
    QHttpPart acc_part;
    acc_part.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"acc\""));
    acc_part.setBody(acc.toUtf8());
    //pwd
    QHttpPart pwd_part;
    pwd_part.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"pwd\""));
    pwd_part.setBody(pwd_hash);

    multiPart->append(securityCode);
    multiPart->append(acc_part);
    multiPart->append(pwd_part);

    QNetworkReply *pReply = manager->post(request, multiPart);
    QObject::connect(manager,&QNetworkAccessManager::finished,
                     &eventLoop,&QEventLoop::quit);
    eventLoop.exec();
    QByteArray bytes = pReply->readAll();
    QString strTMP = bytes;
    qDebug()<<strTMP;

    QStringList channel_list = strTMP.split(",");
    if(channel_list[2]!="true"){
        notify = "帳密錯誤，無法登入";
        emit login_notifyChanged();
        state = "1";
        emit loginChanged();
        return false;
    }

    notify = "";
    emit login_notifyChanged();
    userACC = acc;
    userPWD = pwd;
    userName = channel_list[0];
    userEmail = channel_list[1];
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
    QString upload_dateTime = QDateTime::currentDateTime().toString("yyyyMMdd");

    QNetworkAccessManager* manager = new QNetworkAccessManager();
    QNetworkRequest request;
    request.setUrl(QUrl("http://yunreserve.com/machineFunction/upload"));
    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
    //securityCode
    QHttpPart securityCode;
    securityCode.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"securityCode\""));
    securityCode.setBody("up42j4g8g.3");
    //item
    QHttpPart itemPart;
    itemPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"item\""));
    itemPart.setBody(item.toUtf8());
    //price
    QHttpPart pricePart;
    pricePart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"price\""));
    qDebug()<< price;
    pricePart.setBody(price.toUtf8());
    //seller
    QHttpPart sellerPart;
    sellerPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"seller\""));
    sellerPart.setBody(userACC.toUtf8());
    //box_ch
    QHttpPart box_chPart;
    box_chPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"boxChannel\""));
    qDebug()<< box_ch;
    box_chPart.setBody(box_ch.toUtf8());
    //upload_dateTime
    QHttpPart upload_dateTimePart;
    upload_dateTimePart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"uploaddateTime\""));
    upload_dateTimePart.setBody(upload_dateTime.toUtf8());
    //seller_name
    QHttpPart seller_namePart;
    seller_namePart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"sellername\""));
    seller_namePart.setBody(userName.toUtf8());

    multiPart->append(securityCode);
    multiPart->append(itemPart);
    multiPart->append(pricePart);
    multiPart->append(sellerPart);
    multiPart->append(box_chPart);
    multiPart->append(upload_dateTimePart);
    multiPart->append(seller_namePart);


    QNetworkReply *pReply = manager->post(request, multiPart);
    QObject::connect(manager,&QNetworkAccessManager::finished,
                     &eventLoop,&QEventLoop::quit);
    eventLoop.exec();
    QByteArray bytes = pReply->readAll();
    QString strTMP = bytes;

    QStringList channel_list = strTMP.split(",");
    qDebug()<<strTMP;

    if(strTMP!="1"){
        notify = "資料庫連接失敗，請聯絡機台負責人員";
        emit upload_notifyChanged();
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

    QString orderNumber = QString("%1").arg(item_ID.toInt()%1000000, 6,10,QLatin1Char('0'));
    QString orderPrice = QString("%1").arg(item_Price.toInt()*100, 12, 10, QLatin1Char('0'));

    QNetworkAccessManager* manager = new QNetworkAccessManager();
    QNetworkRequest request;
    request.setUrl(QUrl("http://yunreserve.com/machineFunction/checkPayment"));
    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
    //securityCode
    QHttpPart securityCode;
    securityCode.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"securityCode\""));
    securityCode.setBody("up42j4g8g.3");
    //orderNumber
    QHttpPart orderNumberPart;
    orderNumberPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"orderNumber\""));
    orderNumberPart.setBody(orderNumber.toUtf8());
    //orderPrice
    QHttpPart orderPricePart;
    orderPricePart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"orderPrice\""));
    orderPricePart.setBody(orderPrice.toUtf8());

    multiPart->append(securityCode);
    multiPart->append(orderNumberPart);
    multiPart->append(orderPricePart);

    QNetworkReply *pReply = manager->post(request, multiPart);
    QEventLoop eventLoop;
    QObject::connect(manager,&QNetworkAccessManager::finished,
                     &eventLoop,&QEventLoop::quit);
    eventLoop.exec();
    QByteArray bytes = pReply->readAll();
    QString strTMP = bytes;

    QStringList channel_list = strTMP.split(",");

    qDebug() << strTMP;

    if(strTMP=="0"){
        state = "1";
        emit scanQrcodeChanged();
        notify = "您尚未付款";
        emit scanQrcode_notifyChanged();
        return;
    }
    if(strTMP=="2"){
        state = "1";
        emit scanQrcodeChanged();
        notify = "付款系統錯誤，請通知負責人";
        emit scanQrcode_notifyChanged();
        return;
    }
    if(strTMP!="1"){
        state = "1";
        emit scanQrcodeChanged();
        notify = "例外錯誤，請通知負責人";
        emit scanQrcode_notifyChanged();
        return;
    }
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
    QNetworkAccessManager* manager = new QNetworkAccessManager();
    QNetworkRequest request;
    request.setUrl(QUrl("http://yunreserve.com/machineFunction/admin_control"));
    QNetworkReply *pReply = manager->get(request);
    QEventLoop eventLoop;
    QObject::connect(manager,&QNetworkAccessManager::finished,
                     &eventLoop,&QEventLoop::quit);
    eventLoop.exec();
    QByteArray bytes = pReply->readAll();
    QString strTMP = bytes;

    if(strTMP=="1"){
        setFunction("99");
        state = "0";
        emit chooseFunctionChanged();
        state = "1";
        emit chooseChannelChanged();
    }
}
