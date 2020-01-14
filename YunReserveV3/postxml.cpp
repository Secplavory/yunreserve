#include "postxml.h"

postXML::postXML(QObject *parent) : QObject(parent)
{

}

void postXML::check_payment(){
    qDebug("啟用電文交易");

    //準備post的資料
    QFile file("test.xml");
    if(!file.open(QFile::WriteOnly | QFile::Text)){
        qDebug() << "error: Cannot write file";
        return;
    }
    QXmlStreamWriter xmlWriter(&file);
    xmlWriter.setAutoFormatting(true);
    xmlWriter.writeStartDocument();
        xmlWriter.writeStartElement("QrpCheckQRCodeReq");
            xmlWriter.writeAttribute("xmlns", "http://www.focas.fisc.com.tw/QRP/checkQRCode");
            xmlWriter.writeStartElement("mti");
            xmlWriter.writeCharacters("0800");
            xmlWriter.writeEndElement();
            xmlWriter.writeStartElement("processingCode");
            xmlWriter.writeCharacters("000163");
            xmlWriter.writeEndElement();
            xmlWriter.writeStartElement("amt");
            xmlWriter.writeCharacters("000000010000");
            xmlWriter.writeEndElement();
            xmlWriter.writeStartElement("traceNumber");
            xmlWriter.writeCharacters("###");
            xmlWriter.writeEndElement();
            xmlWriter.writeStartElement("localTime");
            xmlWriter.writeCharacters("###");
            xmlWriter.writeEndElement();
            xmlWriter.writeStartElement("localDate");
            xmlWriter.writeCharacters("###");
            xmlWriter.writeEndElement();
            xmlWriter.writeStartElement("countryCode");
            xmlWriter.writeCharacters("158");
            xmlWriter.writeEndElement();
            xmlWriter.writeStartElement("acqBank");
            xmlWriter.writeCharacters("004");
            xmlWriter.writeEndElement();
            xmlWriter.writeStartElement("terminalId");
            xmlWriter.writeCharacters("50010001");
            xmlWriter.writeEndElement();
            xmlWriter.writeStartElement("merchantId");
            xmlWriter.writeCharacters("004824976535001");
            xmlWriter.writeEndElement();
            xmlWriter.writeStartElement("merchantName");
            xmlWriter.writeCharacters("芯生文創");
            xmlWriter.writeEndElement();
            xmlWriter.writeStartElement("verifyCode");
            xmlWriter.writeCharacters("00000000000000000000000000000000a0173559d927f840271945a816f93702");
            xmlWriter.writeEndElement();
            xmlWriter.writeStartElement("paymentType");
            xmlWriter.writeCharacters("00");
            xmlWriter.writeEndElement();
            xmlWriter.writeStartElement("secureCode");
            xmlWriter.writeCharacters("AcDtT2zBCHtp");
            xmlWriter.writeEndElement();
            xmlWriter.writeStartElement("hostId");
            xmlWriter.writeCharacters("00402824976530200000001");
            xmlWriter.writeEndElement();
        xmlWriter.writeEndElement();
    xmlWriter.writeEndDocument();
    file.close();
    if(file.error()){
        qDebug()<<"寫錯了";
        return;
    }
//    if(file.open(QIODevice::ReadOnly | QIODevice::Text)){
//        QXmlStreamReader reader(&file);
//        reader.readNext();
//        while(!reader.atEnd()){
//            if(reader.isStartElement()){
//                if(reader.name() != "QrpCheckQRCodeReq"){
//                    qDebug()<<reader.readElementText();
//                }

//            }
//            reader.readNext();
//        }
//    }
    //準備post的資料完成
    //設定url
    QString testing_name = "https://www.focas-test.fisc.com.tw/FOCAS_WS/API20/V1/FISCII/checkQRCode";
    QString baseUrl = "http://sinshengcci.com";
//    baseUrl = "http://127.0.0.1:8000/";
    //設定url完成

    //定義變數
    QNetworkAccessManager* manager = new QNetworkAccessManager(this);
//    qDebug() << manager->supportedSchemes();
    QNetworkRequest request;
    //定義變數完成

    //準備ssl
    QSslConfiguration config;
    QSslConfiguration conf = request.sslConfiguration();
    conf.setPeerVerifyMode(QSslSocket::VerifyNone);
    conf.setProtocol(QSsl::TlsV1SslV3);
    request.setSslConfiguration(conf);
    //準備ssl完成

    //設定url與header
    request.setUrl(QUrl(baseUrl));
    request.setRawHeader("Content-Type","application/x-www-form-urlencoded");
    //設定url與header完成

    //傳輸完成列出資料
    //取得xml
    file.open(QIODevice::ReadOnly);
    QTextStream get(&file);
    //得到xml數據
    QString Data_Xml_Tx = get.readAll().toUtf8();
    file.close();
    //post XML
    QNetworkReply *pReplay = manager->get(request);
    QEventLoop eventLoop;
    QObject::connect(manager, &QNetworkAccessManager::finished,&eventLoop,&QEventLoop::quit);
    eventLoop.exec();
    QByteArray bytes = pReplay->readAll();
    qDebug() << "post結果" << bytes;
    //傳輸完成列出資料完成

}
