#ifndef CONTROLCHANNEL_H
#define CONTROLCHANNEL_H

#include <QtDebug>
#include <QFile>
#include <QTextStream>
#include <QIODevice>

class controlChannel
{
public:
    controlChannel();
    bool checkChannel();
    bool openChannel(int i);
};

#endif // CONTROLCHANNEL_H
