#ifndef CHANNEL_H
#define CHANNEL_H

#include <QObject>

class channel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString ch01 READ ch01 WRITE setVisible NOTIFY ch01Changed)
public:
    explicit channel(QObject *parent = nullptr);
    QString ch01(){return state;}

    void setVisible(QString handler, QString box_ch);
signals:
    void ch01Changed();
private:
    QString state;
};

#endif // CHANNEL_H
