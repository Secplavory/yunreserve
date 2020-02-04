#ifndef DB_H
#define DB_H

#include <QQuickImageProvider>

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>

#include "qrcode_generater/QrCode.hpp"
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

class DB : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString ch1State READ ch1State NOTIFY ch1StateChanged)
    Q_PROPERTY(QString ch2State READ ch2State NOTIFY ch2StateChanged)
    Q_PROPERTY(QString ch3State READ ch3State NOTIFY ch3StateChanged)
    Q_PROPERTY(QString ch4State READ ch4State NOTIFY ch4StateChanged)
    Q_PROPERTY(QString ch5State READ ch5State NOTIFY ch5StateChanged)
    Q_PROPERTY(QString ch6State READ ch6State NOTIFY ch6StateChanged)



    Q_PROPERTY(QString itemName READ itemName NOTIFY itemNameChanged)
    Q_PROPERTY(QString itemPrice READ itemPrice NOTIFY itemPriceChanged)
    Q_PROPERTY(QString itemRemark READ itemRemark NOTIFY itemRemarkChanged)
    Q_PROPERTY(QString itemQRcode READ itemQRcode NOTIFY itemQRcodeChanged)

public:
    DB();
    QString ch1State(){return boxState;}
    QString ch2State(){return boxState;}
    QString ch3State(){return boxState;}
    QString ch4State(){return boxState;}
    QString ch5State(){return boxState;}
    QString ch6State(){return boxState;}

    QString itemName(){return itemName_Text;}
    QString itemPrice(){return itemPrice_Text;}
    QString itemRemark(){return itemRemark_Text;}
    QString itemQRcode(){return itemQRcode_Text;}


    void perchase();
    void displayQRcode();
    bool checkPayment(int i);
signals:
    void ch1StateChanged();
    void ch2StateChanged();
    void ch3StateChanged();
    void ch4StateChanged();
    void ch5StateChanged();
    void ch6StateChanged();

    void itemNameChanged();
    void itemPriceChanged();
    void itemRemarkChanged();
    void itemQRcodeChanged();
public slots:
    void receiveFunctionHandler(int i);
    void setBox_ch(int i);
    void execFunction();


private:
    QString boxState;
    int functionHandler;
    int box_ch;
    QSqlDatabase db;

    QString itemName_Text;
    QString itemPrice_Text;
    QString itemRemark_Text;
    QString itemSeller_Text;
    QString itemQRcode_Text;
};

#endif // DB_H
