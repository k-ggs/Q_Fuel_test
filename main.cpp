#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QQuickView>
#include<QQmlContext>
#include<QtQuickControls2/QtQuickControls2>
#include<framelesswindow.h>
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);


    QQmlApplicationEngine engine;
    QFontDatabase::addApplicationFont(":/Font/Resur/iconfont.ttf");
   qmlRegisterType<FramelessWindow>("FramelessWindow", 1, 0, "FramelessWindow");
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
