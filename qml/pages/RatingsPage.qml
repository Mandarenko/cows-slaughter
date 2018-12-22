import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0

import "../DB.js" as DB

Page {
    id: page

    property var ratingsList: []

    SilicaListView {
        onVisibleChanged: if (visible) { loadDataFromDB() }
        id: listView
        model: ratingsList
        anchors.fill: parent
        header: PageHeader {
            title: qsTr("")
        }

        Label {
            id: playerLabel
            x: Theme.horizontalPageMargin
            text: "Player name:"
            color: Theme.secondaryHighlightColor
            y: 70
            font.pixelSize: Theme.fontSizeLarge
        }
        Label {
            id: winsLabel
            text: "Wins quantity:"
            y: 70
            anchors.right: parent.right
            anchors.margins: {
                right: Theme.horizontalPageMargin
            }
           color: Theme.secondaryHighlightColor
           font.pixelSize: Theme.fontSizeLarge
        }

        delegate: BackgroundItem {
            id: delegate
            Item {
                anchors.fill: parent
                Label {
                    width: parent.width - yearLabel.width - Theme.horizontalPageMargin * 3
                    elide: "ElideRight"
                    x: Theme.horizontalPageMargin
                    text: modelData.playerName
                    anchors.verticalCenter: parent.verticalCenter
                    color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
                }
                Label {
                    id: yearLabel
                    text: modelData.winsNumber
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.margins: {
                        right: Theme.horizontalPageMargin
                    }
                    color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
                }
            }
        }

        VerticalScrollDecorator {}
    }

    function loadDataFromDB() {
        DB.getRatings(function(favs) {
            ratingsList = favs;
        });
    }
}
