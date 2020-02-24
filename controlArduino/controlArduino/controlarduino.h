#ifndef CONTROLARDUINO_H
#define CONTROLARDUINO_H

#include <QObject>
#include <QDebug>

#include <QSerialPort>
#include <QSerialPortInfo>
#include <QIODevice>


class ControlArduino : public QObject
{
    Q_OBJECT
public:
    ControlArduino();
signals:

public slots:
    void control_LED(QString handler);
    void readData();

private:
    QSerialPort *serial;
};

#endif // CONTROLARDUINO_H
