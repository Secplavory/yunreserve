#include "ui.h"

QPixmap ColorImageProvider::requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
{
    QByteArray ba = QUrl::toPercentEncoding(id);
    QString tmpstr = ba.constData();

    QrCode qr0 = QrCode::encodeText(tmpstr.toUtf8(), QrCode::Ecc::MEDIUM);
    QImage QrCode_Image=QImage(qr0.getSize(),qr0.getSize(),QImage::Format_RGB888);

    for (int y = 0; y < qr0.getSize(); y++) {
        for (int x = 0; x < qr0.getSize(); x++) {
            if(qr0.getModule(x, y)==0)
                QrCode_Image.setPixel(x,y,qRgb(255,255,255));
            else
                QrCode_Image.setPixel(x,y,qRgb(0,0,0));
        }
    }
    QrCode_Image=QrCode_Image.scaled(320,320,Qt::KeepAspectRatio);

    return QPixmap::fromImage(QrCode_Image);
}
UI::UI()
{
    welcome_state="1";
    state = "0";
    ch_state="1";
}

void UI::initWidget(){
    welcome_state="0";
    emit welcomeChanged();
    state = "0";
    emit chooseFunctionChanged();
    emit chooseChannelChanged();
    emit payingChanged();
}

void UI::reset(){
    initWidget();
    welcome_state="1";
    emit welcomeChanged();
}

void UI::start(){
    initWidget();
    state="1";
    emit chooseFunctionChanged();
}

void UI::perchase(){
    setFunction="1";
    initWidget();
    state="1";
    emit chooseChannelChanged();
}

void UI::initChannel(){
    emit ch01Changed();
}

void UI::setChannel(){
    if(setFunction=="1"){
        ch_state = "0";
        initChannel();
        ch_state = "1";
        QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
        db.setHostName("127.0.0.1");
        db.setUserName("root");
        db.setPassword("up42j4g8g.3");
        db.setDatabaseName("yunreserve");
        if(!db.open()){
            initWidget();
            return;
        }
    }
}

void UI::execFuntion(){
    initWidget();
    if(setFunction=="1"){
        state="1";
        emit payingChanged();
    }
}
