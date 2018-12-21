import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property int spentAttempts
    Label {
        id:label
        text: "You Won"
        anchors.centerIn: parent
        font.pixelSize: Theme.fontSizeHuge
        font.bold: true
        color: "#00FFFF"
    }
    Label {
        text: "You guessed from " + spentAttempts + " attempts"
        anchors.top: label.bottom
        anchors.topMargin: Theme.paddingMedium
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: Theme.fontSizeLarge
        color: "#00FFFF"
    }
}
