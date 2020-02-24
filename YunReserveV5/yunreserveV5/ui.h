#ifndef UI_H
#define UI_H

#include <QObject>
#include <QtDebug>
#include <QQuickImageProvider>
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

class UI : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString welcome READ welcome NOTIFY welcomeChanged)
    Q_PROPERTY(QString chooseFunction READ chooseFunction NOTIFY chooseFunctionChanged)
    Q_PROPERTY(QString chooseChannel READ chooseChannel NOTIFY chooseChannelChanged)
    Q_PROPERTY(QString paying READ paying NOTIFY payingChanged)

    Q_PROPERTY(QString ch01 READ ch01 NOTIFY ch01Changed)
public:
    UI();
    void initWidget();
    void initChannel();
    QString welcome(){return welcome_state;}
    QString chooseFunction(){return state;}
    QString chooseChannel(){return state;}
    QString paying(){return state;}

    QString ch01(){return ch_state;}
signals:
    void welcomeChanged();
    void chooseFunctionChanged();
    void chooseChannelChanged();
    void payingChanged();

    void ch01Changed();
public slots:
    void reset();
    void start();
    void perchase();
    void execFuntion();

    void setChannel();
private:
    QString welcome_state;
    QString state;
    QString setFunction;
    QString ch_state;
};

#endif // UI_H
