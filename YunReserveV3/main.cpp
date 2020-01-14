#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "redirect.h"
#include "database.h"
#include "controlchannel.h"
//#include "QZXing.h"
#include <QQuickImageProvider>



int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
    qputenv("QT_OPENGL", "angle");
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQmlContext* context = engine.rootContext();
//    QZXing::registerQMLTypes();
//    QZXing::registerQMLImageProvider(engine);
    redirect rd;
    database db;
    controlChannel cc;
    context->setContextProperty("redirect",&rd);
    context->setContextProperty("database",&db);
    context->setContextProperty("controlChannel",&cc);
    engine.addImageProvider(QLatin1String("colors"), new ColorImageProvider);
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));
    return app.exec();
}
