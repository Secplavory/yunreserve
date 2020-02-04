#ifndef UI_H
#define UI_H
#include <QObject>
#include <QDebug>

#include "db.h"

class UI : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString welcomeVisible READ welcomeVisible NOTIFY welcomeVisibleChanged)
    Q_PROPERTY(QString chooseFunctionVisible READ chooseFunctionVisible NOTIFY chooseFunctionVisibleChanged)

    Q_PROPERTY(QString choseChannelVisible READ choseChannelVisible NOTIFY choseChannelVisibleChanged)
    Q_PROPERTY(QString perchase_PayingVisible READ perchase_PayingVisible NOTIFY perchase_PayingVisibleChanged)
    Q_PROPERTY(QString thanksForPerchaseVisible READ thanksForPerchaseVisible NOTIFY thanksForPerchaseVisibleChanged)
    Q_PROPERTY(QString login_signupVisible READ login_signupVisible NOTIFY login_signupVisibleChanged)
    Q_PROPERTY(QString upload_ItemInfoVisible READ upload_ItemInfoVisible NOTIFY upload_ItemInfoVisibleChanged)
    Q_PROPERTY(QString upload_thankYouVisible READ upload_thankYouVisible NOTIFY upload_thankYouVisibleChanged)
    Q_PROPERTY(QString takeOff_thankYouVisible READ takeOff_thankYouVisible NOTIFY takeOff_thankYouVisibleChanged)
    Q_PROPERTY(QString updateItem_thankYouVisible READ updateItem_thankYouVisible NOTIFY updateItem_thankYouVisibleChanged)
    Q_PROPERTY(QString signup_thankYouVisible READ signup_thankYouVisible NOTIFY signup_thankYouVisibleChanged)
    Q_PROPERTY(QString updateUserVisible READ updateUserVisible NOTIFY updateUserVisibleChanged)
    Q_PROPERTY(QString updateItemVisible READ updateItemVisible NOTIFY updateItemVisibleChanged)
    Q_PROPERTY(QString forgetUserVisible READ forgetUserVisible NOTIFY forgetUserVisibleChanged)
    Q_PROPERTY(QString forgetUser_thankYouVisible READ forgetUser_thankYouVisible NOTIFY forgetUser_thankYouVisibleChanged)



public:
    explicit UI(QObject *parent = nullptr);
    QString welcomeVisible(){return welcomeVisible_Text;}
    QString chooseFunctionVisible(){return widgetVisible;}
    QString choseChannelVisible(){return widgetVisible;}
    QString perchase_PayingVisible(){return widgetVisible;}
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

    void displayQRcode();
signals:
    void welcomeVisibleChanged();
    void chooseFunctionVisibleChanged();

    void choseChannelVisibleChanged();
    void perchase_PayingVisibleChanged();
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
public slots:
    void chooseFunction();
    void setFunctionHandler(int i);

    void choseChannel();
    void setBox_ch(int i);
    void execFunction();

    void checkPayment();
private:
    QString widgetVisible;
    QString welcomeVisible_Text;

    int functionHandler;
    int box_ch;

};

#endif // UI_H
