import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property var answerWas
    Label {
        id:label
        text: "You Died"
        anchors.centerIn: parent
        font.pixelSize: Theme.fontSizeHuge
        font.bold: true
        color: "Red"
    }
    Label {
        id: answerLabel
        text: "Answer was " + answerWas
        anchors.top: label.bottom
        anchors.topMargin: Theme.paddingMedium
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: Theme.fontSizeLarge
        color: "Red"
    }
    Button {
        text: "To main menu"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: answerLabel.bottom
        onClicked: reloadApp()
    }

    function reloadApp() {
        pageStack.clear();
        pageStack.push(Qt.resolvedUrl("MainMenu.qml"));
    }
}
