#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "controlarduino.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
    qputenv("QT_OPENGL","angle");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQmlContext* context = engine.rootContext();
    ControlArduino CA;
    context->setContextProperty("CA",&CA);

    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));
    return app.exec();
}
