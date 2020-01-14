#ifndef WIDGETCHANGE_H
#define WIDGETCHANGE_H

#include <QObject>
#include <QDebug>
#include <QQmlEngine>
#include <QQmlComponent>
#include <QQuickItem>
#include <QStringLiteral>
#include <QQmlProperty>
#include <QQuickView>
#include <QElapsedTimer>

class WidgetChange : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool getVisibleValue READ getVisibleValue WRITE setVisibleValue NOTIFY VisibleValueChanged)



public:
    explicit WidgetChange(QObject* parent = nullptr);

    Q_INVOKABLE void fadeOut() {
        qDebug() << "fade Called";
        //QQmlEngine engine;
        //QQmlComponent componet(&engine, QUrl(QStringLiteral("qrc:/main.qml")));
        //QObject* object = componet.create();
        //QQuickView view(QUrl(QStringLiteral("qrc:/main.qml")));
        //QQmlEngine engine;
        //QQmlComponent component(&engine,QUrl(QStringLiteral("qrc:/main.qml")));
        //QObject* object = ->
        //QObject* welcomeIMG = component.findChild<QObject*>("welcome");
        //welcomeIMG->r
    }

signals:
    void VisibleValueChanged();

public slots:



private:
    void getVisibleValue();
    void setVisibleValue(double value);





};


#endif // WIDGETCHANGE_H
