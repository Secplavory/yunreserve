#ifndef CONTROLCHANNEL_H
#define CONTROLCHANNEL_H

#include <QObject>
#include <QtDebug>
//匯入製作txt使用之套件
#include <QFile>
#include <QTextStream>
#include <QIODevice>
//匯入製作txt使用之套件完成

class controlChannel : public QObject
{
    Q_OBJECT

public:
    explicit controlChannel(QObject *parent = nullptr);


public slots:
    void openChannel(int i);

private:

};






#endif // CONTROLCHANNEL_H
