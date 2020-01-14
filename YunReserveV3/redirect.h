#ifndef REDIRECT_H
#define REDIRECT_H
#include <QObject>
#include <QTimer>
#include "controlchannel.h"
#include "postxml.h"
#include "database.h"

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
    Q_PROPERTY(QString toSignupVisible READ visible WRITE setVisible NOTIFY toSignupVisibleChanged)

    Q_PROPERTY(QString uploadCHVisible READ visible WRITE setVisible NOTIFY uploadCHVisibleChanged)
    Q_PROPERTY(QString to_uploadInputVisible READ visible WRITE setVisible NOTIFY to_uploadInputVisibleChanged)
    Q_PROPERTY(QString uploadFinishedVisible READ visible WRITE setVisible NOTIFY uploadFinishedVisibleChanged)

public:
    explicit redirect(QObject *parent = nullptr);
    QString visible(){return state;}
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
    void uploadFinishedVisibleChanged();
public slots:
    void timeoutReset();
    void welcomeNext();
    void toBuy();
    void toSell();
    void toDisplayPrice(int i);
    void pricePayed();
    void toSignin();
    void toSignup();
    void to_uploadCH();
    void to_uploadInput();
    void upload_finished();
    void isPricePayed();
private:
    QString state;
    QString currentCh;
};
#endif // REDIRECT_H
