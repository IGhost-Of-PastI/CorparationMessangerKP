#ifndef CHATLISTMODEL_H
#define CHATLISTMODEL_H

#include <QObject>
#include <QQmlEngine>
#include <QAbstractListModel>

class ChatListModel : public QAbstractListModel
{
    Q_OBJECT
    QML_ELEMENT
public:
    ChatListModel();
};

#endif // CHATLISTMODEL_H
