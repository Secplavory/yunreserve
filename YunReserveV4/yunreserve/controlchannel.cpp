#include "controlchannel.h"


controlChannel::controlChannel()
{
}

bool controlChannel::openChannel(int i){
    QString filePath="C:/Users/user/Desktop/cabinet/Control.txt";
    QString statuPath="C:/Users/user/Desktop/cabinet/Status.txt";
    QFile file(filePath);
    if(!file.open(QIODevice::WriteOnly|QIODevice::Text)){
        qDebug()<<"無法建立檔案";
        return false;
    }else{
        QTextStream out(&file);
        out << "Cmd=Unlock-"+QString::number(i)+"\nEnd";
        file.close();
        QEventLoop loop;
        QTimer::singleShot(5000,&loop,SLOT(quit()));
        loop.exec();
        QFile file(statuPath);
        file.remove();
        return true;
    }

}

bool controlChannel::checkChannel(){
    QString filePath="C:/Users/user/Desktop/cabinet/Status.txt";
    QString statusPath="C:/Users/user/Desktop/cabinet/Status.txt";
    QFile file(filePath);
    if(!file.open(QIODevice::ReadOnly|QIODevice::Text)){
        qDebug() << "無法開啟檔案";
        return false;
    }else{
        while(!file.atEnd()){
            QByteArray line = file.readLine();
            QString str(line);
            qDebug() << str;
            if(str.mid(6,1)=="0"){
                file.close();
                QFile file(statusPath);
                file.remove();
                return false;
            }
        }
        return true;
    }
}
