#ifndef DATABASECONNECTOR_H
#define DATABASECONNECTOR_H

#include <QObject>
#include <QtSql>
#include <QSqlDatabase>
#include <QTextCodec>
#include <QUrl>
#include <QQuickImageProvider>

#include <QNetworkReply>
#include <QNetworkRequest>

//加入控制櫃子的controlChannel
#include "controlchannel.h"
//加入控制UI的redirect
#include "redirect.h"
//加入寄送email的verifyuser
#include "verifyuser.h"

#include <string>
#include <vector>
#include "qrcode_generater/QrCode.hpp"
using namespace qrcodegen;
using namespace std;



class ColorImageProvider : public QQuickImageProvider
  {
  public:
      ColorImageProvider()
          : QQuickImageProvider(QQuickImageProvider::Pixmap)
      {
      }

      QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize);
  };

class database : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString ch1State READ visible WRITE setChannelVisible NOTIFY ch1StateChanged)
    Q_PROPERTY(QString ch2State READ visible WRITE setChannelVisible NOTIFY ch2StateChanged)
    Q_PROPERTY(QString ch3State READ visible WRITE setChannelVisible NOTIFY ch3StateChanged)
    Q_PROPERTY(QString ch4State READ visible WRITE setChannelVisible NOTIFY ch4StateChanged)
    Q_PROPERTY(QString ch5State READ visible WRITE setChannelVisible NOTIFY ch5StateChanged)
    Q_PROPERTY(QString ch6State READ visible WRITE setChannelVisible NOTIFY ch6StateChanged)
    Q_PROPERTY(QString ch7State READ visible WRITE setChannelVisible NOTIFY ch7StateChanged)
    Q_PROPERTY(QString ch8State READ visible WRITE setChannelVisible NOTIFY ch8StateChanged)
    Q_PROPERTY(QString ch9State READ visible WRITE setChannelVisible NOTIFY ch9StateChanged)
    Q_PROPERTY(QString ch10State READ visible WRITE setChannelVisible NOTIFY ch10StateChanged)
    Q_PROPERTY(QString ch11State READ visible WRITE setChannelVisible NOTIFY ch11StateChanged)
    Q_PROPERTY(QString ch12State READ visible WRITE setChannelVisible NOTIFY ch12StateChanged)

    Q_PROPERTY(QString takeOFF_channel1_State READ takeOFF_channel_State NOTIFY takeOFF_channel1_StateChanged)
    Q_PROPERTY(QString takeOFF_channel2_State READ takeOFF_channel_State NOTIFY takeOFF_channel2_StateChanged)



    Q_PROPERTY(QString QRcode READ QRcode WRITE setQRcode NOTIFY QRcodeSetted)

//    Q_PROPERTY(QString displayPriceVisible READ visible WRITE setVisible NOTIFY displayPriceVisibleChanged)
//    Q_PROPERTY(QString pricePayedVisible READ visible WRITE setVisible NOTIFY pricePayedVisibleChanged)


public:
    explicit database(QObject *parent = nullptr);
    QString visible(){return state;}
    void setChannelVisible(QString st, int ch=0);

    QString QRcode(){return QRcodeSRC;}
    void setQRcode(QString st, int ch=0);

    QString takeOFF_channel_State(){return takeOFF_channel_StateHandler;}


    void setVisible(QString st);
    int signupUSER(QString acc, QString pwd, QString bankACC, QString email, QString verifyCode);
    int verifyUSER(QString acc, QString pwd);

    int check_payment(QString currentCh);
    int takeOFF(int i);
    void transferTOhistory(QString currentCh);

    QString get_item_name(QString currentCh);
    QString get_remark_name(QString currentCh);
    QString get_price_name(QString currentCh);

    QString getAccFromEmail(QString email);


signals:
    void ch1StateChanged();
    void ch2StateChanged();
    void ch3StateChanged();
    void ch4StateChanged();
    void ch5StateChanged();
    void ch6StateChanged();
    void ch7StateChanged();
    void ch8StateChanged();
    void ch9StateChanged();
    void ch10StateChanged();
    void ch11StateChanged();
    void ch12StateChanged();

    void QRcodeSetted();

    void displayPriceVisibleChanged();
    void pricePayedVisibleChanged();

    void takeOFF_channel1_StateChanged();
    void takeOFF_channel2_StateChanged();
public slots:
    void check();
    void whichSeleted(int i);
    void upload_whichSeleted(int i);
    bool uploadGood(QString item,QString price,QString remark, QString userACC,QString box_ch);
    void toTakeOFF_signin(QString acc);
private:
    QString state;
    QString QRcodeSRC;
    QString buy_whichCH;
    QString upload_whichCH;
    QString takeOFF_channel_StateHandler;
};

#endif // DATABASECONNECTOR_H
