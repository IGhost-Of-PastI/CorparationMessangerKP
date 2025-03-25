import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    id: authPage
    width: 600
    height: 600
    visible: true
    title: qsTr("Авторизация")

    property bool emailValid: false
    property bool passwordValid: false
    property bool canLogin: emailValid && passwordValid

    // Сигнал для отправки данных авторизации
    signal loginRequested(string email, string password)

    // background: Rectangle {
    //     color: "#f5f5f5"
    // }
    ColumnLayout {
        anchors.centerIn: parent
        width: Math.min(parent.width * 0.8, 400)
        spacing: 20

        Label {
            text: qsTr("Вход в систему")
            font.pixelSize: 24
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
            bottomPadding: 10
        }

        // Поле для email
        ColumnLayout {
            spacing: 5

            Label {
                text: qsTr("Email")
                font.pixelSize: 14
            }

            TextField {
                id: emailField
                Layout.fillWidth: true
                placeholderText: qsTr("Введите ваш email")
                inputMethodHints: Qt.ImhEmailCharactersOnly | Qt.ImhNoPredictiveText

                // validator: RegularExpressionValidator {
                //     regularExpression: /^[AZ0-9._%+-]+@[AZ0-9.-]+\.[AZ]{2,}$/
                // }
                onTextChanged: {
                    authPage.emailValid = acceptableInput
                    errorLabel.text = ""
                }

                onEditingFinished: {
                    if (!authPage.emailValid && text !== "") {
                        errorLabel.text = qsTr("Введите корректный email")
                    }
                }
            }
        }

        // Поле для пароля
        ColumnLayout {
            spacing: 5

            Label {
                text: qsTr("Пароль")
                font.pixelSize: 14
            }

            TextField {
                id: passwordField
                Layout.fillWidth: true
                placeholderText: qsTr("Введите ваш пароль")
                echoMode: TextInput.Password
                inputMethodHints: Qt.ImhNoPredictiveText

                // onTextChanged: {
                //     passwordValid = text.length >= 6
                //     errorLabel.text = ""
                // }

                // onEditingFinished: {
                //     if (!passwordValid && text !== "") {
                //         errorLabel.text = qsTr(
                //                     "Пароль должен содержать не менее 6 символов")
                //     }
                // }
            }
        }

        // Кнопка входа
        Button {
            id: loginButton
            text: qsTr("Войти")
            Layout.fillWidth: true
            // enabled: canLogin
            highlighted: true

            onClicked: {
                authPage.loginRequested(emailField.text, passwordField.text)
            }

            // background: Rectangle {
            //     radius: 5
            //     color: loginButton.enabled ? "#4285f4" : "#cccccc"
            // }
        }

        // Ссылка на регистрацию
        Label {
            text: qsTr("Нет аккаунта? Зарегистрируйтесь")
            font.pixelSize: 12
            color: "#4285f4"
            Layout.alignment: Qt.AlignHCenter

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    // Здесь можно добавить переход на страницу регистрации
                    console.log("Переход на регистрацию")
                }
            }
        }

        // Метка для отображения ошибок
        Label {
            id: errorLabel
            Layout.fillWidth: true
            wrapMode: Text.Wrap
            color: "red"
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            text: "Error"
        }
    }

    // Состояние загрузки (можно активировать при отправке запроса)
    // states: State {
    //     name: "loading"
    //     PropertyChanges {
    //         target: loginButton
    //         enabled: false
    //         text: qsTr("Загрузка...")
    //     }
    // }
}
