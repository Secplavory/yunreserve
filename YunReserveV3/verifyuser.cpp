#include "verifyuser.h"

verifyUSER::verifyUSER(QString receiver, QString studentNumber, QString verifyCode)
{
    qDebug() << "呼叫verifyUESR" << receiver;
    QNetworkAccessManager* manager = new QNetworkAccessManager();
    QNetworkRequest request;
//    request.setHeader(QNetworkRequest::ContentTypeHeader,"text/text");
    request.setUrl(QUrl("http://sinshengcci.com/send"));

    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
    //post信箱
    QHttpPart receiverPart;
    receiverPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"receiver\""));
    receiverPart.setBody(receiver.toUtf8());
    //post學號
    QHttpPart studentNumPart;
    studentNumPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"studentNum\""));
    studentNumPart.setBody(studentNumber.toUtf8());
    //post安全碼
    QHttpPart verifyPart;
    verifyPart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"verifyCode\""));
    verifyPart.setBody(verifyCode.toUtf8());
    //post寄信密碼
    QHttpPart securityCode;
    securityCode.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"securityCode\""));
    securityCode.setBody("up42j4ru4vup4e04su3a8");

    multiPart->append(receiverPart);
    multiPart->append(studentNumPart);
    multiPart->append(verifyPart);
    multiPart->append(securityCode);

    QNetworkReply *pReply = manager->post(request, multiPart);
    QEventLoop eventLoop;
    QObject::connect(manager,&QNetworkAccessManager::finished,
                     &eventLoop,&QEventLoop::quit);
    eventLoop.exec();
    QByteArray bytes = pReply->readAll();
    QString strTMP = bytes;
    qDebug() << strTMP;
    pReply->deleteLater();
    if(strTMP=="寄件成功"){
        emailSentHandler = 1;
    }else{
        emailSentHandler = 2;
    }
}

int verifyUSER::toverifyUser(){
    return emailSentHandler;
}
