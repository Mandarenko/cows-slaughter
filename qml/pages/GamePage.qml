import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property int maxAttempt: 8
    property var players
    property int currentPlayer
    id: page
    SilicaListView{
        id: listView
        model: players[currentPlayer].statList
        anchors.fill: parent

        header: Column {
            width: parent.width
            PageHeader {
                title: qsTr(players[currentPlayer].name)
            }
            Label{
                font.bold: true
                font.pixelSize: Theme.fontSizeExtraLarge
                color: "yellow"
                text: "Enter 4 different numbers: "
            }

            Row {
                x: Theme.horizontalPageMargin
                width: parent.width
                spacing: Theme.paddingLarge
                Rectangle {
                    width: numberField1.width
                    height: numberField1.height
                    color: "#20B2AA"
                    radius: 20
                    opacity: 0.3
                    border { color: "green"; width: 5 }
                    TextField {
                        id: numberField1
                        validator: IntValidator { bottom: 0; top: 9 }
                        font.bold: true
                        font.pixelSize: Theme.fontSizeHuge
                    }
                }
                Rectangle {
                    width: numberField2.width
                    height: numberField2.height
                    color: "#20B2AA"
                    radius: 20
                    opacity: 0.3
                    border { color: "green"; width: 5 }
                    TextField {
                        id: numberField2
                        validator: IntValidator { bottom: 0; top: 9 }
                        font.bold: true
                        font.pixelSize: Theme.fontSizeHuge
                    }
                }
                Rectangle {
                    width: numberField3.width
                    height: numberField3.height
                    color: "#20B2AA"
                    radius: 20
                    opacity: 0.3
                    border { color: "green"; width: 5 }
                    TextField {
                        id: numberField3
                        validator: IntValidator { bottom: 0; top: 9 }
                        font.bold: true
                        font.pixelSize: Theme.fontSizeHuge
                    }
                }
                Rectangle {
                    width: numberField4.width
                    height: numberField4.height
                    color: "#20B2AA"
                    radius: 20
                    opacity: 0.3
                    border { color: "green"; width: 5 }
                    TextField {
                        id: numberField4
                        validator: IntValidator { bottom: 0; top: 9 }
                        font.bold: true
                        font.pixelSize: Theme.fontSizeHuge
                    }
                }
                IconButton {
                    id: acceptButton
                    icon.source: "image://theme/icon-m-enter-accept"
                    onClicked: checkNumber([numberField1.text, numberField2.text, numberField3.text, numberField4.text])
                }
            }
        }
        delegate: BackgroundItem {
            id: delegate
            Item {
                anchors.fill: parent
                Label {
                    width: parent.width - bullsLabel.width - cowsLabel.width - Theme.horizontalPageMargin * 3
                    elide: "ElideRight"
                    x: Theme.horizontalPageMargin
                    text: modelData.Numbers
                    anchors.verticalCenter: parent.verticalCenter
                    color: modelData.Error ? "red" : Theme.primaryColor
                }
                Label {
                    id: bullsLabel
                    text: 'B: ' + modelData.Bulls
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.margins: {
                        right: Theme.horizontalPageMargin
                    }
                    color: modelData.Error ? "red" : Theme.primaryColor
                }
                Label {
                    id: cowsLabel
                    text: 'C: ' + modelData.Cows
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: bullsLabel.left
                    anchors.margins: {
                        right: Theme.horizontalPageMargin
                    }
                    color: modelData.Error ? "red" : Theme.primaryColor
                }
            }
        }
    }

    function checkNumber(nums) {
        if(players.length == 1)
            if(players[currentPlayer].attempt > maxAttempt) {
                pageStack.push(Qt.resolvedUrl("GameOverPage.qml"), { answerWas: players[currentPlayer].answer });
                return;
            }
        var cows = 0, bulls = 0, tmp = [];
        for(var i = 0; i <= 3; i++){
            if(tmp.indexOf(+nums[i]) == -1)
                tmp.push(+nums[i])
            else {
                players[currentPlayer].statList.push({Numbers: "Wrong input: Similar Numbers.", Bulls: "-", Cows: "-", Error: true});
                playersChanged();
                if(players.length == 2) pageStack.replace(Qt.resolvedUrl("GamePage.qml"), {players: players, currentPlayer: (currentPlayer + 1) % 2} );
                return;
            }
            for(var j = 0; j <=3; j++)
                if(nums[i] == players[currentPlayer].answer[j]) {
                    if(i == j) bulls++;
                    else cows++;
                    break;
                }
        }
        if(bulls === 4) {
            pageStack.push(Qt.resolvedUrl("YouWonPage.qml"), { player: players[currentPlayer].name, spentAttempts: players[currentPlayer].attempt });
            return;
        }
        players[currentPlayer].attempt++;
        players[currentPlayer].statList.push({Numbers: ("" + (+nums[0]) + (+nums[1]) + (+nums[2]) + (+nums[3])), Bulls: bulls, Cows: cows, Error: false});
        playersChanged();
        if(players.length == 2) pageStack.replace(Qt.resolvedUrl("GamePage.qml"), {players: players, currentPlayer: (currentPlayer + 1) % 2} );
    }
}
