#include "ui.h"

UI::UI(QObject *parent) : QObject(parent)
{
    widgetVisible = "0";
    welcomeVisible_Text = "1";
    itemVisible = "0";
    boxState = "0";


    itemQRcode_Text = "";
    login_signup_Text_text = "";
    upload_ItemInfo_notify_Text = "";
    forgetUser_notify_Text = "";
    updateUser_notify_Text = "";
    updateItem_notify_Text = "";
    choseChannel_notifyText_Text = "";

}

void UI::initWidget(){
    widgetVisible = "0";
    welcomeVisible_Text = "0";
    emit welcomeVisibleChanged();
    emit chooseFunctionVisibleChanged();
    emit choseChannelVisibleChanged();
    emit perchase_PayingVisibleChanged();
    emit waitForCloseVisibleChanged();
    emit thanksForPerchaseVisibleChanged();
    emit login_signupVisibleChanged();
    emit upload_ItemInfoVisibleChanged();
    emit upload_thankYouVisibleChanged();
    emit takeOff_thankYouVisibleChanged();
    emit updateItem_thankYouVisibleChanged();
    emit signup_thankYouVisibleChanged();
    emit updateUserVisibleChanged();
    emit updateItemVisibleChanged();
    emit forgetUserVisibleChanged();
    emit forgetUser_thankYouVisibleChanged();
    emit updateUser_thankYouVisibleChanged();
}

void UI::initText(){
    login_signup_Text_text = "";
    upload_ItemInfo_notify_Text = "";
    forgetUser_notify_Text = "";
    updateUser_notify_Text = "";
    updateItem_notify_Text = "";
    choseChannel_notifyText_Text = "";

    emit login_signup_TextChanged();
    emit upload_ItemInfo_notifyChanged();
    emit forgetUser_notifyChanged();
    emit updateUser_notifyChanged();
    emit updateItem_notifyChanged();
    emit choseChannel_notifyTextChanged();
}

void UI::initBox(QString i){
    boxState = i;
    emit ch1StateChanged();
    emit ch2StateChanged();
    emit ch3StateChanged();
    emit ch4StateChanged();
    emit ch5StateChanged();
    emit ch6StateChanged();
    emit ch7StateChanged();
    emit ch8StateChanged();
    emit ch9StateChanged();
    emit ch10StateChanged();
    emit ch11StateChanged();
    emit ch12StateChanged();
    emit ch13StateChanged();
    emit ch14StateChanged();
    emit ch15StateChanged();
    emit ch16StateChanged();
    emit ch17StateChanged();
    emit ch18StateChanged();
    emit ch19StateChanged();
    emit ch20StateChanged();
    emit ch21StateChanged();
    emit ch22StateChanged();
    emit ch23StateChanged();
    emit ch24StateChanged();
    emit ch25StateChanged();
    emit ch26StateChanged();
    emit ch27StateChanged();
    emit ch28StateChanged();
}

void UI::reset(){
    initText();
    initWidget();
    welcomeVisible_Text = "1";
    emit welcomeVisibleChanged();
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

    setChannelVisible();

    widgetVisible = "1";
    emit choseChannelVisibleChanged();
}

void UI::setBox_ch(int i){
    box_ch = i;
}

void UI::execFunction(){
    choseChannel_notifyText_Text = "處理中 請稍後";
    emit choseChannel_notifyTextChanged();
    widgetVisible = "2";
    emit choseChannelVisibleChanged();
    QEventLoop loop;
    QTimer::singleShot(0,&loop,SLOT(quit()));
    loop.exec();
    if(functionHandler==1) {
        widgetVisible = "0";
        emit choseChannelVisibleChanged();
        widgetVisible = "1";
        emit perchase_PayingVisibleChanged();
    }
    if(functionHandler==2){
        widgetVisible = "0";
        emit choseChannelVisibleChanged();
        widgetVisible = "1";
        emit upload_ItemInfoVisibleChanged();
    }
    if(functionHandler==3){
        widgetVisible = "0";
        emit choseChannelVisibleChanged();
        widgetVisible = "1";
        emit updateItemVisibleChanged();
    }
    if(functionHandler==4){
        controlChannel *cc = new controlChannel();
        if(!cc->openChannel(box_ch)){
            choseChannel_notifyText_Text = "未預期錯誤，無法開啟櫃子，請聯絡負責人員";
            emit choseChannel_notifyTextChanged();
            return ;
        }
        QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
        db.setHostName("127.0.0.1");
        db.setUserName("root");
        db.setPassword("up42j4g8g.3");
        db.setDatabaseName("yunreserve");
        if(!db.open()){
            qDebug("資料庫連接失敗!!!!!");
            return ;
        }
        QSqlQuery query(db);
        query.prepare("DELETE FROM inchannel WHERE box_ch=?");
        query.addBindValue(box_ch);
        if(!query.exec()){
            return;
        }
        widgetVisible = "0";
        emit choseChannelVisibleChanged();
        widgetVisible = "1";
        emit waitForCloseVisibleChanged();
    }
    choseChannel_notifyText_Text = "";
    emit choseChannel_notifyTextChanged();
}

void UI::displayQRcode(){
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("127.0.0.1");
    db.setUserName("root");
    db.setPassword("up42j4g8g.3");
    db.setDatabaseName("yunreserve");
    if(!db.open()){
        qDebug("資料庫連接失敗!!!!!");
        return ;
    }
    QSqlQuery query(db);
    query.prepare("SELECT id,item,price,remark,seller,email,bankACC "
                  "FROM inchannel WHERE box_ch=?");
    query.addBindValue(box_ch);
    query.exec();
    if(!query.next()){
        qDebug()<<"無";
        return;
    }
    itemID = query.value(0).toString();
    itemName = query.value(1).toString();
    itemPrice = query.value(2).toString();
    itemRemark = query.value(3).toString();
    itemSeller = query.value(4).toString();
    itemEmail = query.value(5).toString();
    itemBankACC = query.value(6).toString();

    QString id = QString("%1").arg(itemID.toInt()%1000000, 6,10,QLatin1Char('0'));
//    itemQRcode_Text = "TWQRP://芯生文創/158/01/V1?D1="+itemPrice+"00&D2="+id+"&D3=AcDtT2zBCHtp&D10=901&D11=00,00400482497653500150010001;01,00400482497653500150010001";
        itemQRcode_Text = "TWQRP://芯生文創/158/01/V1?D1="+itemPrice+"0000000&D2="+id+"&D3=AcDtT2zBCHtp&D10=901&D11=00,00400482497653500150010001;01,00400482497653500150010001";
    emit itemQRcodeChanged();
}

void UI::displayItemInfo(){
    emit itemNameDisplayChanged();
    emit itemPriceDisplayChanged();
    emit itemRemarkDisplayChanged();
}

void UI::setChannelVisible(){
    QEventLoop loop;
    QTimer::singleShot(0,&loop,SLOT(quit()));
    loop.exec();
    if (functionHandler==1) {
        initBox("0");
        setChannelVisible_query("1","None");
    }
    if(functionHandler==2){
        initBox("1");
        setChannelVisible_query("0","None");
    }
    if(functionHandler==3){
        initBox("0");
        setChannelVisible_query("1",userName);
    }

    if(functionHandler==4){
        initBox("0");
        setChannelVisible_query("1",userName);
    }
}

void UI::setChannelVisible_query(QString i,QString seller){
    boxState = i;
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("127.0.0.1");
    db.setUserName("root");
    db.setPassword("up42j4g8g.3");
    db.setDatabaseName("yunreserve");
    if(!db.open()){
        qDebug("資料庫連接失敗!!!!!");
        return ;
    }
    if(seller=="None"){
        QSqlQuery query(db);
        query.prepare("SELECT box_ch FROM inchannel");
        query.exec();
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
            case 13:
            emit ch13StateChanged();
            break;
            case 14:
            emit ch14StateChanged();
            break;
            case 15:
            emit ch15StateChanged();
            break;
            case 16:
            emit ch16StateChanged();
            break;
            case 17:
            emit ch17StateChanged();
            break;
            case 18:
            emit ch18StateChanged();
            break;
            case 19:
            emit ch19StateChanged();
            break;
            case 20:
            emit ch20StateChanged();
            break;
            case 21:
            emit ch21StateChanged();
            break;
            case 22:
            emit ch22StateChanged();
            break;
            case 23:
            emit ch23StateChanged();
            break;
            case 24:
            emit ch24StateChanged();
            break;
            case 25:
            emit ch25StateChanged();
            break;
            case 26:
            emit ch26StateChanged();
            break;
            case 27:
            emit ch27StateChanged();
            break;
            case 28:
            emit ch28StateChanged();
            break;
            }
        }
    }else{
        QSqlQuery query(db);
        query.prepare("SELECT box_ch FROM inchannel WHERE seller=?");
        query.addBindValue(userName);
        query.exec();
        while(query.next()){
            switch(query.value(0).toInt()){
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
            case 13:
            emit ch13StateChanged();
            break;
            case 14:
            emit ch14StateChanged();
            break;
            case 15:
            emit ch15StateChanged();
            break;
            case 16:
            emit ch16StateChanged();
            break;
            case 17:
            emit ch17StateChanged();
            break;
            case 18:
            emit ch18StateChanged();
            break;
            case 19:
            emit ch19StateChanged();
            break;
            case 20:
            emit ch20StateChanged();
            break;
            case 21:
            emit ch21StateChanged();
            break;
            case 22:
            emit ch22StateChanged();
            break;
            case 23:
            emit ch23StateChanged();
            break;
            case 24:
            emit ch24StateChanged();
            break;
            case 25:
            emit ch25StateChanged();
            break;
            case 26:
            emit ch26StateChanged();
            break;
            case 27:
            emit ch27StateChanged();
            break;
            case 28:
            emit ch28StateChanged();
            break;
            }
        }
    }
}


void UI::checkPayment(){
    DB *db = new DB();
    controlChannel *cc = new controlChannel();
//    if(db->checkPayment(box_ch)){
    if(true){
//        if(true){
//            return;
//        }
        if(!cc->openChannel(box_ch)){
            qDebug()<< "格子開啟失敗";
            return;
        }
        QSqlDatabase sql = QSqlDatabase::addDatabase("QMYSQL");
        sql.setHostName("127.0.0.1");
        sql.setUserName("root");
        sql.setPassword("up42j4g8g.3");
        sql.setDatabaseName("yunreserve");
        if(!sql.open()){
            qDebug("資料庫連接失敗!!!");
            return;
        }
        QSqlQuery query(sql);
        query.prepare("SELECT * FROM inchannel WHERE box_ch=?");
        query.addBindValue(box_ch);
        query.exec();
        if(!query.next()){
            qDebug()<< "資料庫無資料";
            return;
        }
        QString item = query.value(1).toString();
        QString price = query.value(2).toString();
        QString remark = query.value(3).toString();
        QString seller = query.value(4).toString();
        QString email = query.value(5).toString();
        QString bankACC = query.value(6).toString();
        query.prepare("INSERT INTO transaction_history(item,price,remark,seller,email,bankACC,box_ch)"
                      "VALUES(:item,:price,:remark,:seller,:email,:bankACC,:box_ch)");
        query.bindValue(":item",item);
        query.bindValue(":price",price);
        query.bindValue(":remark",remark);
        query.bindValue(":seller",seller);
        query.bindValue(":email",email);
        query.bindValue(":bankACC",bankACC);
        query.bindValue(":box_ch",box_ch);
        if(!query.exec()){
            qDebug()<< "資料庫無法存取";
            return;
        }
        query.prepare("DELETE FROM inchannel WHERE box_ch = ?");
        query.addBindValue(box_ch);
        if(!query.exec()){
            qDebug()<< "無法刪除資料";
            return;
        }
        widgetVisible = "0";
        emit perchase_PayingVisibleChanged();
        widgetVisible = "1";
        emit waitForCloseVisibleChanged();
    }else{

    }
}

void UI::checkChannel(){
    controlChannel *cc = new controlChannel();
    if(cc->checkChannel()){
        if(functionHandler==1){
            widgetVisible = "0";
            emit waitForCloseVisibleChanged();
            widgetVisible = "1";
            emit thanksForPerchaseVisibleChanged();
        }
        if(functionHandler==2){
            widgetVisible = "0";
            emit waitForCloseVisibleChanged();
            widgetVisible = "1";
            emit upload_thankYouVisibleChanged();
        }
        if(functionHandler==4){
            widgetVisible = "0";
            emit waitForCloseVisibleChanged();
            widgetVisible = "1";
            emit takeOff_thankYouVisibleChanged();
        }
    }
}

void UI::login_signup(){
    widgetVisible = "0";
    emit chooseFunctionVisibleChanged();
    widgetVisible = "1";
    emit login_signupVisibleChanged();
}

void UI::login(){
    itemVisible = "0";
    emit signup_ItemVisibleChanged();
    login_signup_Text_text = "";
    emit login_signup_TextChanged();
    itemVisible = "1";
    emit login_ItemVisibleChanged();
}

void UI::signup(){
    itemVisible = "0";
    emit login_ItemVisibleChanged();
    login_signup_Text_text = "";
    emit login_signup_TextChanged();
    itemVisible = "1";
    emit signup_ItemVisibleChanged();
}

void UI::getUser(QString acc, QString pwd){
    login_signup_Text_text="處理中 請稍後";
    emit login_signup_TextChanged();
    QEventLoop loop;
    QTimer::singleShot(0,&loop,SLOT(quit()));
    loop.exec();
    if(acc.length()<6){
        login_signup_Text_text="帳號至少六位數";
        emit login_signup_TextChanged();
        return;
    }
    if(pwd.length()<6){
        login_signup_Text_text="密碼至少六位數";
        emit login_signup_TextChanged();
        return;
    }
    QRegularExpression re_acc("^[0-9a-zA-Z]+$",QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_acc = re_acc.match(acc);
    QRegularExpression re_pwd("^[0-9a-zA-Z]+$",QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_pwd = re_pwd.match(pwd);
    if(!match_acc.hasMatch()){
        login_signup_Text_text="帳號請輸入英數";
        emit login_signup_TextChanged();
        return;
    }
    if(!match_pwd.hasMatch()){
        login_signup_Text_text="密碼請輸入英數";
        emit login_signup_TextChanged();
        return;
    }

    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("127.0.0.1");
    db.setUserName("root");
    db.setPassword("up42j4g8g.3");
    db.setDatabaseName("yunreserve");
    if(!db.open()){
        qDebug("資料庫連接失敗!!!!!");
        login_signup_Text_text = "資料庫無法開啟";
        emit login_signup_TextChanged();
        return ;
    }
    QSqlQuery query(db);
    query.prepare("SELECT studentNumber,bankACC,email,verified FROM account WHERE studentNumber=? AND pwd=?");
    query.addBindValue(acc);
    query.addBindValue(pwd);
    query.exec();
    if(!query.next()){
        login_signup_Text_text="帳號密碼錯誤";
        emit login_signup_TextChanged();
        return;
    }
    userName = query.value(0).toString();
    userBank = query.value(1).toString();
    userEmail = query.value(2).toString();
    userVerified = query.value(3).toString();
    if(userVerified=="0" && functionHandler!=5){
        login_signup_Text_text="帳號尚未驗證\n"
                               "請查看email並驗證帳號";
        emit login_signup_TextChanged();
        return;
    }
    widgetVisible = "0";
    emit login_signupVisibleChanged();
    QTimer::singleShot(0,&loop,SLOT(quit()));
    loop.exec();
    setChannelVisible();

    if(functionHandler==2){
        widgetVisible = "1";
        emit choseChannelVisibleChanged();
    }
    if(functionHandler==3){
        widgetVisible = "1";
        emit choseChannelVisibleChanged();
    }
    if(functionHandler==4){
        widgetVisible = "1";
        emit choseChannelVisibleChanged();
    }
    if(functionHandler==5){
        widgetVisible = "1";
        emit updateUserVisibleChanged();
    }
}

void UI::signupSubmit(QString acc,QString pwd, QString bank,QString email,QString ensureEmail,QString bankCode,QString phoneNum){
    login_signup_Text_text = "處理中請稍後";
    emit login_signup_TextChanged();
    QEventLoop loop;
    QTimer::singleShot(0,&loop,SLOT(quit()));
    loop.exec();
    qsrand(QTime(0,0,0).secsTo(QTime::currentTime()));
    QString verifyCode = QString("%1").arg(qrand()%(9999+1),4,10,QLatin1Char('0'));
    verifyCode += QString("%1").arg(qrand()%(9999+1),4,10,QLatin1Char('0'));
    verifyCode += QString("%1").arg(qrand()%(99+1),2,10,QLatin1Char('0'));
    QString sysDateTime = QDateTime::currentDateTime().toString("yyyyMMdd");

    if(acc.length()<6 || acc.length()>18){
        login_signup_Text_text = "帳號需於6到18位數之間";
        emit login_signup_TextChanged();
        widgetVisible = "1";
        emit login_signupVisibleChanged();
        return;
    }
    QRegularExpression re_acc("^[0-9a-zA-Z]+$",QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_acc = re_acc.match(acc);
    if(!match_acc.hasMatch()){
        login_signup_Text_text = "帳號必須由英文與數字組成";
        emit login_signup_TextChanged();
        return;
    }
    if(pwd.length()<6 || pwd.length()>12){
        login_signup_Text_text = "密碼需於6到12位數之間";
        emit login_signup_TextChanged();
        widgetVisible = "1";
        emit login_signupVisibleChanged();
        return;
    }
    QRegularExpression re_pwd("^[0-9a-zA-Z]+$",QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_pwd = re_pwd.match(pwd);
    if(!match_pwd.hasMatch()){
        login_signup_Text_text = "密碼必須由英文與數字組成";
        emit login_signup_TextChanged();
        return;
    }
    QRegularExpression re_mail1("^[a-zA-Z0-9.]+@[a-zA-Z0-9.]+$",QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_mail1 = re_mail1.match(email);
    if(!match_mail1.hasMatch()){
        login_signup_Text_text = "email欄位請輸入正確格式";
        emit login_signup_TextChanged();
        return;
    }
    QRegularExpression re_mail("^[a-zA-Z0-9]+@(gemail.yuntech.edu.tw|gmail.com)$",QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_mail = re_mail.match(email);
    if(!match_mail.hasMatch()){
        qDebug() << "不吻合";
        login_signup_Text_text = "email格式錯誤,需要使用google_email\n@gmail.com或@gemail.yuntech.edu.tw";
        emit login_signup_TextChanged();
        widgetVisible = "1";
        emit login_signupVisibleChanged();
        return ;
    }
    if(ensureEmail != email){
        login_signup_Text_text = "郵件確認錯誤";
        emit login_signup_TextChanged();
        widgetVisible = "1";
        emit login_signupVisibleChanged();
        return;
    }
    QRegularExpression re_bank("^[0-9]+$",QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_bank = re_bank.match(bank);
    if(!match_bank.hasMatch()){
        login_signup_Text_text = "銀行帳號為數字欄位";
        emit login_signup_TextChanged();
        return;
    }
    QRegularExpression re_bankCode("^[0-9]{3}$",QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_bankCode = re_bankCode.match(bankCode);
    if(!match_bankCode.hasMatch()){
        login_signup_Text_text = "銀行代碼為數字欄位\n請輸入三位數代碼";
        emit login_signup_TextChanged();
        return;
    }
    QRegularExpression re_phone("^[0-9]+$",QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_phone = re_phone.match(phoneNum);
    if(!match_phone.hasMatch()){
        login_signup_Text_text = "電話號碼為數字欄位";
        emit login_signup_TextChanged();
        return;
    }

    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("127.0.0.1");
    db.setUserName("root");
    db.setPassword("up42j4g8g.3");
    db.setDatabaseName("yunreserve");
    if(!db.open()){
        login_signup_Text_text = "資料庫錯誤";
        emit login_signup_TextChanged();
        widgetVisible = "1";
        emit login_signupVisibleChanged();
        return ;
    }
    QSqlQuery query(db);

    query.prepare("SELECT * FROM account WHERE studentNumber=?");
    query.addBindValue(acc);
    query.exec();
    if(query.next()){
        login_signup_Text_text = "帳號已被註冊";
        emit login_signup_TextChanged();
        widgetVisible = "1";
        emit login_signupVisibleChanged();
        return ;
    }
    query.prepare("SELECT * FROM account WHERE email=?");
    query.addBindValue(email);
    query.exec();
    if(query.next()){
        login_signup_Text_text = "電子郵件已經被註冊";
        emit login_signup_TextChanged();
        widgetVisible = "1";
        emit login_signupVisibleChanged();
        return ;
    }
    query.prepare("INSERT INTO account (studentNumber,pwd,bankACC,email,verified,verifyCode,bankCode,phoneNum,sysDateTime)"
                  "VALUES(:studentNumber,:pwd,:bankACC,:email,:verified,:verifyCode,:bankCode,:phoneNum,:sysDateTime)");
    query.bindValue(":studentNumber",acc);
    query.bindValue(":pwd",pwd);
    query.bindValue(":bankACC",bank);
    query.bindValue(":email",email);
    query.bindValue(":verified",0);
    query.bindValue(":verifyCode",verifyCode);
    query.bindValue(":bankCode",bankCode);
    query.bindValue(":phoneNum",phoneNum);
    query.bindValue(":sysDateTime",sysDateTime);
    if(!query.exec()){
        login_signup_Text_text = "資料庫錯誤，請聯絡負責人員";
        emit login_signup_TextChanged();
        widgetVisible = "1";
        emit login_signupVisibleChanged();
        return;
    }

    QNetworkAccessManager* manager = new QNetworkAccessManager();
    QNetworkRequest request;
    request.setUrl(QUrl("http://sinshengcci.com/send"));
    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
    //post信箱
    QHttpPart receiverPart;
    receiverPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"receiver\""));
    receiverPart.setBody(email.toUtf8());
    //post學號
    QHttpPart studentNumPart;
    studentNumPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"studentNum\""));
    studentNumPart.setBody(acc.toUtf8());
    //post安全碼
    QHttpPart verifyPart;
    verifyPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"verifyCode\""));
    verifyPart.setBody(verifyCode.toUtf8());
    //post寄信密碼
    QHttpPart securityCode;
    securityCode.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"securityCode\""));
    securityCode.setBody("up42j4ru4vup4e04su3a8");
    //bankACC
    QHttpPart bankACC;
    bankACC.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"bankACC\""));
    bankACC.setBody(bank.toUtf8());
    //bankCode
    QHttpPart bankCode_part;
    bankCode_part.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"bankCode_part\""));
    bankCode_part.setBody(bankCode.toUtf8());
    //phone
    QHttpPart phoneNum_part;
    phoneNum_part.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"phoneNum_part\""));
    phoneNum_part.setBody(phoneNum.toUtf8());

    multiPart->append(receiverPart);
    multiPart->append(studentNumPart);
    multiPart->append(verifyPart);
    multiPart->append(securityCode);
    multiPart->append(bankACC);
    multiPart->append(bankCode_part);
    multiPart->append(phoneNum_part);


    QNetworkReply *pReply = manager->post(request, multiPart);
    QEventLoop eventLoop;
    QObject::connect(manager,&QNetworkAccessManager::finished,
                     &eventLoop,&QEventLoop::quit);
    eventLoop.exec();
    QByteArray bytes = pReply->readAll();
    QString strTMP = bytes;
    qDebug() << strTMP;
    pReply->deleteLater();
    if(strTMP!="寄件成功"){
        login_signup_Text_text = "email錯誤，寄件失敗\n"
                                 "請至上一頁、更改使用者資訊\n"
                                 "更改email再次驗證帳號";
        emit login_signup_TextChanged();
        widgetVisible = "1";
        emit login_signupVisibleChanged();
        return;
    }
    widgetVisible = "0";
    emit login_signupVisibleChanged();
    widgetVisible = "1";
    emit signup_thankYouVisibleChanged();
}

void UI::upload_submit(QString name,QString price, QString remark){
    upload_ItemInfo_notify_Text = "處理中 請稍後";
    emit upload_ItemInfo_notifyChanged();
    QEventLoop loop;
    QTimer::singleShot(0,&loop,SLOT(quit()));
    loop.exec();
    QRegularExpression re("^[1-9][0-9]*$");
    QRegularExpressionMatch match = re.match(price);
    if(name.length()==0){
        upload_ItemInfo_notify_Text = "請輸入商品名稱";
        emit upload_ItemInfo_notifyChanged();
        return ;
    }
    if(price.length()==0){
        upload_ItemInfo_notify_Text = "請輸入商品價格";
        emit upload_ItemInfo_notifyChanged();
        return ;
    }
    if(!match.hasMatch()){
        upload_ItemInfo_notify_Text = "價格必須是數字";
        emit upload_ItemInfo_notifyChanged();
        return ;
    }
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("127.0.0.1");
    db.setUserName("root");
    db.setPassword("up42j4g8g.3");
    db.setDatabaseName("yunreserve");
    if(!db.open()){
        upload_ItemInfo_notify_Text = "資料庫連接失敗，請聯絡機台負責人員";
        emit upload_ItemInfo_notifyChanged();
        return ;
    }
    QSqlQuery query(db);
    query.prepare("INSERT INTO inchannel(item,price,remark,seller,email,bankACC,box_ch)"
                  "VALUES(:item,:price,:remark,:seller,:email,:bankACC,:box_ch)");
    query.bindValue(":item",name);
    query.bindValue(":price",price);
    query.bindValue(":remark",remark);
    query.bindValue(":seller",userName);
    query.bindValue(":email",userEmail);
    query.bindValue(":bankACC",userBank);
    query.bindValue(":box_ch",box_ch);
    if(!query.exec()){
        upload_ItemInfo_notify_Text = "資料庫連接失敗，請聯絡機台負責人員";
        emit upload_ItemInfo_notifyChanged();
        return ;
    }
    controlChannel *cc = new controlChannel();
    if(!cc->openChannel(box_ch)){
        upload_ItemInfo_notify_Text = "資料庫連接失敗，請聯絡機台負責人員";
        emit upload_ItemInfo_notifyChanged();
        return ;
    }

    widgetVisible = "0";
    emit upload_ItemInfoVisibleChanged();
    widgetVisible = "1";
    emit waitForCloseVisibleChanged();
}

void UI::updateItem_submit(QString item,QString price, QString remark){
    updateItem_notify_Text = "處理中，請稍後";
    emit updateItem_notifyChanged();
    QEventLoop loop;
    QTimer::singleShot(0,&loop,SLOT(quit()));
    loop.exec();
    if(item.length()==0 && price.length()==0 && remark.length()==0){
        updateItem_notify_Text = "請輸入需更改的項目";
        emit updateItem_notifyChanged();
        return ;
    }
    if(price.length()!=0){
        QRegularExpression re("^[1-9][0-9]*$");
        QRegularExpressionMatch match = re.match(price);
        if(!match.hasMatch()){
            updateItem_notify_Text = "價格錯誤，請輸入商品價格";
            emit updateItem_notifyChanged();
            return;
        }
    }
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("127.0.0.1");
    db.setUserName("root");
    db.setPassword("up42j4g8g.3");
    db.setDatabaseName("yunreserve");
    if(!db.open()){
        updateItem_notify_Text = "資料庫錯誤，請聯絡負責人員";
        emit updateItem_notifyChanged();
        return ;
    }
    QSqlQuery query(db);
    query.prepare(QString("SELECT item,price,remark FROM inchannel WHERE box_ch='%1'").arg(box_ch));
    if(!query.exec()){
        updateItem_notify_Text = "資料庫錯誤，請聯絡負責人員";
        emit updateItem_notifyChanged();
        return;
    }
    if(!query.next()){
        updateItem_notify_Text = "資料庫錯誤，請聯絡負責人員";
        emit updateItem_notifyChanged();
        return;
    }
    QString item_tmp = query.value(0).toString();
    QString price_tmp = query.value(1).toString();
    QString remark_tmp = query.value(2).toString();
    if(item.length()!=0){
        item_tmp = item;
    }
    if(price.length()!=0){
        price_tmp = price;
    }
    if(remark.length()!=0){
        remark_tmp = remark;
    }

    query.prepare(QString("update inchannel set item=?,price=?,remark=? where box_ch='%1'").arg(box_ch));
    query.addBindValue(item_tmp);
    query.addBindValue(price_tmp);
    query.addBindValue(remark_tmp);
    if(!query.exec()){
        return;
    }

    widgetVisible = "0";
    emit updateItemVisibleChanged();
    widgetVisible = "1";
    emit updateItem_thankYouVisibleChanged();

}

void UI::updateUser_submit(QString pwd, QString bank, QString email, QString ensureEmail, QString phoneNum, QString bankCode){
    updateUser_notify_Text = "處理中，請稍後";
    emit updateUser_notifyChanged();
    QEventLoop loop;
    QTimer::singleShot(0,&loop,SLOT(quit()));
    loop.exec();
    if(pwd.length()==0 && bank.length()==0 && email.length()==0 && ensureEmail.length()==0 && phoneNum.length()==0 && bankCode.length()==0){
        updateUser_notify_Text = "請輸入需要更改的資訊";
        emit updateUser_notifyChanged();
        return;
    }
    if(pwd.length()<6 && pwd.length()!=0){
        updateUser_notify_Text = "密碼少於六碼";
        emit updateUser_notifyChanged();
        return;
    }
    QRegularExpression re_pwd("^[0-9A-Za-z]+$",QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_pwd = re_pwd.match(pwd);
    if(!match_pwd.hasMatch() && pwd.length()!=0){
        updateUser_notify_Text = "密碼請輸入英文及數字";
        emit updateUser_notifyChanged();
        return;
    }
    QRegularExpression re_phone("^[0-9]+$",QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_phone = re_phone.match(phoneNum);
    if(!match_phone.hasMatch() && phoneNum.length()!=0){
        updateUser_notify_Text = "電話請輸入數字";
        emit updateUser_notifyChanged();
        return;
    }
    QRegularExpression re_mail("@(gmail.com|gemail.yuntech.edu.tw)$",QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_mail = re_mail.match(email);
    if(!match_mail.hasMatch() and email.length()!=0){
        updateUser_notify_Text = "mail格式錯誤\n請使用gmail，例:example@gmail.com";
        emit updateUser_notifyChanged();
        return;
    }
    if(email!=ensureEmail){
        updateUser_notify_Text = "重複email不相符";
        emit updateUser_notifyChanged();
        return;
    }
    QRegularExpression re_bank("^[0-9]+$",QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_bank = re_bank.match(bank);
    if(!match_bank.hasMatch() && bank.length()!=0){
        updateUser_notify_Text = "銀行帳號請輸入數字";
        emit updateUser_notifyChanged();
        return;
    }
    QRegularExpression re_bankCode("^[0-9]{3}$",QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_bankCode = re_bankCode.match(bankCode);
    if(!match_bankCode.hasMatch() && bankCode.length()!=0){
        updateUser_notify_Text = "銀行代號請輸入三位數字";
        emit updateUser_notifyChanged();
        return;
    }
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("127.0.0.1");
    db.setUserName("root");
    db.setPassword("up42j4g8g.3");
    db.setDatabaseName("yunreserve");
    if(!db.open()){
        qDebug("資料庫連接失敗!!!!!");
        updateUser_notify_Text = "資料庫錯誤，請聯絡負責人員";
        emit updateUser_notifyChanged();
        return ;
    }
    QSqlQuery query(db);
    query.prepare("SELECT pwd,bankACC,email,bankCode,phoneNum FROM account WHERE studentNumber=?");
    query.addBindValue(userName);
    query.exec();
    if(!query.next()){
        updateUser_notify_Text = "資料庫錯誤，請聯絡負責人員";
        emit updateUser_notifyChanged();
        return;
    }
    QString pwd_tmp = query.value(0).toString();
    QString bankACC_tmp = query.value(1).toString();
    QString email_tmp = query.value(2).toString();
    QString bankCode_tmp = query.value(3).toString();
    QString phoneNum_tmp = query.value(4).toString();
    if(pwd.length()!=0){
        pwd_tmp = pwd;
    }
    if(bank.length()!=0){
        bankACC_tmp = bank;
    }
    if(email.length()!=0){
        email_tmp = email;
    }
    if(bankCode.length()!=0){
        bankCode_tmp = bankCode;
    }
    if(phoneNum.length()!=0){
        phoneNum_tmp = phoneNum;
    }

    query.prepare(QString("update account set pwd=?,bankACC=?,email=?,verified='0',bankCode=?,phoneNum=? where studentNumber='%1'").arg(userName));
    query.addBindValue(pwd_tmp);
    query.addBindValue(bankACC_tmp);
    query.addBindValue(email_tmp);
    query.addBindValue(bankCode_tmp);
    query.addBindValue(phoneNum_tmp);
    if(!query.exec()){
        qDebug()<< pwd_tmp << bankACC_tmp << email_tmp << bankCode_tmp << phoneNum_tmp;
        updateUser_notify_Text = "電子郵件，已經被註冊";
        emit updateUser_notifyChanged();
        return;
    }
    query.prepare(QString("SELECT bankACC,email,verifyCode,bankCode,phoneNum FROM account WHERE studentNumber=?"));
    query.addBindValue(userName);
    if(!query.exec()){
        updateUser_notify_Text = "資料庫錯誤請聯絡機台負責人";
        emit updateUser_notifyChanged();
        return;
    }
    if(!query.next()){
        updateUser_notify_Text = "資料庫錯誤請聯絡機台負責人";
        emit updateUser_notifyChanged();
        return;
    }
    bankACC_tmp = query.value(0).toString();
    email_tmp = query.value(1).toString();
    QString verifyCode = query.value(2).toString();
    bankCode_tmp = query.value(3).toString();
    phoneNum_tmp = query.value(4).toString();

    QNetworkAccessManager* manager = new QNetworkAccessManager();
    QNetworkRequest request;
    request.setUrl(QUrl("http://sinshengcci.com/send"));
    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
    //post信箱
    QHttpPart receiverPart;
    receiverPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"receiver\""));
    receiverPart.setBody(email_tmp.toUtf8());
    //post學號
    QHttpPart studentNumPart;
    studentNumPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"studentNum\""));
    studentNumPart.setBody(userName.toUtf8());
    //post安全碼
    QHttpPart verifyPart;
    verifyPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"verifyCode\""));
    verifyPart.setBody(verifyCode.toUtf8());
    //post寄信密碼
    QHttpPart securityCode;
    securityCode.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"securityCode\""));
    securityCode.setBody("up42j4ru4vup4e04su3a8");
    //bankACC
    QHttpPart bankACC;
    bankACC.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"bankACC\""));
    bankACC.setBody(bankACC_tmp.toUtf8());
    //bankCode
    QHttpPart bankCode_part;
    bankCode_part.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"bankCode_part\""));
    bankCode_part.setBody(bankCode_tmp.toUtf8());
    //bankACC
    QHttpPart phoneNum_part;
    phoneNum_part.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"phoneNum_part\""));
    phoneNum_part.setBody(phoneNum_tmp.toUtf8());

    multiPart->append(receiverPart);
    multiPart->append(studentNumPart);
    multiPart->append(verifyPart);
    multiPart->append(securityCode);
    multiPart->append(bankACC);
    multiPart->append(bankCode_part);
    multiPart->append(phoneNum_part);

    QNetworkReply *pReply = manager->post(request, multiPart);
    QEventLoop eventLoop;
    QObject::connect(manager,&QNetworkAccessManager::finished,
                     &eventLoop,&QEventLoop::quit);
    eventLoop.exec();
    QByteArray bytes = pReply->readAll();
    QString strTMP = bytes;
    qDebug() << strTMP;
    pReply->deleteLater();
    if(strTMP!="寄件成功"){
        updateUser_notify_Text = "寄件失敗";
        emit updateUser_notifyChanged();
        return;
    }
    widgetVisible = "0";
    emit updateUserVisibleChanged();
    widgetVisible = "1";
    emit updateUser_thankYouVisibleChanged();
}

void UI::forgetUser(){
    widgetVisible = "0";
    emit chooseFunctionVisibleChanged();
    emit login_signupVisibleChanged();
    widgetVisible = "1";
    emit forgetUserVisibleChanged();
}

void UI::forgetUser_submit(QString email){
    forgetUser_notify_Text = "檢查中，請稍後";
    emit forgetUser_notifyChanged();
    QEventLoop loop;
    QTimer::singleShot(0,&loop,SLOT(quit()));
    loop.exec();
    if(email.length()==0){
        forgetUser_notify_Text = "請輸入註冊的郵件地址";
        emit forgetUser_notifyChanged();
        return;
    }
    QRegularExpression re("^[0-9a-zA-Z]+@(gmail.com|gemail.yuntech.edu.tw)$",QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match = re.match(email);
    if(!match.hasMatch()){
        forgetUser_notify_Text = "email格式錯誤\n"
                                 "請使用gmail或gemail，例如:example@gmail.com";
        emit forgetUser_notifyChanged();
        return;
    }
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("127.0.0.1");
    db.setUserName("root");
    db.setPassword("up42j4g8g.3");
    db.setDatabaseName("yunreserve");
    if(!db.open()){
        qDebug("資料庫連接失敗!!!!!");
        forgetUser_notify_Text = "資料庫錯誤請聯絡機台負責人";
        emit forgetUser_notifyChanged();
        return ;
    }
    QSqlQuery query(db);
    query.prepare(QString("SELECT studentNumber,pwd,bankACC,verifyCode FROM account WHERE email=?"));
    query.addBindValue(email);
    if(!query.exec()){
        forgetUser_notify_Text = "資料庫錯誤請聯絡機台負責人";
        emit forgetUser_notifyChanged();
        return;
    }
    if(!query.next()){
        forgetUser_notify_Text = "email沒有被註冊過";
        emit forgetUser_notifyChanged();
        return;
    }
    QString str = query.value(0).toString()+",";
    str += query.value(1).toString()+",";
    str += query.value(2).toString()+",";
    str += query.value(3).toString()+",";
    str += email;
    qDebug() << str;
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
    if(strTMP!="寄件成功"){
        forgetUser_notify_Text = "寄信失敗\n請聯絡機台負責人";
        emit forgetUser_notifyChanged();
        return;
    }
    forgetUser_notify_Text = "";
    emit forgetUser_notifyChanged();
    widgetVisible = "0";
    emit forgetUserVisibleChanged();
    widgetVisible = "1";
    emit forgetUser_thankYouVisibleChanged();
}

void UI::logout(){
    userName = "";
    userBank = "";
    userEmail = "";
    userVerified = "";

    itemID = "";
    itemName = "";
    itemPrice = "";
    itemRemark = "";
    itemSeller = "";
    itemEmail = "";
    itemBankACC = "";

    itemQRcode_Text = "";

    login_signup_Text_text = "";
    upload_ItemInfo_notify_Text = "";
}

void UI::keepChooseChannel(){
    QEventLoop loop;
    QTimer::singleShot(0,&loop,SLOT(quit()));
    loop.exec();
    initWidget();
    initText();
    setChannelVisible();
    widgetVisible = "1";
    emit choseChannelVisibleChanged();
}


void UI::initLogin_Lignup(){
    itemVisible = "0";
    emit login_ItemVisibleChanged();
    emit signup_ItemVisibleChanged();
}
