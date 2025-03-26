#ifndef SQLCONNECTION_H
#define SQLCONNECTION_H
#include <QSqlDatabase>
#include <memory>
class SqlConnection
{
public:
    SqlConnection()=delete;
    static inline QSqlDatabase* getConnection()
    {
        if(!_connection)
        {
            _connection = new QSqlDatabase("QPSQL");
            _connection->setHostName("localhost");
            _connection->setPort(5432);
            _connection->setUserName("postgres");
            _connection->setPassword("masterkey");
            _connection->setDatabaseName("Messenger");

            if (!_connection->open()) {
                qDebug() << "Error: Unable to connect to database:" << m_connection->lastError().text();
            }
        }
        return _connection;
    }
private:
    static inline std::unique_ptr<QSqlDatabase> _connection =nullptr;
};

#endif // SQLCONNECTION_H
