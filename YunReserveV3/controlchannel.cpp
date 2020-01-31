#include "controlchannel.h"

controlChannel::controlChannel(QObject *parent) : QObject(parent)
{
}

bool controlChannel::openChannel(int i){
    QString statusPath="C:/Users/user/Desktop/cabinet/status.txt";
    QString filePath="C:/Users/user/Desktop/cabinet/control.txt";
    QFile file(filePath);
    if(!file.open(QIODevice::WriteOnly|QIODevice::Text)){
        qDebug()<<"無法建立檔案";
        return false;
    }else{
        QTextStream out(&file);
        out << "Cmd=Unlock-"+QString::number(i)+"\nEnd";
        file.close();
        QFile file(statusPath);
        if(file.open(QIODevice::ReadOnly|QIODevice::Text)){
            file.close();
            QFile::remove(statusPath);
        }
        return true;
    }
}

bool controlChannel::checkStatus(){
    QString filePath="C:/Users/user/Desktop/cabinet/status.txt";
    QFile file(filePath);
    if(!file.open(QIODevice::ReadOnly|QIODevice::Text)){
        qDebug() << "無法開啟檔案";
        return false;
    }else{
        while(!file.atEnd()){
            QByteArray line = file.readLine();
            QString str(line);
            qDebug() << str;
            if(str.mid(13,1)=="0"){
                return false;
            }
        }
        return true;
    }
}
