#ifndef UI_H
#define UI_H
#include <QObject>
#include <QDebug>

#include "db.h"
#include "controlchannel.h"

#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QEventLoop>
#include <QHttpPart>
#include <QHttpMultiPart>

#include <QStringList>
#include <QString>

#include <QRegularExpression>
#include <QRegularExpressionMatch>

#include <QTimer>


class UI : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString welcomeVisible READ welcomeVisible NOTIFY welcomeVisibleChanged)
    Q_PROPERTY(QString chooseFunctionVisible READ chooseFunctionVisible NOTIFY chooseFunctionVisibleChanged)

    Q_PROPERTY(QString choseChannelVisible READ choseChannelVisible NOTIFY choseChannelVisibleChanged)
    Q_PROPERTY(QString perchase_PayingVisible READ perchase_PayingVisible NOTIFY perchase_PayingVisibleChanged)
    Q_PROPERTY(QString waitForCloseVisible READ waitForCloseVisible NOTIFY waitForCloseVisibleChanged)
    Q_PROPERTY(QString thanksForPerchaseVisible READ thanksForPerchaseVisible NOTIFY thanksForPerchaseVisibleChanged)

    Q_PROPERTY(QString login_signupVisible READ login_signupVisible NOTIFY login_signupVisibleChanged)
    Q_PROPERTY(QString login_ItemVisible READ login_ItemVisible NOTIFY login_ItemVisibleChanged)
    Q_PROPERTY(QString signup_ItemVisible READ signup_ItemVisible NOTIFY signup_ItemVisibleChanged)

    Q_PROPERTY(QString upload_ItemInfoVisible READ upload_ItemInfoVisible NOTIFY upload_ItemInfoVisibleChanged)
    Q_PROPERTY(QString upload_thankYouVisible READ upload_thankYouVisible NOTIFY upload_thankYouVisibleChanged)
    Q_PROPERTY(QString takeOff_thankYouVisible READ takeOff_thankYouVisible NOTIFY takeOff_thankYouVisibleChanged)
    Q_PROPERTY(QString updateItem_thankYouVisible READ updateItem_thankYouVisible NOTIFY updateItem_thankYouVisibleChanged)
    Q_PROPERTY(QString signup_thankYouVisible READ signup_thankYouVisible NOTIFY signup_thankYouVisibleChanged)
    Q_PROPERTY(QString updateUserVisible READ updateUserVisible NOTIFY updateUserVisibleChanged)
    Q_PROPERTY(QString updateItemVisible READ updateItemVisible NOTIFY updateItemVisibleChanged)
    Q_PROPERTY(QString forgetUserVisible READ forgetUserVisible NOTIFY forgetUserVisibleChanged)
    Q_PROPERTY(QString forgetUser_thankYouVisible READ forgetUser_thankYouVisible NOTIFY forgetUser_thankYouVisibleChanged)
    Q_PROPERTY(QString updateUser_thankYouVisible READ updateUser_thankYouVisible NOTIFY updateUser_thankYouVisibleChanged)

    Q_PROPERTY(QString ch1State READ ch1State NOTIFY ch1StateChanged)
    Q_PROPERTY(QString ch2State READ ch2State NOTIFY ch2StateChanged)
    Q_PROPERTY(QString ch3State READ ch3State NOTIFY ch3StateChanged)
    Q_PROPERTY(QString ch4State READ ch4State NOTIFY ch4StateChanged)
    Q_PROPERTY(QString ch5State READ ch5State NOTIFY ch5StateChanged)
    Q_PROPERTY(QString ch6State READ ch6State NOTIFY ch6StateChanged)
    Q_PROPERTY(QString ch7State READ ch7State NOTIFY ch7StateChanged)
    Q_PROPERTY(QString ch8State READ ch8State NOTIFY ch8StateChanged)
    Q_PROPERTY(QString ch9State READ ch9State NOTIFY ch9StateChanged)
    Q_PROPERTY(QString ch10State READ ch10State NOTIFY ch10StateChanged)
    Q_PROPERTY(QString ch11State READ ch11State NOTIFY ch11StateChanged)
    Q_PROPERTY(QString ch12State READ ch12State NOTIFY ch12StateChanged)
    Q_PROPERTY(QString ch13State READ ch13State NOTIFY ch13StateChanged)
    Q_PROPERTY(QString ch14State READ ch14State NOTIFY ch14StateChanged)
    Q_PROPERTY(QString ch15State READ ch15State NOTIFY ch15StateChanged)
    Q_PROPERTY(QString ch16State READ ch16State NOTIFY ch16StateChanged)
    Q_PROPERTY(QString ch17State READ ch17State NOTIFY ch17StateChanged)
    Q_PROPERTY(QString ch18State READ ch18State NOTIFY ch18StateChanged)
    Q_PROPERTY(QString ch19State READ ch19State NOTIFY ch19StateChanged)
    Q_PROPERTY(QString ch20State READ ch20State NOTIFY ch20StateChanged)
    Q_PROPERTY(QString ch21State READ ch21State NOTIFY ch21StateChanged)
    Q_PROPERTY(QString ch22State READ ch22State NOTIFY ch22StateChanged)
    Q_PROPERTY(QString ch23State READ ch23State NOTIFY ch23StateChanged)
    Q_PROPERTY(QString ch24State READ ch24State NOTIFY ch24StateChanged)
    Q_PROPERTY(QString ch25State READ ch25State NOTIFY ch25StateChanged)
    Q_PROPERTY(QString ch26State READ ch26State NOTIFY ch26StateChanged)
    Q_PROPERTY(QString ch27State READ ch27State NOTIFY ch27StateChanged)
    Q_PROPERTY(QString ch28State READ ch28State NOTIFY ch28StateChanged)

    Q_PROPERTY(QString itemQRcode READ itemQRcode NOTIFY itemQRcodeChanged)

    Q_PROPERTY(QString itemNameDisplay READ itemNameDisplay NOTIFY itemNameDisplayChanged)
    Q_PROPERTY(QString itemPriceDisplay READ itemPriceDisplay NOTIFY itemPriceDisplayChanged)
    Q_PROPERTY(QString itemRemarkDisplay READ itemRemarkDisplay NOTIFY itemRemarkDisplayChanged)

    Q_PROPERTY(QString login_signup_Text READ login_signup_Text NOTIFY login_signup_TextChanged)
    Q_PROPERTY(QString upload_ItemInfo_notify READ upload_ItemInfo_notify NOTIFY upload_ItemInfo_notifyChanged)
    Q_PROPERTY(QString forgetUser_notify READ forgetUser_notify NOTIFY forgetUser_notifyChanged)
    Q_PROPERTY(QString updateUser_notify READ updateUser_notify NOTIFY updateUser_notifyChanged)
    Q_PROPERTY(QString updateItem_notify READ updateItem_notify NOTIFY updateItem_notifyChanged)
public:
    explicit UI(QObject *parent = nullptr);
    QString welcomeVisible(){return welcomeVisible_Text;}
    QString chooseFunctionVisible(){return widgetVisible;}
    QString choseChannelVisible(){return widgetVisible;}
    QString perchase_PayingVisible(){return widgetVisible;}
    QString waitForCloseVisible(){return widgetVisible;}
    QString thanksForPerchaseVisible(){return widgetVisible;}
    QString login_signupVisible(){return widgetVisible;}
    QString upload_ItemInfoVisible(){return widgetVisible;}
    QString upload_thankYouVisible(){return widgetVisible;}
    QString takeOff_thankYouVisible(){return widgetVisible;}
    QString updateItem_thankYouVisible(){return widgetVisible;}
    QString signup_thankYouVisible(){return widgetVisible;}
    QString updateUserVisible(){return widgetVisible;}
    QString updateItemVisible(){return widgetVisible;}
    QString forgetUserVisible(){return widgetVisible;}
    QString forgetUser_thankYouVisible(){return widgetVisible;}
    QString updateUser_thankYouVisible(){return widgetVisible;}

    QString login_ItemVisible(){return itemVisible;}
    QString signup_ItemVisible(){return itemVisible;}

    QString ch1State(){return boxState;}
    QString ch2State(){return boxState;}
    QString ch3State(){return boxState;}
    QString ch4State(){return boxState;}
    QString ch5State(){return boxState;}
    QString ch6State(){return boxState;}
    QString ch7State(){return boxState;}
    QString ch8State(){return boxState;}
    QString ch9State(){return boxState;}
    QString ch10State(){return boxState;}
    QString ch11State(){return boxState;}
    QString ch12State(){return boxState;}
    QString ch13State(){return boxState;}
    QString ch14State(){return boxState;}
    QString ch15State(){return boxState;}
    QString ch16State(){return boxState;}
    QString ch17State(){return boxState;}
    QString ch18State(){return boxState;}
    QString ch19State(){return boxState;}
    QString ch20State(){return boxState;}
    QString ch21State(){return boxState;}
    QString ch22State(){return boxState;}
    QString ch23State(){return boxState;}
    QString ch24State(){return boxState;}
    QString ch25State(){return boxState;}
    QString ch26State(){return boxState;}
    QString ch27State(){return boxState;}
    QString ch28State(){return boxState;}

    QString itemQRcode(){return itemQRcode_Text;}

    QString itemNameDisplay(){return itemName;}
    QString itemPriceDisplay(){return itemPrice;}
    QString itemRemarkDisplay(){return itemRemark;}

    QString login_signup_Text(){return login_signup_Text_text;}
    QString upload_ItemInfo_notify(){return upload_ItemInfo_notify_Text;}
    QString forgetUser_notify(){return forgetUser_notify_Text;}
    QString updateUser_notify(){return updateUser_notify_Text;}
    QString updateItem_notify(){return updateItem_notify_Text;}
signals:
    void welcomeVisibleChanged();
    void chooseFunctionVisibleChanged();

    void choseChannelVisibleChanged();
    void perchase_PayingVisibleChanged();
    void waitForCloseVisibleChanged();
    void thanksForPerchaseVisibleChanged();
    void login_signupVisibleChanged();
    void upload_ItemInfoVisibleChanged();
    void upload_thankYouVisibleChanged();
    void takeOff_thankYouVisibleChanged();
    void updateItem_thankYouVisibleChanged();
    void signup_thankYouVisibleChanged();
    void updateUserVisibleChanged();
    void updateItemVisibleChanged();
    void forgetUserVisibleChanged();
    void forgetUser_thankYouVisibleChanged();
    void updateUser_thankYouVisibleChanged();

    void login_ItemVisibleChanged();
    void signup_ItemVisibleChanged();

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
    void ch13StateChanged();
    void ch14StateChanged();
    void ch15StateChanged();
    void ch16StateChanged();
    void ch17StateChanged();
    void ch18StateChanged();
    void ch19StateChanged();
    void ch20StateChanged();
    void ch21StateChanged();
    void ch22StateChanged();
    void ch23StateChanged();
    void ch24StateChanged();
    void ch25StateChanged();
    void ch26StateChanged();
    void ch27StateChanged();
    void ch28StateChanged();

    void itemQRcodeChanged();

    void itemNameDisplayChanged();
    void itemPriceDisplayChanged();
    void itemRemarkDisplayChanged();

    void login_signup_TextChanged();
    void upload_ItemInfo_notifyChanged();
    void forgetUser_notifyChanged();
    void updateUser_notifyChanged();
    void updateItem_notifyChanged();
public slots:
    void chooseFunction();
    void setFunctionHandler(int i);

    void choseChannel();
    void setBox_ch(int i);
    void execFunction();

    void setChannelVisible();
    void displayQRcode();
    void checkPayment();

    void checkChannel();


    void login_signup();
    void login();
    void signup();
    void getUser(QString acc, QString pwd);
    void signupSubmit(QString acc,QString pwd, QString bank,QString email,QString ensureEmail);
    void displayItemInfo();

    void upload_submit(QString name,QString price, QString remark);
    void updateItem_submit(QString item,QString price, QString remark);
    void updateUser_submit(QString pwd, QString bank, QString email);

    void forgetUser();
    void forgetUser_submit(QString email);

    void reset();
    void logout();
    void keepChooseChannel();
private:
    QString widgetVisible;
    QString welcomeVisible_Text;
    QString itemVisible;
    QString boxState;

    int functionHandler;
    int box_ch;

    QString userName;
    QString userBank;
    QString userEmail;
    QString userVerified;

    QString itemID;
    QString itemName;
    QString itemPrice;
    QString itemRemark;
    QString itemSeller;
    QString itemEmail;
    QString itemBankACC;

    QString itemQRcode_Text;

    QString login_signup_Text_text;
    QString upload_ItemInfo_notify_Text;
    QString forgetUser_notify_Text;
    QString updateUser_notify_Text;
    QString updateItem_notify_Text;
};

#endif // UI_H
