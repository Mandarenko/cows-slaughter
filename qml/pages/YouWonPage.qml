import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property int spentAttempts
    property string player: "You"
    Label {
        id:label
        text: player + " Won"
        anchors.centerIn: parent
        font.pixelSize: Theme.fontSizeHuge
        font.bold: true
        color: "#00FFFF"
    }
    Label {
        id: guessLabel
        text: "Guessed from " + spentAttempts + " attempts"
        anchors.top: label.bottom
        anchors.topMargin: Theme.paddingMedium
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: Theme.fontSizeLarge
        color: "#00FFFF"
    }
    Button {
        text: "To main menu"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: guessLabel.bottom
        onClicked: reloadApp()
    }

    function reloadApp() {
        pageStack.clear();
        pageStack.push(Qt.resolvedUrl("MainMenu.qml"));
    }
}
