import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property int attempt: 8
    property var statList: []
    property var answer
    id: page
    SilicaListView{
        id: listView
        model: statList
        anchors.fill: parent

        header: Column {
            width: parent.width
            PageHeader {
                title: qsTr("Singleplayer")
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
                    color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
                }
                Label {
                    id: bullsLabel
                    text: 'B: ' + modelData.Bulls
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.margins: {
                        right: Theme.horizontalPageMargin
                    }
                    color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
                }
                Label {
                    id: cowsLabel
                    text: 'C: ' + modelData.Cows
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: bullsLabel.left
                    anchors.margins: {
                        right: Theme.horizontalPageMargin
                    }
                    color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
                }
            }
        }
    }

    function checkNumber(nums) {
        if(attempt <= 0) {
            pageStack.push(Qt.resolvedUrl("GameOverPage.qml"), { answerWas: answer });
            return;
        }
        var cows = 0, bulls = 0, tmp = [-1, -1, -1, -1];
        for(var i = 0; i <= 3; i++)
            for(var j = 0; j <=3; j++)
                if(nums[i] == answer[j]) {
                    if(i == j){
                        bulls++;
                        cows++;
                        tmp[j] = answer[j];
                    }
                    else if(tmp[j] != answer[j]){
                        cows++;
                        tmp[j] = answer[j];
                    }
                    break;
                }
        if(bulls === 4) {
            pageStack.push(Qt.resolvedUrl("YouWonPage.qml"), { spentAttempts: 8 - attempt + 1 });
            return;
        }
        attempt--;
        statList = statList.concat({Numbers: (nums[0].toString() + nums[1].toString() + nums[2].toString() + nums[3].toString()), Bulls: bulls, Cows: cows-bulls});
    }
}
