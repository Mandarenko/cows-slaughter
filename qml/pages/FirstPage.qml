import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Show Ratings")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        contentHeight: column.height

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingLarge
            anchors.centerIn: parent
            PageHeader {
                title: qsTr("Bulls and Cows")
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Singleplayer"
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Multiplayer"
            }
            Button {
                id: button
                anchors.horizontalCenter: parent.horizontalCenter
                text: "About"
            }
            Image {
                width: button.width
                anchors.horizontalCenter: parent.horizontalCenter
                source: "images/bull.svg"
                transform: Scale { yScale: 0.2}
            }
        }
    }
}