#ifndef UI_H
#define UI_H

#include <QObject>
#include <QtDebug>

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QEventLoop>
#include <QTimer>

#include <QRegularExpression>
#include <QRegularExpressionMatch>
#include <QCryptographicHash>

#include <QCoreApplication>
#include <QDateTime>

#include <QFile>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QHttpMultiPart>

#include <QJsonObject>
#include <QJsonDocument>

#include "qrcode_generater/QrCode.hpp"
#include <QQuickImageProvider>
using namespace qrcodegen;

class ColorImageProvider : public QQuickImageProvider
  {
  public:
      ColorImageProvider()
          : QQuickImageProvider(QQuickImageProvider::Pixmap)
      {
      }
      QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize);
  };


class UI : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString welcome READ welcome NOTIFY welcomeChanged)
    Q_PROPERTY(QString chooseFunction READ chooseFunction NOTIFY chooseFunctionChanged)
    Q_PROPERTY(QString chooseChannel READ chooseChannel NOTIFY chooseChannelChanged)
    Q_PROPERTY(QString contract READ contract NOTIFY contractChanged)
    Q_PROPERTY(QString scanQrcode READ scanQrcode NOTIFY scanQrcodeChanged)
    Q_PROPERTY(QString upload_itemInfo READ upload_itemInfo NOTIFY upload_itemInfoChanged)
    Q_PROPERTY(QString login READ login NOTIFY loginChanged)
    Q_PROPERTY(QString waitClose READ waitClose NOTIFY waitCloseChanged)
    Q_PROPERTY(QString thanksYou READ thanksYou NOTIFY thanksYouChanged)
    Q_PROPERTY(QString signup READ signup NOTIFY signupChanged)
    Q_PROPERTY(QString changeUser READ changeUser NOTIFY changeUserChanged)
    Q_PROPERTY(QString forgetUser READ forgetUser NOTIFY forgetUserChanged)

    Q_PROPERTY(QString ch01 READ ch01 NOTIFY ch01Changed)
    Q_PROPERTY(QString ch02 READ ch02 NOTIFY ch02Changed)
    Q_PROPERTY(QString ch03 READ ch03 NOTIFY ch03Changed)
    Q_PROPERTY(QString ch04 READ ch04 NOTIFY ch04Changed)
    Q_PROPERTY(QString ch05 READ ch05 NOTIFY ch05Changed)
    Q_PROPERTY(QString ch06 READ ch06 NOTIFY ch06Changed)
    Q_PROPERTY(QString ch07 READ ch07 NOTIFY ch07Changed)
    Q_PROPERTY(QString ch08 READ ch08 NOTIFY ch08Changed)
    Q_PROPERTY(QString ch09 READ ch09 NOTIFY ch09Changed)
    Q_PROPERTY(QString ch10 READ ch10 NOTIFY ch10Changed)
    Q_PROPERTY(QString ch11 READ ch11 NOTIFY ch11Changed)
    Q_PROPERTY(QString ch12 READ ch12 NOTIFY ch12Changed)
    Q_PROPERTY(QString ch13 READ ch13 NOTIFY ch13Changed)
    Q_PROPERTY(QString ch14 READ ch14 NOTIFY ch14Changed)
    Q_PROPERTY(QString ch15 READ ch15 NOTIFY ch15Changed)
    Q_PROPERTY(QString ch16 READ ch16 NOTIFY ch16Changed)
    Q_PROPERTY(QString ch17 READ ch17 NOTIFY ch17Changed)
    Q_PROPERTY(QString ch18 READ ch18 NOTIFY ch18Changed)
    Q_PROPERTY(QString ch19 READ ch19 NOTIFY ch19Changed)
    Q_PROPERTY(QString ch20 READ ch20 NOTIFY ch20Changed)
    Q_PROPERTY(QString ch21 READ ch21 NOTIFY ch21Changed)
    Q_PROPERTY(QString ch22 READ ch22 NOTIFY ch22Changed)
    Q_PROPERTY(QString ch23 READ ch23 NOTIFY ch23Changed)
    Q_PROPERTY(QString ch24 READ ch24 NOTIFY ch24Changed)
    Q_PROPERTY(QString ch25 READ ch25 NOTIFY ch25Changed)
    Q_PROPERTY(QString ch26 READ ch26 NOTIFY ch26Changed)
    Q_PROPERTY(QString ch27 READ ch27 NOTIFY ch27Changed)
    Q_PROPERTY(QString ch28 READ ch28 NOTIFY ch28Changed)

    Q_PROPERTY(QString scanQrcode_qrcode READ scanQrcode_qrcode NOTIFY scanQrcode_qrcodeChanged)

    Q_PROPERTY(QString itemName READ itemName NOTIFY itemNameChanged)
    Q_PROPERTY(QString itemPrice READ itemPrice NOTIFY itemPriceChanged)

    Q_PROPERTY(QString login_notify READ login_notify NOTIFY login_notifyChanged)
    Q_PROPERTY(QString upload_notify READ upload_notify NOTIFY upload_notifyChanged)
    Q_PROPERTY(QString scanQrcode_notify READ scanQrcode_notify NOTIFY scanQrcode_notifyChanged)
public:
    explicit UI(QObject *parent = nullptr);
    void setChannelState(int handler,int box_ch){
        state = QString::number(handler);
        switch (box_ch) {
        case 1:
            emit ch01Changed();
            break;

        case 2:
            emit ch02Changed();
            break;

        case 3:
            emit ch03Changed();
            break;

        case 4:
            emit ch04Changed();
            break;

        case 5:
            emit ch05Changed();
            break;

        case 6:
            emit ch06Changed();
            break;

        case 7:
            emit ch07Changed();
            break;

        case 8:
            emit ch08Changed();
            break;

        case 9:
            emit ch09Changed();
            break;

        case 10:
            emit ch10Changed();
            break;

        case 11:
            emit ch11Changed();
            break;

        case 12:
            emit ch12Changed();
            break;

        case 13:
            emit ch13Changed();
            break;

        case 14:
            emit ch14Changed();
            break;

        case 15:
            emit ch15Changed();
            break;

        case 16:
            emit ch16Changed();
            break;

        case 17:
            emit ch17Changed();
            break;

        case 18:
            emit ch18Changed();
            break;

        case 19:
            emit ch19Changed();
            break;

        case 20:
            emit ch20Changed();
            break;

        case 21:
            emit ch21Changed();
            break;

        case 22:
            emit ch22Changed();
            break;

        case 23:
            emit ch23Changed();
            break;

        case 24:
            emit ch24Changed();
            break;

        case 25:
            emit ch25Changed();
            break;

        case 26:
            emit ch26Changed();
            break;

        case 27:
            emit ch27Changed();
            break;

        case 28:
            emit ch28Changed();
            break;

        case 99:
            emit ch01Changed();
            emit ch02Changed();
            emit ch03Changed();
            emit ch04Changed();
            emit ch05Changed();
            emit ch06Changed();
            emit ch07Changed();
            emit ch08Changed();
            emit ch09Changed();
            emit ch10Changed();
            emit ch11Changed();
            emit ch12Changed();
            emit ch13Changed();
            emit ch14Changed();
            emit ch15Changed();
            emit ch16Changed();
            emit ch17Changed();
            emit ch18Changed();
            emit ch19Changed();
            emit ch20Changed();
            emit ch21Changed();
            emit ch22Changed();
            emit ch23Changed();
            emit ch24Changed();
            emit ch25Changed();
            emit ch26Changed();
            emit ch27Changed();
            emit ch28Changed();
            break;
        }
    }
    QString welcome(){return welcome_state;}
    QString chooseFunction(){return state;}
    QString chooseChannel(){return state;}
    QString contract(){return state;}
    QString scanQrcode(){return state;}
    QString upload_itemInfo(){return state;}
    QString login(){return state;}
    QString waitClose(){return state;}
    QString thanksYou(){return state;}
    QString signup(){return state;}
    QString changeUser(){return state;}
    QString forgetUser(){return state;}

    QString ch01(){return state;}
    QString ch02(){return state;}
    QString ch03(){return state;}
    QString ch04(){return state;}
    QString ch05(){return state;}
    QString ch06(){return state;}
    QString ch07(){return state;}
    QString ch08(){return state;}
    QString ch09(){return state;}
    QString ch10(){return state;}
    QString ch11(){return state;}
    QString ch12(){return state;}
    QString ch13(){return state;}
    QString ch14(){return state;}
    QString ch15(){return state;}
    QString ch16(){return state;}
    QString ch17(){return state;}
    QString ch18(){return state;}
    QString ch19(){return state;}
    QString ch20(){return state;}
    QString ch21(){return state;}
    QString ch22(){return state;}
    QString ch23(){return state;}
    QString ch24(){return state;}
    QString ch25(){return state;}
    QString ch26(){return state;}
    QString ch27(){return state;}
    QString ch28(){return state;}

    QString scanQrcode_qrcode(){return scanQrcode_qrcode_text;}

    QString itemName(){return itemInfo;}
    QString itemPrice(){return itemInfo;}

    QString login_notify(){return notify;}
    QString upload_notify(){return notify;}
    QString scanQrcode_notify(){return notify;}
signals:
    void welcomeChanged();
    void chooseFunctionChanged();
    void chooseChannelChanged();
    void contractChanged();
    void scanQrcodeChanged();
    void upload_itemInfoChanged();
    void loginChanged();
    void waitCloseChanged();
    void thanksYouChanged();
    void signupChanged();
    void changeUserChanged();
    void forgetUserChanged();

    void ch01Changed();
    void ch02Changed();
    void ch03Changed();
    void ch04Changed();
    void ch05Changed();
    void ch06Changed();
    void ch07Changed();
    void ch08Changed();
    void ch09Changed();
    void ch10Changed();
    void ch11Changed();
    void ch12Changed();
    void ch13Changed();
    void ch14Changed();
    void ch15Changed();
    void ch16Changed();
    void ch17Changed();
    void ch18Changed();
    void ch19Changed();
    void ch20Changed();
    void ch21Changed();
    void ch22Changed();
    void ch23Changed();
    void ch24Changed();
    void ch25Changed();
    void ch26Changed();
    void ch27Changed();
    void ch28Changed();

    void scanQrcode_qrcodeChanged();

    void itemNameChanged();
    void itemPriceChanged();

    void login_notifyChanged();
    void upload_notifyChanged();
    void scanQrcode_notifyChanged();
public slots:
    void reset();
    void welcome_clicked();
    void choose_perchase();
    void toContract();
    void chooseChannel_toChooseFunction();
    void contract_toChooseChannel();
    void chooseChannel_chosen();
    void scanQrcode_toChooseChannel();
    void toLogin();
    void login_toChooseFunction();
    void upload_toChooseChannel();
    void chooseChannel_signup();
    void signup_toChooseFunction();
    void chooseChannel_changeUser();
    void changeUser_toChooseFunction();
    void chooseChannel_forgetUser();
    void forgetUser_toChooseFunction();
    void thanksYou_toChooseChannel();
    void thanksYou_toHome();
    void scanQrcode_PayMoney();
    void admin();

    void setFunction(QString i);
    void setChannelVisible();
    void setChannel(QString channel);
    int getFunction(){
        return functionHandler.toInt();
    }
    void setItemInfo();
    bool login_submit(QString acc, QString pwd);
    bool upload_submit(QString item, QString price);
    bool upload_sendMail();
    bool checkChannel();
private:
    QString functionHandler;
    QString box_ch;

    QString userACC;
    QString userName;
    QString userEmail;
    QString item_ID;
    QString item_Name;
    QString item_Price;

    QString scanQrcode_qrcode_text;

    QString itemInfo;
    QString notify;

    QSqlDatabase db_yunreserve;

    QString state;
    QString welcome_state;
};

#endif // UI_H
