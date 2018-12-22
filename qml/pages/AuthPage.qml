import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Label {
        text: "Please, enter your nickname: "
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: input.top
        font.pixelSize: Theme.fontSizeMedium
        color: "#00FFFF"
    }
    TextField {
        id: input
        text: "Name"
        anchors.centerIn: parent
        validator: RegExpValidator { regExp: /[0-9A-Za-z]+/ }
    }
    IconButton {
        icon.source: "image://theme/icon-m-enter-accept"
        anchors.left: input.right
        anchors.verticalCenter: input.verticalCenter
        onClicked: validate()
    }
    Label {
        id: errorLabel
        text: "Name field should not be empty"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: input.bottom
        font.pixelSize: Theme.fontSizeSmall
        color: "red"
        visible: false
    }

    function validate() {
        if(input.text == "")
            errorLabel.visible = true;
        else
            pageStack.push(Qt.resolvedUrl("GamePage.qml"), { player: input.text, answer: generateAnswer() });
    }

    function generateAnswer() {
        var result = [];
        while(result.length < 4) {
            var rand = Math.floor(Math.random() * 10);
            if(result.indexOf(rand) == -1)
                result = result.concat(rand);
        }
        return result;
    }
}
