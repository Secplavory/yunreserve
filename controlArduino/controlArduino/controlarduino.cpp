#include "controlarduino.h"

ControlArduino::ControlArduino()
{
    serial = new QSerialPort(this);
    serial->setPortName("COM4");
    serial->setBaudRate(QSerialPort::Baud9600);
    serial->setDataBits(QSerialPort::Data8);
    serial->setParity(QSerialPort::NoParity);
    serial->setStopBits(QSerialPort::OneStop);
    serial->setFlowControl(QSerialPort::NoFlowControl);
    if(serial->open(QIODevice::ReadWrite)){
        qDebug() << "good";
    }
}

void ControlArduino::control_LED(QString handler){
//    foreach(const QSerialPortInfo &info, QSerialPortInfo::availablePorts()){
//        qDebug() << "Name : " << info.portName();
//        qDebug() << "Description : " << info.description();
//        qDebug() << "Manufacturer: " << info.manufacturer();
//        qDebug() << "Serial Number: " << info.serialNumber();
//        qDebug() << "System Location: " << info.systemLocation();
//    }
    if(handler=="1"){
        serial->write("1");
    }
    if(handler=="0"){
        serial->write("0");
    }
}

void ControlArduino::readData(){
    qDebug() << "readData called";
}
