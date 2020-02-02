#ifndef VERIFYUSER_H
#define VERIFYUSER_H

#include <QDebug>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QEventLoop>

#include <QtXml>
#include <QHttpMultiPart>
#include <QObject>

class verifyUSER
{
public:
    verifyUSER(QString receiver, QString studentNumber, QString verifyCode);
    int toverifyUser();

private:
    int emailSentHandler;
};

#endif // VERIFYUSER_H
