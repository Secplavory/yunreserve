#ifndef GEMINI_H
#define GEMINI_H
// Gemini.h
#include <QObject>
#include <QDebug>
#include <QtSql>
#include <QSqlDatabase>

class ConnectMYSQL : public QObject
{
    Q_OBJECT
public:
    Q_INVOKABLE void insertData() {
        qDebug() << "insertData() called";
    }
signals:
    void begin();
public slots:
    void checkConnect() {
        qDebug() << "testConnect() called and dosomething() so some thing now";
        QSqlDatabase dataBase=QSqlDatabase::addDatabase("QSQLITE");
        dataBase.setHostName("localhost");
        dataBase.setUserName("root");
        dataBase.setPassword("1234");
        dataBase.setDatabaseName("yunreserve");
        dataBase.open();
    }

private:

};

#endif // GEMINI_H
