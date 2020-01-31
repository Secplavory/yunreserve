#ifndef REDIRECT_H
#define REDIRECT_H
#include <QObject>
#include <QTimer>
#include "controlchannel.h"
#include "database.h"
#include "verifyuser.h"


class redirect : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString welcomeVisible READ visible WRITE setVisible NOTIFY welcomeVisibleChanged)
    Q_PROPERTY(QString buyORsellVisible READ visible WRITE setVisible NOTIFY buyORsellVisibleChanged)

    Q_PROPERTY(QString chosechannelVisible READ visible WRITE setVisible NOTIFY chosechannelVisibleChanged)
    Q_PROPERTY(QString displayPriceVisible READ visible WRITE setVisible NOTIFY displayPriceVisibleChanged)
    Q_PROPERTY(QString pricePayedVisible READ visible WRITE setVisible NOTIFY pricePayedVisibleChanged)

    Q_PROPERTY(QString signupORsigninVisible READ visible WRITE setVisible NOTIFY signupORsigninVisibleChanged)
    Q_PROPERTY(QString toSigninVisible READ visible WRITE setVisible NOTIFY toSigninVisibleChanged)
    Q_PROPERTY(QString notverifyText READ notverify NOTIFY notverified)
    Q_PROPERTY(QString signupnotifyText READ signupnotify NOTIFY signupnotifyTextchanged)

    Q_PROPERTY(QString toSignupVisible READ visible WRITE setVisible NOTIFY toSignupVisibleChanged)

    Q_PROPERTY(QString uploadCHVisible READ visible WRITE setVisible NOTIFY uploadCHVisibleChanged)
    Q_PROPERTY(QString to_uploadInputVisible READ visible WRITE setVisible NOTIFY to_uploadInputVisibleChanged)
    Q_PROPERTY(QString uploadingVisible READ visible WRITE setVisible NOTIFY setuploadingVisibleChanged)
    Q_PROPERTY(QString uploadFinishedVisible READ visible WRITE setVisible NOTIFY uploadFinishedVisibleChanged)

public:
    explicit redirect(QObject *parent = nullptr);
    QString visible(){return state;}
    QString notverify(){return verifiedText;}
    QString signupnotify(){return signupnotifyText;}

    void setVisible(QString st);

signals:
    void welcomeVisibleChanged();
    void buyORsellVisibleChanged();
    void chosechannelVisibleChanged();
    void displayPriceVisibleChanged();
    void pricePayedVisibleChanged();
    void signupORsigninVisibleChanged();
    void toSigninVisibleChanged();
    void toSignupVisibleChanged();
    void uploadCHVisibleChanged();
    void to_uploadInputVisibleChanged();
    void setuploadingVisibleChanged();
    void uploadFinishedVisibleChanged();
    void stopChecking();
    void notverified();
    void signupnotifyTextchanged();
public slots:
    void timeoutReset();
    void welcomeNext();
    void toBuy();
    void toSell();
    void toDisplayPrice(int i);
    void pricePayed();
    void toSignin();
    void toSignup();
    void to_uploadCH(QString acc, QString pwd);
    void to_uploadInput(int channel);
    void uploadGood();
    void upload_finished(QString item,QString price,QString remark);
    void isPricePayed();
    void signup(QString studentNumber,QString pwd,QString bankACC,QString email);
    void waitForUpload(QString item,QString price,QString remark);
    void backtowelcomeNext();
    void backtochoosechannel();
private:
    QString state;
    QString currentCh;
    QString userACC;
    QString box_ch;
    QString verifiedText;
    QString signupnotifyText;
};
#endif // REDIRECT_H
