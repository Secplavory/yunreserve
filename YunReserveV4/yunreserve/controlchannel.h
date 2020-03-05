#ifndef CONTROLCHANNEL_H
#define CONTROLCHANNEL_H

#include <QtDebug>
#include <QFile>
#include <QTextStream>
#include <QIODevice>
#include <QEventLoop>
#include <QTimer>

class controlChannel
{
public:
    controlChannel();
    bool checkChannel();
    bool openChannel(int i);
    void admin_openChannel(int i);
};

#endif // CONTROLCHANNEL_H
