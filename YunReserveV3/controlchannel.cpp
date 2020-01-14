#include "controlchannel.h"

controlChannel::controlChannel(QObject *parent) : QObject(parent)
{
}

void controlChannel::openChannel(int i){
    QString filePath="C:/Users/user/Desktop/cabinet/control.txt";
    QFile file(filePath);
    if(!file.open(QIODevice::WriteOnly|QIODevice::Text)){
        qDebug()<<"無法建立檔案";
        return;
    }else{
        QTextStream out(&file);
        out << QString::number(i);
        file.close();
    }
}
