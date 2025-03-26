#ifndef LOGINEDUSER_H
#define LOGINEDUSER_H

#include <QObject>
#include <QQmlEngine>

struct UserData
{
};

class LoginedUser : public QObject
{
    Q_OBJECT
    QML_SINGLETON
public:
    explicit LoginedUser(QObject *parent = nullptr);
};

#endif // LOGINEDUSER_H
