import QtQuick 2.0
import Sailfish.Silica 1.0
import "../"

Page {
    id: page

    Column {
        width: page.width
        spacing: Theme.paddingLarge

        PageHeader {
            title: qsTr("About")
        }
        Label {
            text: qsTr("Bulls and Cows is an old code-breaking mind or paper and pencil game for two or more players,
predating the commercially marketed board game Mastermind.
It is a game that may date back a century or more which uses numbers or words. It is played by two opponents.")
            wrapMode: Text.Wrap
            anchors {
                left: parent.left
                right: parent.right
                rightMargin: Theme.paddingLarge
                leftMargin: Theme.paddingLarge
            }
            horizontalAlignment: Text.horizontalCenter
        }
        Label {
            text: qsTr("Developers:")
            anchors {
                left: parent.left
                right: parent.right
                rightMargin: Theme.paddingLarge
                leftMargin: Theme.paddingLarge
            }
        }
        Label {
            text: qsTr("Konstantin Samorodov, Medvedev Nikita")
            wrapMode: Text.Wrap
            anchors {
                left: parent.left
                right: parent.right
                rightMargin: Theme.paddingLarge
                leftMargin: Theme.paddingLarge
            }
        }

        Label {
            text: qsTr("Yaroslavl 2018")
            anchors {
                left: parent.left
                right: parent.right
                rightMargin: Theme.paddingLarge
                leftMargin: Theme.paddingLarge
            }
            horizontalAlignment: Text.horizontalCenter
        }
    }
}
