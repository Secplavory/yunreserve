#ifndef POSTXML_H
#define POSTXML_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QEventLoop>

#include <QXmlStreamWriter>
#include <QXmlStreamReader>
#include <QFile>

class postXML : public QObject
{
    Q_OBJECT
public:
    explicit postXML(QObject *parent = nullptr);
public slots:
    void check_payment();
};

#endif // POSTXML_H
