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
    choseChannel_contract_Text_Text = "";
    contract_text_Text = "";
    toSeeContract_state = "";
    contractContent_Text = "";
    contractPage_Text = "";
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
    emit contractVisibleChanged();
    emit signupVisibleChanged();
    emit changedUserVisbleChanged();
}

void UI::initText(){
    login_signup_Text_text = "";
    upload_ItemInfo_notify_Text = "";
    forgetUser_notify_Text = "";
    updateUser_notify_Text = "";
    updateItem_notify_Text = "";
    choseChannel_notifyText_Text = "";
    choseChannel_contract_Text_Text = "";
    contract_text_Text = "";
    toSeeContract_state = "";
    contractContent_Text = "";
    contractPage_Text = "";


    emit login_signup_TextChanged();
    emit upload_ItemInfo_notifyChanged();
    emit forgetUser_notifyChanged();
    emit updateUser_notifyChanged();
    emit updateItem_notifyChanged();
    emit choseChannel_notifyTextChanged();
    emit choseChannel_contract_TextChanged();
    emit contract_textChanged();
    emit toSeeContractStateChanged();
    emit contractContentChanged();
    emit contractPageChanged();
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
    QTimer::singleShot(10,&loop,SLOT(quit()));
    loop.exec();
    if(functionHandler==1) {
        widgetVisible = "0";
        emit choseChannelVisibleChanged();
        widgetVisible = "1";
        emit perchase_PayingVisibleChanged();
        return;
    }
    if(functionHandler==2){
        widgetVisible = "0";
        emit choseChannelVisibleChanged();
        widgetVisible = "1";
        emit upload_ItemInfoVisibleChanged();
        return;
    }
    if(functionHandler==3){
        widgetVisible = "0";
        emit choseChannelVisibleChanged();
        widgetVisible = "1";
        emit updateItemVisibleChanged();
        return;
    }
    if(functionHandler==4){
        controlChannel *cc = new controlChannel();
        if(!cc->openChannel(box_ch)){
            choseChannel_notifyText_Text = "未預期錯誤，無法開啟櫃子，請聯絡負責人員";
            emit choseChannel_notifyTextChanged();
            widgetVisible = "1";
            emit choseChannelVisibleChanged();
            return ;
        }
        QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
        db.setHostName("127.0.0.1");
        db.setUserName("root");
        db.setPassword("up42j4g8g.3");
        db.setDatabaseName("yunreserve");
        if(!db.open()){
            qDebug("資料庫連接失敗!!!!!");
            widgetVisible = "1";
            emit choseChannelVisibleChanged();
            return ;
        }
        QSqlQuery query(db);
        query.prepare("DELETE FROM inchannel WHERE box_ch=?");
        query.addBindValue(box_ch);
        if(!query.exec()){
            widgetVisible = "1";
            emit choseChannelVisibleChanged();
            return;
        }
        widgetVisible = "0";
        emit choseChannelVisibleChanged();
        widgetVisible = "1";
        emit waitForCloseVisibleChanged();
        return;
    }
    widgetVisible = "1";
    emit choseChannelVisibleChanged();
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
    query.prepare("SELECT id,item,price,remark,seller "
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

    QString id = QString("%1").arg(itemID.toInt()%1000000, 6,10,QLatin1Char('0'));
    itemQRcode_Text = "TWQRP://藏藝點/158/01/V1?D1="+itemPrice+"00&D2="+id+"&D3=AeHoYzwSULbZ&D10=901&D11=00,00400482497653500150010001;01,00400482497653500150010001";
//        itemQRcode_Text = "TWQRP://芯生文創/158/01/V1?D1="+itemPrice+"0000000&D2="+id+"&D3=AcDtT2zBCHtp&D10=901&D11=00,00400482497653500150010001;01,00400482497653500150010001";
    emit itemQRcodeChanged();
}

void UI::displayItemInfo(){
    emit itemNameDisplayChanged();
    emit itemPriceDisplayChanged();
    emit itemRemarkDisplayChanged();
}

void UI::setChannelVisible(){
    choseChannel_contract_Text_Text = "";
    emit choseChannel_contract_TextChanged();
    toSeeContract_state = "0";
    emit toSeeContractStateChanged();
    QEventLoop loop;
    QTimer::singleShot(0,&loop,SLOT(quit()));
    loop.exec();
    if (functionHandler==1) {
        initBox("0");
        setChannelVisible_query("1","None");
        choseChannel_contract_Text_Text = "購買商品前，請詳閱購買說明\n\n\n\n點此              閱讀說明";
        emit choseChannel_contract_TextChanged();
        toSeeContract_state = "1";
        emit toSeeContractStateChanged();
    }
    if(functionHandler==2){
        initBox("1");
        setChannelVisible_query("0","None");
        choseChannel_contract_Text_Text = "販賣商品前，請詳閱購買說明\n\n\n\n點此              閱讀說明";
        emit choseChannel_contract_TextChanged();
        toSeeContract_state = "1";
        emit toSeeContractStateChanged();
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
    widgetVisible = "2";
    emit perchase_PayingVisibleChanged();
    QEventLoop loop;
    QTimer::singleShot(10,&loop,SLOT(quit()));
    loop.exec();
    DB *db = new DB();
    controlChannel *cc = new controlChannel();
    if(db->checkPayment(box_ch)){
//    if(true){
//        if(true){
//            return;
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
        QString upload_dateTime = query.value(6).toString();
        QString perchase_dateTime = QDateTime::currentDateTime().toString("yyyyMMdd");
        query.prepare("INSERT INTO transaction_history(item,price,remark,seller,box_ch,upload_dateTime,perchase_dateTime)"
                      "VALUES(:item,:price,:remark,:seller,:box_ch,:upload_dateTime,:perchase_dateTime)");
        query.bindValue(":item",item);
        query.bindValue(":price",price);
        query.bindValue(":remark",remark);
        query.bindValue(":seller",seller);
        query.bindValue(":box_ch",box_ch);
        query.bindValue(":upload_dateTime",upload_dateTime);
        query.bindValue(":perchase_dateTime",perchase_dateTime);
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
        widgetVisible = "1";
        emit perchase_PayingVisibleChanged();
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
    initWidget();
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
    QTimer::singleShot(10,&loop,SLOT(quit()));
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
    widgetVisible = "2";
    emit upload_ItemInfoVisibleChanged();
    QEventLoop loop;
    QTimer::singleShot(10,&loop,SLOT(quit()));
    loop.exec();
    QRegularExpression re("^[1-9][0-9]*$");
    QRegularExpressionMatch match = re.match(price);
    if(name.length()==0){
        upload_ItemInfo_notify_Text = "請輸入商品名稱";
        emit upload_ItemInfo_notifyChanged();
        widgetVisible = "1";
        emit upload_ItemInfoVisibleChanged();
        return ;
    }
    if(price.length()==0){
        upload_ItemInfo_notify_Text = "請輸入商品價格";
        emit upload_ItemInfo_notifyChanged();
        widgetVisible = "1";
        emit upload_ItemInfoVisibleChanged();
        return ;
    }
    if(!match.hasMatch()){
        upload_ItemInfo_notify_Text = "價格必須是數字";
        emit upload_ItemInfo_notifyChanged();
        widgetVisible = "1";
        emit upload_ItemInfoVisibleChanged();
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
        widgetVisible = "1";
        emit upload_ItemInfoVisibleChanged();
        return ;
    }
    QString upload_dateTime = QDateTime::currentDateTime().toString("yyyyMMdd");
    QSqlQuery query(db);
    query.prepare("INSERT INTO inchannel(item,price,remark,seller,box_ch,upload_dateTime)"
                  "VALUES(:item,:price,:remark,:seller,:box_ch,:upload_dateTime)");
    query.bindValue(":item",name);
    query.bindValue(":price",price);
    query.bindValue(":remark",remark);
    query.bindValue(":seller",userName);
    query.bindValue(":box_ch",box_ch);
    query.bindValue(":upload_dateTime",upload_dateTime);
    if(!query.exec()){
        upload_ItemInfo_notify_Text = "資料庫連接失敗，請聯絡機台負責人員";
        emit upload_ItemInfo_notifyChanged();
        widgetVisible = "1";
        emit upload_ItemInfoVisibleChanged();
        return ;
    }
    controlChannel *cc = new controlChannel();
    if(!cc->openChannel(box_ch)){
        upload_ItemInfo_notify_Text = "資料庫連接失敗，請聯絡機台負責人員";
        emit upload_ItemInfo_notifyChanged();
        widgetVisible = "1";
        emit upload_ItemInfoVisibleChanged();
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
    updateItem_notify_Text = "";
    emit updateItem_notifyChanged();
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
    QRegularExpression re("@(gmail.com|gemail.yuntech.edu.tw)$",QRegularExpression::CaseInsensitiveOption);
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
    query.prepare(QString("SELECT studentNumber,pwd,bankACC,verifyCode,bankCode,phoneNum FROM account WHERE email=?"));
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
    str += email+",";
    str += query.value(4).toString()+",";
    str += query.value(5).toString();
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
    widgetVisible = "3";
    emit choseChannelVisibleChanged();
}


void UI::initLogin_Lignup(){
    itemVisible = "0";
    emit login_ItemVisibleChanged();
    emit signup_ItemVisibleChanged();
}

void UI::toSeeContract(QString i){
    if(i!="none"){
        initWidget();
        widgetVisible = "2";
        emit contractVisibleChanged();
        return;
    }
    if(functionHandler==1){
        initWidget();
        widgetVisible = "0";
        emit choseChannelVisibleChanged();
        widgetVisible = "1";
        emit contractVisibleChanged();
        return;
    }
    if(functionHandler==2){
        initWidget();
        widgetVisible = "0";
        emit choseChannelVisibleChanged();
        widgetVisible = "3";
        emit contractVisibleChanged();
        return;
    }
}

void UI::contract_to_choseChannel(){
    initWidget();
    contract_text_Text = "";
    emit contract_textChanged();
    contractPage_Text = "";
    emit contractPageChanged();
    contractContent_Text = "";
    emit contractContentChanged();
    widgetVisible = "1";
    emit choseChannelVisibleChanged();
}

void UI::contract_to_Login_signup(){
    initWidget();
    contract_text_Text = "";
    emit contract_textChanged();
    contractPage_Text = "";
    emit contractPageChanged();
    contractContent_Text = "";
    emit contractContentChanged();
    widgetVisible = "1";
    emit login_signupVisibleChanged();
}

void UI::seeSellContract(){
    contractPage_handler = "1";
    contractType = "1";
    contract_text_Text = "寄賣契約";
    emit contract_textChanged();
    contractPage_Text = "1/2";
    emit contractPageChanged();
    contractContent_Text = "上架商品之賣方（以下簡稱甲方）及藏藝點資源交易平台（以下簡稱乙方）\n"
                           "，由甲方委託乙方代銷甲方貨品，雙方議定條件如下：\n\n"
                           "一、委託寄賣期限，依照甲方所選擇之上架方案而定，當甲方選擇之方案到\n"
                           "期後，本契約隨即終止。\n\n"
                           "二、乙方於商品展售時，若因可歸咎於乙方之因素導致寄售商品產生任何直\n"
                           "接或間接的損害時，乙方應賠償甲方部分或全額價金作為補償，但若係因不\n"
                           "可抗力之因素導致寄售商品產生任何直接或間接的損害，乙方均不需負任何\n"
                           "賠償或補償的義務。\n\n"
                           "三、甲乙雙方乃是委賣代銷關係，甲方同意依乙方【藏藝點】無人機台使用\n"
                           "之約定條款之內容計算服務費；不同櫃位之服務費應分別計算，依每個櫃位\n"
                           "訂定之價格分別計算再加總之；展售期間甲方仍擁有商品自主及所有權，乙\n"
                           "方對外售價，須依照甲方之定價出售，不得擅自更改增減。";
    emit contractContentChanged();
}

void UI::seeUseContract(){
    contractPage_handler = "1";
    contractType = "2";
    contract_text_Text = "關於【藏藝點】";
    emit contract_textChanged();
    contractPage_Text = "1/14";
    emit contractPageChanged();
    contractContent_Text = "一【藏藝點】平台交易服務（以下簡稱）係提供學生二手交易之平台，機台\n"
                           "上所放置之商品是由賣家自行上架銷售（視為寄賣），並非本平台自有商品\n"
                           "販賣。本平台不參與買賣雙方間之交易，對於出現在拍賣上的商品品質、安\n"
                           "全性或合法性，本平台均不予保證。\n\n"
                           "二當您使用本平台時，必須了解且遵守以下事項：\n"
                           "\t1. 買家和賣家必須對交易之履行負完全的責任。\n"
                           "\t2. 買家和賣家必須自行解決由交易引起的糾紛。\n"
                           "\t3. 買家和賣家必須自行負擔因交易而產生的費用。\n"
                           "\t4. 買家和賣家必須了解並遵守中華民國相關法律規定。\n\n"
                           "三為確保交易之順利履行，賣家須先行判斷是否有出售該商品之權利、交易\n"
                           "標的是否合法，並詳細記載商品資訊及交易條件，買家於購買前，亦應詳細\n"
                           "審視及評估商品說明等相關訊息，若確定購買，買賣合約即存在買賣雙方間\n"
                           "，雙方各自負擔給付價款及交付商品之責任，除法令另有規定外，任一方均\n"
                           "不得以任何理由反悔\n\n";
    emit contractContentChanged();
}

void UI::seePriContract(){
    contractPage_handler = "1";
    contractType = "3";
    contract_text_Text = "隱私權政策";
    emit contract_textChanged();
    contractPage_Text = "1/11";
    emit contractPageChanged();
    contractContent_Text = "【藏藝點】平台交易服務（以下簡稱本平台）極為重視會員之隱私權且遵循\n"
                           "「個人資料保護法」之規定制定隱私權保護政策，為了讓買賣雙方都能安心\n"
                           "使用本平台所提供之各項服務與資訊，特於此說明本平台之隱私權保護政策\n"
                           "，請您務必詳閱以下內容：";
    emit contractContentChanged();
}

void UI::contractNextPage(){
    if(contractType=="1" && contractPage_handler=="2"){
        return;
    }
    if(contractType=="2" && contractPage_handler=="14"){
        return;
    }
    if(contractType=="3" && contractPage_handler=="11"){
        return;
    }
    contractPage_handler = QString::number(contractPage_handler.toInt()+1);
    if(contractType=="1"){
        switch (contractPage_handler.toInt()) {
            case 1:
            contractPage_Text = "1/2";
            emit contractPageChanged();
            contractContent_Text = "上架商品之賣方（以下簡稱甲方）及藏藝點資源交易平台（以下簡稱乙方）\n"
                                   "，由甲方委託乙方代銷甲方貨品，雙方議定條件如下：\n\n"
                                   "一、委託寄賣期限，依照甲方所選擇之上架方案而定，當甲方選擇之方案到\n"
                                   "期後，本契約隨即終止。\n\n"
                                   "二、乙方於商品展售時，若因可歸咎於乙方之因素導致寄售商品產生任何直\n"
                                   "接或間接的損害時，乙方應賠償甲方部分或全額價金作為補償，但若係因不\n"
                                   "可抗力之因素導致寄售商品產生任何直接或間接的損害，乙方均不需負任何\n"
                                   "賠償或補償的義務。\n\n"
                                   "三、甲乙雙方乃是委賣代銷關係，甲方同意依乙方【藏藝點】無人機台使用\n"
                                   "之約定條款之內容計算服務費；不同櫃位之服務費應分別計算，依每個櫃位\n"
                                   "訂定之價格分別計算再加總之；展售期間甲方仍擁有商品自主及所有權，乙\n"
                                   "方對外售價，須依照甲方之定價出售，不得擅自更改增減。";
            emit contractContentChanged();
            break;
            case 2:
            contractPage_Text = "2/2";
            emit contractPageChanged();
            contractContent_Text = "四、本合約有效期間內，甲方擔保所授權予乙方使用的產品及資訊並無虛僞\n"
                                   "、誇大不實、抄襲盜用、重制或任何侵害著作權、專利權、商標權、公平交\n"
                                   "易法或消費者保護法等違法情事，如甲方違反本項規定，致有第三人向甲方\n"
                                   "或乙方請求損害賠償或有民事、刑事、行政責任或任何糾紛情事，概與乙方\n"
                                   "無關，責任均由甲方承擔。\n\n"
                                   "五、非經雙方同意，任一方不得將其權利與義務之全部或一部份移轉予第三\n"
                                   "人。甲方因個人因素，不願繼續寄賣時，亦得終止契約。\n\n"
                                   "六、本合約如有未盡事宜，得由雙方協定修改增訂之。惟須事先聯絡乙方，\n"
                                   "並經雙方同意方可修改增訂。否則將視為同意原契約。";
            emit contractContentChanged();
            break;
        }
        return;
    }
    if(contractType=="2"){
        switch (contractPage_handler.toInt()) {
            case 1:
            contractPage_Text = "1/14";
            emit contractPageChanged();
            contract_text_Text = "關於【藏藝點】";
            emit contract_textChanged();
            contractContent_Text = "一【藏藝點】平台交易服務（以下簡稱）係提供學生二手交易之平台，機台\n"
                                   "上所放置之商品是由賣家自行上架銷售（視為寄賣），並非本平台自有商品\n"
                                   "販賣。本平台不參與買賣雙方間之交易，對於出現在拍賣上的商品品質、安\n"
                                   "全性或合法性，本平台均不予保證。\n\n"
                                   "二當您使用本平台時，必須了解且遵守以下事項：\n"
                                   "\t1. 買家和賣家必須對交易之履行負完全的責任。\n"
                                   "\t2. 買家和賣家必須自行解決由交易引起的糾紛。\n"
                                   "\t3. 買家和賣家必須自行負擔因交易而產生的費用。\n"
                                   "\t4. 買家和賣家必須了解並遵守中華民國相關法律規定。\n\n"
                                   "三為確保交易之順利履行，賣家須先行判斷是否有出售該商品之權利、交易\n"
                                   "標的是否合法，並詳細記載商品資訊及交易條件，買家於購買前，亦應詳細\n"
                                   "審視及評估商品說明等相關訊息，若確定購買，買賣合約即存在買賣雙方間\n"
                                   "，雙方各自負擔給付價款及交付商品之責任，除法令另有規定外，任一方均\n"
                                   "不得以任何理由反悔\n\n";
            emit contractContentChanged();
            break;
            case 2:
            contractPage_Text = "2/14";
            emit contractPageChanged();
            contract_text_Text = "會員（賣家）";
            emit contract_textChanged();
            contractContent_Text = "１如果您要在本平台上架商品，您必須在首次上架商品前先填入您的姓名、\n"
                                   "學號、電話號碼、Email，並自行設定一組密碼做為您登入上架系統之密碼\n"
                                   "，且因匯款之必要程序，需要您輸入存簿帳號及其銀行代碼作為匯款依據。\n"
                                   "建議上傳存款簿正面圖，更可確保匯款之正確性。註冊完成後，以【學號】\n"
                                   "為帳號及您的密碼登入後，便可使用本平台上架系統上架您的商品。\n\n"
                                   "２您有義務自行保管留存於系統之個資，不得將密碼透漏或提供給第三人知\n"
                                   "悉，或出借予他人使用，對於使用您於本機台留存的個資登入本系統所為之\n"
                                   "一切行為，都視為您自己的行為，由您負其責任。\n\n"
                                   "３若您發現您的帳號密碼遭人盜用，請即時通知本平台；本平台將於獲悉您\n"
                                   "的帳號密碼遭盜用時，暫停該帳號所產生之處理及後續利用。\n\n"
                                   "４極度建議您上傳存款簿正面圖，一旦發生匯款錯誤等爭議，賣家資料經查\n"
                                   "證已上傳清晰、可輕易辨識帳戶戶名及帳號者，本平台將賠償扣除服務費後\n"
                                   "之全額價金。\n\n";
            emit contractContentChanged();
            break;
            case 3:
            contractPage_Text = "3/14";
            emit contractPageChanged();
            contract_text_Text = "會員（賣家）";
            emit contract_textChanged();
            contractContent_Text = "５特別提醒您，存簿帳號與您輸入之戶名不符合將導致無法匯款或匯款失敗\n"
                                   "，註冊前請再三確認資料之正確性。若因賣方資料輸入錯誤導致款項匯至他\n"
                                   "人帳戶，且未有第四點上傳存款簿正面圖者，款項恕無法取回。\n\n";
            emit contractContentChanged();
            break;
            case 4:
            contractPage_Text = "4/14";
            emit contractPageChanged();
            contract_text_Text = "個人資料安全";
            emit contract_textChanged();
            contractContent_Text = "一對於您的個人資料，本平台遵守個人資料保護相關法令規定。關於個人資\n"
                                   "料保護及隱私權政策，請參閱藏藝點隱私權聲明。\n\n"
                                   "二為了完成交易及提供會員服務，包括且不限於完成付款及交付，您必須擔\n"
                                   "保在交易過程所提供的所有資料均為完整、正確、與當時情況相符的資料，\n"
                                   "如果事後須變更，您應及時通知本平台。\n\n"
                                   "三對於您所留存的資料，本平台承諾負保密義務，除了完成賣方匯款、提供\n"
                                   "客戶服務或處理申訴事件或服務之配合廠商以外，不會任意洩漏、提供給第\n"
                                   "三人。\n\n"
                                   "四在下列情況下，本平台有權利查看或提供您的個人資料給有權機關、或主\n"
                                   "張其權利受侵害並提出適當證明的第三人：\n"
                                   "１依法令規定、或依司法機關\n或其他有權機關的命令。\n";
            emit contractContentChanged();
            break;
            case 5:
            contractPage_Text = "5/14";
            emit contractPageChanged();
            contract_text_Text = "個人資料安全";
            emit contract_textChanged();
            contractContent_Text = "２為完成交易、提供客戶服務、處理申訴事件、或執行本約定條款、或您違\n"
                                   "反本約定條款。\n"
                                   "３為維護本平台系統的正常運作及安全\n"
                                   "４為保護本平台、其他使用者或第三人的合法權益。\n";
            emit contractContentChanged();
            break;
            case 6:
            contractPage_Text = "6/14";
            emit contractPageChanged();
            contract_text_Text = "上架（賣方）";
            emit contract_textChanged();
            contractContent_Text = "１賣方意將商品於本平台上架時，需先登入您於本平台所註冊之帳號密碼，\n"
                                   "方可上架。\n\n"
                                   "２上架時間將依照您上架前所選擇之上架方案計算，週期計算始於您上架日\n"
                                   "當週，截止日一律為週日。賣方於上架時間得隨時前往本平台下架商品。請\n"
                                   "最遲於截止當日下架您的商品，若截止隔日中午１２時前未完成下架，工作\n"
                                   "人員將前往平台強制下架商品。\n\n"
                                   "３若您的商品被收回，請聯絡客服取回商品。若超過三天未取回將開始收取\n"
                                   "保管服務費。\n\n"
                                   "４商品價格為您上架時於機台螢幕上自行訂定之價格，此價格也將作為服務\n"
                                   "費計算依據。\n\n"
                                   "５當未取回商品產生之保管服務費已達您上架時所設定之價格，客服將致電\n"
                                   "詢問是否要保留商品，若不保留將視同放棄商品所有權。\n\n";
            emit contractContentChanged();
            break;
            case 7:
            contractPage_Text = "7/14";
            emit contractPageChanged();
            contract_text_Text = "上架（賣方）";
            emit contract_textChanged();
            contractContent_Text = "６商品販售成功後之價金會於第一時間匯至本平台位於台灣銀行之往來帳戶\n"
                                   "，並於截止隔日18:00前匯入您於本平台註冊所輸入之帳號，特別提醒您，\n"
                                   "戶名與註冊資料不符合將導致無法匯款，請再三確認您資料之正確性。若對\n"
                                   "於匯款有特殊需求，請事先聯絡本平台處理。匯款作業逢國定假日順延至第\n"
                                   "一天上班日。";
            emit contractContentChanged();
            break;
            case 8:
            contractPage_Text = "8/14";
            emit contractPageChanged();
            contract_text_Text = "付款（買方）";
            emit contract_textChanged();
            contractContent_Text = "１本平台採用【台灣Pay】之ＱＲ　Ｃｏｄｅ掃碼支付來收取之商品價金。\n"
                                   "無實體現金交易及刷卡機服務，付款前請先確定已下載[台灣行動支付]　 \n"
                                   "APP並持有支援ＱＲ　Ｃｏｄｅ支付之發卡銀行所發行之金融卡，金融卡請\n"
                                   "開啟轉帳功能，否則將導致付款失敗、無法取物。\n\n"
                                   "２本平台採ＱＲ　Ｃｏｄｅ掃碼支付，支付前請先確定您已在應用程式中加\n"
                                   "入正確的卡片。";
            emit contractContentChanged();
            break;
            case 9:
            contractPage_Text = "9/14";
            emit contractPageChanged();
            contract_text_Text = "服務費及保管服務費（賣方）";
            emit contract_textChanged();
            contractContent_Text = "１本平台係採用【台灣Pay】之QR Code掃碼支付向買方收取商品價金，所\n"
                                   "收取之價金將先匯入本平台往來帳戶內，當週銷售之總金額將於截止隔日\n"
                                   "18:00前匯入賣方於本平台所留存之帳號內，並從中扣除相當之服務費。匯\n"
                                   "款作業逢國定假日順延至第一天上班日。本平台係適用開立統一發票之業者\n"
                                   "，在商品成功售出時，發票將以電子檔形式寄入賣方於本平台所留存之電子\n"
                                   "信箱中，本平台將協助對獎，成功中獎時將會主動聯絡您。如您需要索取統\n"
                                   "一發票，可連絡本平台，我們將寄送紙本發票給您。\n\n"
                                   "２費率方案如下：採計次計費者\n"
                                   "=>採兩週為一期，期間內不限次數上架，\n"
                                   "未售出之商品不收費。\n"
                                   "=>商品價格小於或等於新台幣100元者，收取新台幣10元之服務費\n"
                                   "=>商品價格大於新台幣100元且小於新台幣1000元者，收取商品價格百分之\n"
                                   "十之服務費\n";
            emit contractContentChanged();
            break;
            case 10:
            contractPage_Text = "10/14";
            emit contractPageChanged();
            contract_text_Text = "服務費及保管服務費（賣方）";
            emit contract_textChanged();
            contractContent_Text = "=>商品價格高於新台幣1000元者（含），收取100元外加商品價格超出新\n"
                                   "台幣1000元部份百分之五為服務費採週租計費者\n"
                                   "=>採一週為一期，期間內不限次數上架，從未售出商品不收費。\n"
                                   "=>期間內若有商品售出，該週一共收取新台幣50元之服務費\n"
                                   "=>服務費經計算有小數點者，一律無條件捨去。\n\n"
                                   "３商品未售出且由賣家自行取回或經工作人員收回三天內領回者，不收取費\n"
                                   "用。\n\n"
                                   "４若您於展售截止日到期仍未自行取回商品，商品將經由服務人員收回保管\n"
                                   "，保管三天。逢國定假日順延至第一天上班日開始計算。保管中商品請主動\n"
                                   "聯絡服務人員協助取回，第四天取回商品將收取新台幣10元之保管費用，若\n"
                                   "至第七日仍未取回，後續起每日額外收取新台幣5元之追加服務費。\n\n"
                                   "５保管服務費之發票，將於您取回保管物時由服務人員開立給予之。";
            emit contractContentChanged();
            break;
            case 11:
            contractPage_Text = "11/14";
            emit contractPageChanged();
            contract_text_Text = "協助賣方推廣商品";
            emit contract_textChanged();
            contractContent_Text = "於本平台上架商品之賣方，可以委託本平台推廣您的商品。本平台於Facebook\n"
                                   "粉絲專頁、Instagram官方帳號、實體機台皆會附上推廣連結或QR Code，請\n"
                                   "您於上架之後，在進入網頁填寫推廣表單，填寫完由本平台驗證資料，通過後便\n"
                                   "會在粉絲專頁及Instagram上傳您的推廣文。惟此行為並非本平台義務，若您\n"
                                   "並未填寫表單或是填寫錯誤導致驗證失敗，以致本平台粉絲專頁及Instagram\n"
                                   "未出現您的商品推廣文，本平台不負任何責任義務。";
            emit contractContentChanged();
            break;
            case 12:
            contractPage_Text = "12/14";
            emit contractPageChanged();
            contract_text_Text = "退貨";
            emit contract_textChanged();
            contractContent_Text = "本平台僅提供買賣雙方交易之無人機台，機台上所販售之商品皆是由賣方自行上架，\n"
                                   "非本平台所銷售，故不適用【消費者保護法】第19條之規定，無提供7日鑑賞期，惟\n"
                                   "有商品瑕疵時，本平台將協助買賣雙方協調，前述瑕疵僅限於賣方未說明此瑕疵時適\n"
                                   "用。買方有貨品問題，本平台將依賣方推廣訊息及買方實際商品情況做比對，一旦確\n"
                                   "定賣方對商品重大狀況應表達而未表達或商品與推廣訊息有明顯及重大差異，致本平\n"
                                   "台遭受損害時，賣方須負賠償責任，本平台亦會向賣方求償。";
            emit contractContentChanged();
            break;
            case 13:
            contractPage_Text = "13/14";
            emit contractPageChanged();
            contract_text_Text = "服務宗旨及免責聲明";
            emit contract_textChanged();
            contractContent_Text = "１本平台將以符合目前一般可合理期待安全性之方式及技術，維護本網站的正常運作\n"
                                   "。下列情形本平台有權暫停提供本網站服務的全部或部分，且不負事先通知您的義務\n"
                                   "，本平台對因而產生任何直接或間接的損害，均不負任何賠償或補償的義務：\n"
                                   "=>對本網站相關軟硬體設備進行搬遷、更換、升級、保養或維修；\n"
                                   "=>天災或其他不可抗力因素所導致的服務停止或中斷；\n"
                                   "=>因電信或網站公司服務中斷或其他不可歸責於本平台事由所致的服務停止或中斷；\n"
                                   "=>本網站遭外力影響致資訊顯示不正確、或遭偽造、竄改、刪除或擷取致系統中斷或\n"
                                   "不能正常運作；\n"
                                   "=>使用者有違反本條款或法令之情形而對該使用者暫停或終止服務；\n"
                                   "=>其他本平台認為有需要暫停或終止服務之情形。\n\n"
                                   "２本平台針對可預知的軟硬體維護計畫，有可能導致網站暫停或終止服務時，將盡可能\n"
                                   "地於該狀況發生前，以適當方式於本網站公告。";
            emit contractContentChanged();
            break;
            case 14:
            contractPage_Text = "14/14";
            emit contractPageChanged();
            contract_text_Text = "準據法與管轄法院";
            emit contract_textChanged();
            contractContent_Text = "１本條款任何條款的全部或一部份無效時，並不影響其他約定的效力。您與本平台的\n"
                                   "權利義務關係，應依本條款及相關適用的公告或規範定之。若有發生任何爭議，您可\n"
                                   "以向實體機台所記載的客服聯絡方式提出申訴或反應，雙方均應秉持最大誠意，依誠\n"
                                   "實信用、平等互惠原則協商解決之。\n\n"
                                   "２本條款之解釋與適用，以及與本條款有關的爭議，均應依照中華民國法律予以處理\n"
                                   "，並以臺灣雲林地方法院斗六簡易庭為第一審管轄法院。";
            emit contractContentChanged();
            break;
        }
        return;
    }
    if(contractType=="3"){
        switch (contractPage_handler.toInt()) {
            case 1:
            contractPage_Text = "1/11";
            emit contractPageChanged();
            contract_text_Text = "隱私權政策";
            emit contract_textChanged();
            contractContent_Text = "【藏藝點】平台交易服務（以下簡稱本平台）極為重視會員之隱私權且遵循\n"
                                   "「個人資料保護法」之規定制定隱私權保護政策，為了讓買賣雙方都能安心\n"
                                   "使用本平台所提供之各項服務與資訊，特於此說明本平台之隱私權保護政策\n"
                                   "，請您務必詳閱以下內容：";
            emit contractContentChanged();
            break;
            case 2:
            contractPage_Text = "2/11";
            emit contractPageChanged();
            contract_text_Text = "個人資料及安全 ";
            emit contract_textChanged();
            contractContent_Text = "保護會員的個人隱私是本平台重要的經營理念，在未經會員同意之下，本平\n"
                                   "台絕不會將會員的個人資料提供予任何與本平台服務無關之第三人。會員應\n"
                                   "妥善保密自己的密碼及個人資料，不要將任何個人資料，尤其是密碼提供給\n"
                                   "任何人。";
            emit contractContentChanged();
            break;
            case 3:
            contractPage_Text = "3/11";
            emit contractPageChanged();
            contract_text_Text = "個人資料之蒐集、處理及利用";
            emit contract_textChanged();
            contractContent_Text = "如本平台所取得的個人資料，都僅供本平台於其內部、依照原來所說明的使\n"
                                   "用目的和範圍，除非事先說明、或依照相關法律規定，否則本平台不會將資\n"
                                   "料提供給第三人、或移作其他目的使用。";
            emit contractContentChanged();
            break;
            case 4:
            contractPage_Text = "4/11";
            emit contractPageChanged();
            contract_text_Text = "蒐集之目的";
            emit contract_textChanged();
            contractContent_Text = "對蒐集之目的在於進行行銷業務、消費者、客戶管理與服務、交易購物及其\n"
                                   "他電子商務服務及與調查、統計與研究分析(法定特定目的項目編號為Ｏ三六\n"
                                   "、Ｏ四Ｏ、Ｏ六七、Ｏ九Ｏ、一四八、 一五七)。本平台將藉由加入會員之\n"
                                   "過程或進行交易之過程來蒐集個人資料。";
            emit contractContentChanged();
            break;
        case 5:
        contractPage_Text = "5/11";
        emit contractPageChanged();
        contract_text_Text = "蒐集之個人資料類別";
        emit contract_textChanged();
        contractContent_Text = "本平台於機台內蒐集的個人資料包括\n"
                               "(1) C001辨識個人者： 如會員之姓名、電話、電子郵件等資訊。\n"
                               "(2)C002辨識財務者：如信用卡或金融機構帳戶資訊。";
        emit contractContentChanged();
        break;
        case 6:
        contractPage_Text = "6/11";
        emit contractPageChanged();
        contract_text_Text = "利用期間、地區、對象及方式";
        emit contract_textChanged();
        contractContent_Text = "(1)期間：會員當事人要求停止使用或本平台停止提供服務之日為止。\n"
                               "(2)地區：會員之個人資料將用於台灣地區。\n"
                               "(3)利用對象及方式：會員之個人資料蒐集除用於本平台之會員管理、客戶管理之\n"
                               "檢索查詢等功 能外，亦將利用於辨識身份、金流服務、行銷廣宣等。例示如下：\n"
                               "a.以會員身份使用本平台提供之各項服務時，於頁面中自動顯示會員資訊。\n"
                               "b.為遂行交易行為：會員對商品或勞務為預約、購買、參與贈獎等之活動或從事其\n"
                               "他交易時， 關於勞務提供、價金給付、回覆客戶之詢問、本平台對會員之詢問、\n"
                               "相關售後服務及其他遂行交 易所必要之業務。\n"
                               "c.宣傳廣告或行銷等：提供會員各種電子雜誌等資訊、透過電子郵件、郵件、電話\n"
                               "等提供與服務 有關之資訊。將會員所瀏覽之內容或廣告，依客戶之個人屬性或購買\n"
                               "紀錄等項目，進行個人化作業、會員使用服務之分析、新服務之開發或既有服務之\n"
                               "改善等。針對民調、活動、留言版等之意見，或其他服務關連事項，與會員進行聯繫\n"
                               "d.回覆客戶之詢問：針對會員透過電子郵件、郵件、傳真、電話或其他任何直接間\n"
                               "接連絡方式 向本平台所提出之詢問進行回覆。\n"
                               "e.其他業務附隨之事項：附隨於上述a至d.之利用目的而為本平台提供服務所必要\n"
                               "之使用。\n";
        emit contractContentChanged();
        break;
        case 7:
            contractPage_Text = "7/11";
            emit contractPageChanged();
            contract_text_Text = "利用期間、地區、對象及方式";
            emit contract_textChanged();
            contractContent_Text = "f.對於各別服務提供者之資訊提供：會員對商品提供者之商品或勞務為預約、購買\n"
                                   "、參加贈獎活 動或申請其他交易時，本平台於該交易所必要之範圍內，得將會員之\n"
                                   "個人資料檔案提供予服務提 供者，並由服務提供者負責管理該個人資料檔案。本平\n"
                                   "台將以規約課予服務提供者依保障會員隱私權之原則處理個人資料之義務，但無法\n"
                                   "保證服務提供者會必然遵守。詳細內容，請向各別服務 提供者洽詢。\n"
                                   "g. 其他：提供個別服務時，亦可能於上述規定之目的以外，利用個人資料。此時將\n"
                                   "在該個別服務之網頁載明其要旨。";
            emit contractContentChanged();
            break;
        case 8:
            contractPage_Text = "8/11";
            emit contractPageChanged();
            contract_text_Text = "會員就個人資料之權利";
            emit contract_textChanged();
            contractContent_Text = "本平台所蒐集個人資料之當事人，依個人資料保護法得對本平台行使以下權利：\n"
                                   "\t(1) 查詢或請求閱覽。\n"
                                   "\t(2) 請求製給複製本。\n"
                                   "\t(3) 請求補充或更正。\n"
                                   "\t(4) 請求停止蒐集、處理或利用。\n"
                                   "\t(5) 請求刪除。\n"
                                   "會員如欲行使上述權利，可與客服連絡進行申請。\n\n"
                                   "請注意！如拒絕提供所需必要之資料，將導致無法享受完整服務或完全無法使用\n"
                                   "該項服務";
            emit contractContentChanged();
            break;
        case 9:
            contractPage_Text = "9/11";
            emit contractPageChanged();
            contract_text_Text = "資料安全";
            emit contract_textChanged();
            contractContent_Text = "為保障會員的隱私及安全，本平台會員帳號資料會用密碼保護。本平台並盡力以\n\n"
                                   "合理之技術及程序，保障所有個人資料之安全。個人資料查詢或更正的方式會員\n\n"
                                   "對於其個人資料，有查詢及閱覽、製給複製本、補充或更正、停止電腦處理及利\n\n"
                                   "用、刪除等需求時，可以與客服中心聯絡，本平台將迅速進行處理。";
            emit contractContentChanged();
            break;
        case 10:
            contractPage_Text = "10/11";
            emit contractPageChanged();
            contract_text_Text = "第三方服務供應商";
            emit contract_textChanged();
            contractContent_Text = "本平台會與第三方服務供應商合作，提供更多的服務選擇。例如，我們會將我們\n\n"
                                   "網站的第三方支付服務、信用卡收單服務或物流配送委由其他第三方服務供應商\n\n"
                                   "來提供服務，第三方服務供應商得以根據本平台的要求提供本平台會員服務。在\n\n"
                                   "特定情況下，第三方服務供應商會直接請您提供您的個人資料，您有權利決定是\n\n"
                                   "否提供給第三方服務供應商。請注意！如拒絕提供所需必要之資料，將導致無法\n\n"
                                   "享受完整服務或完全無法使用該項服務。";
            emit contractContentChanged();
            break;
        case 11:
            contractPage_Text = "11/11";
            emit contractPageChanged();
            contract_text_Text = "隱私權保護政策修訂";
            emit contract_textChanged();
            contractContent_Text = "隨著市場環境的改變本平台將會不時修訂網站政策。會員如果對於本平台網站隱\n\n"
                                   "私權聲明、或與個人資料有關之相關事項有任何疑問，可以利用電子郵件和客服\n\n中心聯絡。";
            emit contractContentChanged();
            break;
        }
        return;
    }
}

void UI::contractLastPage(){
    if(contractPage_handler=="1"){
        return;
    }
    contractPage_handler = QString::number(contractPage_handler.toInt()-1);
    if(contractType=="1"){
        switch (contractPage_handler.toInt()) {
            case 1:
            contractPage_Text = "1/2";
            emit contractPageChanged();
            contractContent_Text = "上架商品之賣方（以下簡稱甲方）及藏藝點資源交易平台（以下簡稱乙方）\n"
                                   "，由甲方委託乙方代銷甲方貨品，雙方議定條件如下：\n\n"
                                   "一、委託寄賣期限，依照甲方所選擇之上架方案而定，當甲方選擇之方案到\n"
                                   "期後，本契約隨即終止。\n\n"
                                   "二、乙方於商品展售時，若因可歸咎於乙方之因素導致寄售商品產生任何直\n"
                                   "接或間接的損害時，乙方應賠償甲方部分或全額價金作為補償，但若係因不\n"
                                   "可抗力之因素導致寄售商品產生任何直接或間接的損害，乙方均不需負任何\n"
                                   "賠償或補償的義務。\n\n"
                                   "三、甲乙雙方乃是委賣代銷關係，甲方同意依乙方【藏藝點】無人機台使用\n"
                                   "之約定條款之內容計算服務費；不同櫃位之服務費應分別計算，依每個櫃位\n"
                                   "訂定之價格分別計算再加總之；展售期間甲方仍擁有商品自主及所有權，乙\n"
                                   "方對外售價，須依照甲方之定價出售，不得擅自更改增減。";
            emit contractContentChanged();
            break;
            case 2:
            contractPage_Text = "2/2";
            emit contractPageChanged();
            contractContent_Text = "四、本合約有效期間內，甲方擔保所授權予乙方使用的產品及資訊並無虛僞\n"
                                   "、誇大不實、抄襲盜用、重制或任何侵害著作權、專利權、商標權、公平交\n"
                                   "易法或消費者保護法等違法情事，如甲方違反本項規定，致有第三人向甲方\n"
                                   "或乙方請求損害賠償或有民事、刑事、行政責任或任何糾紛情事，概與乙方\n"
                                   "無關，責任均由甲方承擔。\n\n"
                                   "五、非經雙方同意，任一方不得將其權利與義務之全部或一部份移轉予第三\n"
                                   "人。甲方因個人因素，不願繼續寄賣時，亦得終止契約。\n\n"
                                   "六、本合約如有未盡事宜，得由雙方協定修改增訂之。惟須事先聯絡乙方，\n"
                                   "並經雙方同意方可修改增訂。否則將視為同意原契約。";
            emit contractContentChanged();
            break;

        }
        return;
    }
    if(contractType=="2"){
        switch (contractPage_handler.toInt()) {
            case 1:
            contractPage_Text = "1/14";
            emit contractPageChanged();
            contract_text_Text = "關於【藏藝點】";
            emit contract_textChanged();
            contractContent_Text = "一【藏藝點】平台交易服務（以下簡稱）係提供學生二手交易之平台，機台\n"
                                   "上所放置之商品是由賣家自行上架銷售（視為寄賣），並非本平台自有商品\n"
                                   "販賣。本平台不參與買賣雙方間之交易，對於出現在拍賣上的商品品質、安\n"
                                   "全性或合法性，本平台均不予保證。\n\n"
                                   "二當您使用本平台時，必須了解且遵守以下事項：\n"
                                   "\t1. 買家和賣家必須對交易之履行負完全的責任。\n"
                                   "\t2. 買家和賣家必須自行解決由交易引起的糾紛。\n"
                                   "\t3. 買家和賣家必須自行負擔因交易而產生的費用。\n"
                                   "\t4. 買家和賣家必須了解並遵守中華民國相關法律規定。\n\n"
                                   "三為確保交易之順利履行，賣家須先行判斷是否有出售該商品之權利、交易\n"
                                   "標的是否合法，並詳細記載商品資訊及交易條件，買家於購買前，亦應詳細\n"
                                   "審視及評估商品說明等相關訊息，若確定購買，買賣合約即存在買賣雙方間\n"
                                   "，雙方各自負擔給付價款及交付商品之責任，除法令另有規定外，任一方均\n"
                                   "不得以任何理由反悔\n\n";
            emit contractContentChanged();
            break;
            case 2:
            contractPage_Text = "2/14";
            emit contractPageChanged();
            contract_text_Text = "會員（賣家）";
            emit contract_textChanged();
            contractContent_Text = "１如果您要在本平台上架商品，您必須在首次上架商品前先填入您的姓名、\n"
                                   "學號、電話號碼、Email，並自行設定一組密碼做為您登入上架系統之密碼\n"
                                   "，且因匯款之必要程序，需要您輸入存簿帳號及其銀行代碼作為匯款依據。\n"
                                   "建議上傳存款簿正面圖，更可確保匯款之正確性。註冊完成後，以【學號】\n"
                                   "為帳號及您的密碼登入後，便可使用本平台上架系統上架您的商品。\n\n"
                                   "２您有義務自行保管留存於系統之個資，不得將密碼透漏或提供給第三人知\n"
                                   "悉，或出借予他人使用，對於使用您於本機台留存的個資登入本系統所為之\n"
                                   "一切行為，都視為您自己的行為，由您負其責任。\n\n"
                                   "３若您發現您的帳號密碼遭人盜用，請即時通知本平台；本平台將於獲悉您\n"
                                   "的帳號密碼遭盜用時，暫停該帳號所產生之處理及後續利用。\n\n"
                                   "４極度建議您上傳存款簿正面圖，一旦發生匯款錯誤等爭議，賣家資料經查\n"
                                   "證已上傳清晰、可輕易辨識帳戶戶名及帳號者，本平台將賠償扣除服務費後\n"
                                   "之全額價金。\n\n";
            emit contractContentChanged();
            break;
            case 3:
            contractPage_Text = "3/14";
            emit contractPageChanged();
            contract_text_Text = "會員（賣家）";
            emit contract_textChanged();
            contractContent_Text = "５特別提醒您，存簿帳號與您輸入之戶名不符合將導致無法匯款或匯款失敗\n"
                                   "，註冊前請再三確認資料之正確性。若因賣方資料輸入錯誤導致款項匯至他\n"
                                   "人帳戶，且未有第四點上傳存款簿正面圖者，款項恕無法取回。\n\n";
            emit contractContentChanged();
            break;
            case 4:
            contractPage_Text = "4/14";
            emit contractPageChanged();
            contract_text_Text = "個人資料安全";
            emit contract_textChanged();
            contractContent_Text = "一對於您的個人資料，本平台遵守個人資料保護相關法令規定。關於個人資\n"
                                   "料保護及隱私權政策，請參閱藏藝點隱私權聲明。\n\n"
                                   "二為了完成交易及提供會員服務，包括且不限於完成付款及交付，您必須擔\n"
                                   "保在交易過程所提供的所有資料均為完整、正確、與當時情況相符的資料，\n"
                                   "如果事後須變更，您應及時通知本平台。\n\n"
                                   "三對於您所留存的資料，本平台承諾負保密義務，除了完成賣方匯款、提供\n"
                                   "客戶服務或處理申訴事件或服務之配合廠商以外，不會任意洩漏、提供給第\n"
                                   "三人。\n\n"
                                   "四在下列情況下，本平台有權利查看或提供您的個人資料給有權機關、或主\n"
                                   "張其權利受侵害並提出適當證明的第三人：\n"
                                   "１依法令規定、或依司法機關\n或其他有權機關的命令。\n";
            emit contractContentChanged();
            break;
            case 5:
            contractPage_Text = "5/14";
            emit contractPageChanged();
            contract_text_Text = "個人資料安全";
            emit contract_textChanged();
            contractContent_Text = "２為完成交易、提供客戶服務、處理申訴事件、或執行本約定條款、或您違\n"
                                   "反本約定條款。\n"
                                   "３為維護本平台系統的正常運作及安全\n"
                                   "４為保護本平台、其他使用者或第三人的合法權益。\n";
            emit contractContentChanged();
            break;
            case 6:
            contractPage_Text = "6/14";
            emit contractPageChanged();
            contract_text_Text = "上架（賣方）";
            emit contract_textChanged();
            contractContent_Text = "１賣方意將商品於本平台上架時，需先登入您於本平台所註冊之帳號密碼，\n"
                                   "方可上架。\n\n"
                                   "２上架時間將依照您上架前所選擇之上架方案計算，週期計算始於您上架日\n"
                                   "當週，截止日一律為週日。賣方於上架時間得隨時前往本平台下架商品。請\n"
                                   "最遲於截止當日下架您的商品，若截止隔日中午１２時前未完成下架，工作\n"
                                   "人員將前往平台強制下架商品。\n\n"
                                   "３若您的商品被收回，請聯絡客服取回商品。若超過三天未取回將開始收取\n"
                                   "保管服務費。\n\n"
                                   "４商品價格為您上架時於機台螢幕上自行訂定之價格，此價格也將作為服務\n"
                                   "費計算依據。\n\n"
                                   "５當未取回商品產生之保管服務費已達您上架時所設定之價格，客服將致電\n"
                                   "詢問是否要保留商品，若不保留將視同放棄商品所有權。\n\n";
            emit contractContentChanged();
            break;
            case 7:
            contractPage_Text = "7/14";
            emit contractPageChanged();
            contract_text_Text = "上架（賣方）";
            emit contract_textChanged();
            contractContent_Text = "６商品販售成功後之價金會於第一時間匯至本平台位於台灣銀行之往來帳戶\n"
                                   "，並於截止隔日18:00前匯入您於本平台註冊所輸入之帳號，特別提醒您，\n"
                                   "戶名與註冊資料不符合將導致無法匯款，請再三確認您資料之正確性。若對\n"
                                   "於匯款有特殊需求，請事先聯絡本平台處理。匯款作業逢國定假日順延至第\n"
                                   "一天上班日。";
            emit contractContentChanged();
            break;
            case 8:
            contractPage_Text = "8/14";
            emit contractPageChanged();
            contract_text_Text = "付款（買方）";
            emit contract_textChanged();
            contractContent_Text = "１本平台採用【台灣Pay】之ＱＲ　Ｃｏｄｅ掃碼支付來收取之商品價金。\n"
                                   "無實體現金交易及刷卡機服務，付款前請先確定已下載[台灣行動支付]　 \n"
                                   "APP並持有支援ＱＲ　Ｃｏｄｅ支付之發卡銀行所發行之金融卡，金融卡請\n"
                                   "開啟轉帳功能，否則將導致付款失敗、無法取物。\n\n"
                                   "２本平台採ＱＲ　Ｃｏｄｅ掃碼支付，支付前請先確定您已在應用程式中加\n"
                                   "入正確的卡片。";
            emit contractContentChanged();
            break;
            case 9:
            contractPage_Text = "9/14";
            emit contractPageChanged();
            contract_text_Text = "服務費及保管服務費（賣方）";
            emit contract_textChanged();
            contractContent_Text = "１本平台係採用【台灣Pay】之QR Code掃碼支付向買方收取商品價金，所\n"
                                   "收取之價金將先匯入本平台往來帳戶內，當週銷售之總金額將於截止隔日\n"
                                   "18:00前匯入賣方於本平台所留存之帳號內，並從中扣除相當之服務費。匯\n"
                                   "款作業逢國定假日順延至第一天上班日。本平台係適用開立統一發票之業者\n"
                                   "，在商品成功售出時，發票將以電子檔形式寄入賣方於本平台所留存之電子\n"
                                   "信箱中，本平台將協助對獎，成功中獎時將會主動聯絡您。如您需要索取統\n"
                                   "一發票，可連絡本平台，我們將寄送紙本發票給您。\n\n"
                                   "２費率方案如下：採計次計費者\n"
                                   "=>採兩週為一期，期間內不限次數上架，\n"
                                   "未售出之商品不收費。\n"
                                   "=>商品價格小於或等於新台幣100元者，收取新台幣10元之服務費\n"
                                   "=>商品價格大於新台幣100元且小於新台幣1000元者，收取商品價格百分之\n"
                                   "十之服務費\n";
            emit contractContentChanged();
            break;
            case 10:
            contractPage_Text = "10/14";
            emit contractPageChanged();
            contract_text_Text = "服務費及保管服務費（賣方）";
            emit contract_textChanged();
            contractContent_Text = "=>商品價格高於新台幣1000元者（含），收取100元外加商品價格超出新\n"
                                   "台幣1000元部份百分之五為服務費採週租計費者\n"
                                   "=>採一週為一期，期間內不限次數上架，從未售出商品不收費。\n"
                                   "=>期間內若有商品售出，該週一共收取新台幣50元之服務費\n"
                                   "=>服務費經計算有小數點者，一律無條件捨去。\n\n"
                                   "３商品未售出且由賣家自行取回或經工作人員收回三天內領回者，不收取費\n"
                                   "用。\n\n"
                                   "４若您於展售截止日到期仍未自行取回商品，商品將經由服務人員收回保管\n"
                                   "，保管三天。逢國定假日順延至第一天上班日開始計算。保管中商品請主動\n"
                                   "聯絡服務人員協助取回，第四天取回商品將收取新台幣10元之保管費用，若\n"
                                   "至第七日仍未取回，後續起每日額外收取新台幣5元之追加服務費。\n\n"
                                   "５保管服務費之發票，將於您取回保管物時由服務人員開立給予之。";
            emit contractContentChanged();
            break;
            case 11:
            contractPage_Text = "11/14";
            emit contractPageChanged();
            contract_text_Text = "協助賣方推廣商品";
            emit contract_textChanged();
            contractContent_Text = "於本平台上架商品之賣方，可以委託本平台推廣您的商品。本平台於Facebook\n"
                                   "粉絲專頁、Instagram官方帳號、實體機台皆會附上推廣連結或QR Code，請\n"
                                   "您於上架之後，在進入網頁填寫推廣表單，填寫完由本平台驗證資料，通過後便\n"
                                   "會在粉絲專頁及Instagram上傳您的推廣文。惟此行為並非本平台義務，若您\n"
                                   "並未填寫表單或是填寫錯誤導致驗證失敗，以致本平台粉絲專頁及Instagram\n"
                                   "未出現您的商品推廣文，本平台不負任何責任義務。";
            emit contractContentChanged();
            break;
            case 12:
            contractPage_Text = "12/14";
            emit contractPageChanged();
            contract_text_Text = "退貨";
            emit contract_textChanged();
            contractContent_Text = "本平台僅提供買賣雙方交易之無人機台，機台上所販售之商品皆是由賣方自行上架，\n"
                                   "非本平台所銷售，故不適用【消費者保護法】第19條之規定，無提供7日鑑賞期，惟\n"
                                   "有商品瑕疵時，本平台將協助買賣雙方協調，前述瑕疵僅限於賣方未說明此瑕疵時適\n"
                                   "用。買方有貨品問題，本平台將依賣方推廣訊息及買方實際商品情況做比對，一旦確\n"
                                   "定賣方對商品重大狀況應表達而未表達或商品與推廣訊息有明顯及重大差異，致本平\n"
                                   "台遭受損害時，賣方須負賠償責任，本平台亦會向賣方求償。";
            emit contractContentChanged();
            break;
            case 13:
            contractPage_Text = "13/14";
            emit contractPageChanged();
            contract_text_Text = "服務宗旨及免責聲明";
            emit contract_textChanged();
            contractContent_Text = "１本平台將以符合目前一般可合理期待安全性之方式及技術，維護本網站的正常運作\n"
                                   "。下列情形本平台有權暫停提供本網站服務的全部或部分，且不負事先通知您的義務\n"
                                   "，本平台對因而產生任何直接或間接的損害，均不負任何賠償或補償的義務：\n"
                                   "=>對本網站相關軟硬體設備進行搬遷、更換、升級、保養或維修；\n"
                                   "=>天災或其他不可抗力因素所導致的服務停止或中斷；\n"
                                   "=>因電信或網站公司服務中斷或其他不可歸責於本平台事由所致的服務停止或中斷；\n"
                                   "=>本網站遭外力影響致資訊顯示不正確、或遭偽造、竄改、刪除或擷取致系統中斷或\n"
                                   "不能正常運作；\n"
                                   "=>使用者有違反本條款或法令之情形而對該使用者暫停或終止服務；\n"
                                   "=>其他本平台認為有需要暫停或終止服務之情形。\n\n"
                                   "２本平台針對可預知的軟硬體維護計畫，有可能導致網站暫停或終止服務時，將盡可能\n"
                                   "地於該狀況發生前，以適當方式於本網站公告。";
            emit contractContentChanged();
            break;
            case 14:
            contractPage_Text = "14/14";
            emit contractPageChanged();
            contract_text_Text = "準據法與管轄法院";
            emit contract_textChanged();
            contractContent_Text = "１本條款任何條款的全部或一部份無效時，並不影響其他約定的效力。您與本平台的\n"
                                   "權利義務關係，應依本條款及相關適用的公告或規範定之。若有發生任何爭議，您可\n"
                                   "以向實體機台所記載的客服聯絡方式提出申訴或反應，雙方均應秉持最大誠意，依誠\n"
                                   "實信用、平等互惠原則協商解決之。\n\n"
                                   "２本條款之解釋與適用，以及與本條款有關的爭議，均應依照中華民國法律予以處理\n"
                                   "，並以臺灣雲林地方法院斗六簡易庭為第一審管轄法院。";
            emit contractContentChanged();
            break;
        }
        return;
    }
    if(contractType=="3"){
        switch (contractPage_handler.toInt()) {
            case 1:
            contractPage_Text = "1/11";
            emit contractPageChanged();
            contract_text_Text = "隱私權政策";
            emit contract_textChanged();
            contractContent_Text = "【藏藝點】平台交易服務（以下簡稱本平台）極為重視會員之隱私權且遵循\n"
                                   "「個人資料保護法」之規定制定隱私權保護政策，為了讓買賣雙方都能安心\n"
                                   "使用本平台所提供之各項服務與資訊，特於此說明本平台之隱私權保護政策\n"
                                   "，請您務必詳閱以下內容：";
            emit contractContentChanged();
            break;
            case 2:
            contractPage_Text = "2/11";
            emit contractPageChanged();
            contract_text_Text = "個人資料及安全 ";
            emit contract_textChanged();
            contractContent_Text = "保護會員的個人隱私是本平台重要的經營理念，在未經會員同意之下，本平\n"
                                   "台絕不會將會員的個人資料提供予任何與本平台服務無關之第三人。會員應\n"
                                   "妥善保密自己的密碼及個人資料，不要將任何個人資料，尤其是密碼提供給\n"
                                   "任何人。";
            emit contractContentChanged();
            break;
            case 3:
            contractPage_Text = "3/11";
            emit contractPageChanged();
            contract_text_Text = "個人資料之蒐集、處理及利用";
            emit contract_textChanged();
            contractContent_Text = "如本平台所取得的個人資料，都僅供本平台於其內部、依照原來所說明的使\n"
                                   "用目的和範圍，除非事先說明、或依照相關法律規定，否則本平台不會將資\n"
                                   "料提供給第三人、或移作其他目的使用。";
            emit contractContentChanged();
            break;
            case 4:
            contractPage_Text = "4/11";
            emit contractPageChanged();
            contract_text_Text = "蒐集之目的";
            emit contract_textChanged();
            contractContent_Text = "對蒐集之目的在於進行行銷業務、消費者、客戶管理與服務、交易購物及其\n"
                                   "他電子商務服務及與調查、統計與研究分析(法定特定目的項目編號為Ｏ三六\n"
                                   "、Ｏ四Ｏ、Ｏ六七、Ｏ九Ｏ、一四八、 一五七)。本平台將藉由加入會員之\n"
                                   "過程或進行交易之過程來蒐集個人資料。";
            emit contractContentChanged();
            break;
        case 5:
        contractPage_Text = "5/11";
        emit contractPageChanged();
        contract_text_Text = "蒐集之個人資料類別";
        emit contract_textChanged();
        contractContent_Text = "本平台於機台內蒐集的個人資料包括\n"
                               "(1) C001辨識個人者： 如會員之姓名、電話、電子郵件等資訊。\n"
                               "(2)C002辨識財務者：如信用卡或金融機構帳戶資訊。";
        emit contractContentChanged();
        break;
        case 6:
        contractPage_Text = "6/11";
        emit contractPageChanged();
        contract_text_Text = "利用期間、地區、對象及方式";
        emit contract_textChanged();
        contractContent_Text = "(1)期間：會員當事人要求停止使用或本平台停止提供服務之日為止。\n"
                               "(2)地區：會員之個人資料將用於台灣地區。\n"
                               "(3)利用對象及方式：會員之個人資料蒐集除用於本平台之會員管理、客戶管理之\n"
                               "檢索查詢等功 能外，亦將利用於辨識身份、金流服務、行銷廣宣等。例示如下：\n"
                               "a.以會員身份使用本平台提供之各項服務時，於頁面中自動顯示會員資訊。\n"
                               "b.為遂行交易行為：會員對商品或勞務為預約、購買、參與贈獎等之活動或從事其\n"
                               "他交易時， 關於勞務提供、價金給付、回覆客戶之詢問、本平台對會員之詢問、\n"
                               "相關售後服務及其他遂行交 易所必要之業務。\n"
                               "c.宣傳廣告或行銷等：提供會員各種電子雜誌等資訊、透過電子郵件、郵件、電話\n"
                               "等提供與服務 有關之資訊。將會員所瀏覽之內容或廣告，依客戶之個人屬性或購買\n"
                               "紀錄等項目，進行個人化作業、會員使用服務之分析、新服務之開發或既有服務之\n"
                               "改善等。針對民調、活動、留言版等之意見，或其他服務關連事項，與會員進行聯繫\n"
                               "d.回覆客戶之詢問：針對會員透過電子郵件、郵件、傳真、電話或其他任何直接間\n"
                               "接連絡方式 向本平台所提出之詢問進行回覆。\n"
                               "e.其他業務附隨之事項：附隨於上述a至d.之利用目的而為本平台提供服務所必要\n"
                               "之使用。\n";
        emit contractContentChanged();
        break;
        case 7:
            contractPage_Text = "7/11";
            emit contractPageChanged();
            contract_text_Text = "利用期間、地區、對象及方式";
            emit contract_textChanged();
            contractContent_Text = "f.對於各別服務提供者之資訊提供：會員對商品提供者之商品或勞務為預約、購買\n"
                                   "、參加贈獎活 動或申請其他交易時，本平台於該交易所必要之範圍內，得將會員之\n"
                                   "個人資料檔案提供予服務提 供者，並由服務提供者負責管理該個人資料檔案。本平\n"
                                   "台將以規約課予服務提供者依保障會員隱私權之原則處理個人資料之義務，但無法\n"
                                   "保證服務提供者會必然遵守。詳細內容，請向各別服務 提供者洽詢。\n"
                                   "g. 其他：提供個別服務時，亦可能於上述規定之目的以外，利用個人資料。此時將\n"
                                   "在該個別服務之網頁載明其要旨。";
            emit contractContentChanged();
            break;
        case 8:
            contractPage_Text = "8/11";
            emit contractPageChanged();
            contract_text_Text = "會員就個人資料之權利";
            emit contract_textChanged();
            contractContent_Text = "本平台所蒐集個人資料之當事人，依個人資料保護法得對本平台行使以下權利：\n"
                                   "\t(1) 查詢或請求閱覽。\n"
                                   "\t(2) 請求製給複製本。\n"
                                   "\t(3) 請求補充或更正。\n"
                                   "\t(4) 請求停止蒐集、處理或利用。\n"
                                   "\t(5) 請求刪除。\n"
                                   "會員如欲行使上述權利，可與客服連絡進行申請。\n\n"
                                   "請注意！如拒絕提供所需必要之資料，將導致無法享受完整服務或完全無法使用\n"
                                   "該項服務";
            emit contractContentChanged();
            break;
        case 9:
            contractPage_Text = "9/11";
            emit contractPageChanged();
            contract_text_Text = "資料安全";
            emit contract_textChanged();
            contractContent_Text = "為保障會員的隱私及安全，本平台會員帳號資料會用密碼保護。本平台並盡力以\n\n"
                                   "合理之技術及程序，保障所有個人資料之安全。個人資料查詢或更正的方式會員\n\n"
                                   "對於其個人資料，有查詢及閱覽、製給複製本、補充或更正、停止電腦處理及利\n\n"
                                   "用、刪除等需求時，可以與客服中心聯絡，本平台將迅速進行處理。";
            emit contractContentChanged();
            break;
        case 10:
            contractPage_Text = "10/11";
            emit contractPageChanged();
            contract_text_Text = "第三方服務供應商";
            emit contract_textChanged();
            contractContent_Text = "本平台會與第三方服務供應商合作，提供更多的服務選擇。例如，我們會將我們\n\n"
                                   "網站的第三方支付服務、信用卡收單服務或物流配送委由其他第三方服務供應商\n\n"
                                   "來提供服務，第三方服務供應商得以根據本平台的要求提供本平台會員服務。在\n\n"
                                   "特定情況下，第三方服務供應商會直接請您提供您的個人資料，您有權利決定是\n\n"
                                   "否提供給第三方服務供應商。請注意！如拒絕提供所需必要之資料，將導致無法\n\n"
                                   "享受完整服務或完全無法使用該項服務。";
            emit contractContentChanged();
            break;
        case 11:
            contractPage_Text = "11/11";
            emit contractPageChanged();
            contract_text_Text = "隱私權保護政策修訂";
            emit contract_textChanged();
            contractContent_Text = "隨著市場環境的改變本平台將會不時修訂網站政策。會員如果對於本平台網站隱\n\n"
                                   "私權聲明、或與個人資料有關之相關事項有任何疑問，可以利用電子郵件和客服\n\n中心聯絡。";
            emit contractContentChanged();
            break;
        }
        return;
    }
}

void UI::signupUser(){
    initWidget();
    widgetVisible = "1";
    emit signupVisibleChanged();
}

void UI::changeUser(){
    initWidget();
    widgetVisible = "1";
    emit changedUserVisbleChanged();
}




