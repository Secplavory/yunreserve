#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QApplication>
#include <QWindow>

#include "ui.h"


int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
    qputenv("QT_OPENGL","angle");
//    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
//    QApplication::addLibraryPath("./plugins");

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQmlContext* context = engine.rootContext();
    UI ui;
    DB db;
    context->setContextProperty("ui",&ui);
    context->setContextProperty("db",&db);

    engine.addImageProvider(QLatin1String("colors"), new ColorImageProvider);
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));
    return app.exec();
}
