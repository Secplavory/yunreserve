#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "ui.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
    qputenv("QT_OPENGL","angle");


    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQmlContext* context = engine.rootContext();
    UI ui;
    context->setContextProperty("ui",&ui);

    engine.addImageProvider(QLatin1String("colors"), new ColorImageProvider);

    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));
    return app.exec();
}
