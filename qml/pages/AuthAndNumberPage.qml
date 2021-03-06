import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property string players: ""
    property var numbers: []
    Column {
        anchors.centerIn: parent
        spacing: Theme.paddingLarge
        Label {
            text: qsTr("Player " + (players == "" ? "1" : "2"))
            font.pixelSize: Theme.fontSizeHuge
            color: "#00FFFF"
        }
        Label {
            text: "Please, enter your nickname: "
            font.pixelSize: Theme.fontSizeMedium
            color: "#00FFFF"
        }
        TextField {
            id: input
            text: "Name"
            anchors.margins: Theme.paddingLarge
            validator: RegExpValidator { regExp: /[0-9A-Za-z]+/ }
        }
        Label {
            text: "Make a number:"
            color: "#00FFFF"
        }
        Row {
            x: Theme.horizontalPageMargin
            width: parent.width
            spacing: Theme.paddingLarge
            Repeater {
                id: repeater
                model: 4
                delegate: Rectangle {
                    width: numberField.width
                    height: numberField.height
                    color: "#20B2AA"
                    radius: 20
                    opacity: 0.3
                    border { color: "green"; width: 5 }
                    TextField {
                        id: numberField
                        validator: IntValidator { bottom: 0; top: 9 }
                        font.bold: true
                        font.pixelSize: Theme.fontSizeHuge
                    }
                }
            }
        }
        Button {
            text: "Accept"
            onClicked: validatePage()
        }
        Label {
            id: errorLabel
            font.pixelSize: Theme.fontSizeSmall
            color: "red"
            visible: false
        }
    }

    function validatePage() {
        if(input.text == "") {
            errorLabel.text = "Name field should not be empty";
            errorLabel.visible = true;
            return;
        }
        if(input.text == players){
            errorLabel.text = "This name is already taken";
            errorLabel.visible = true;
            return;
        }

        var number = validateNumber();
        if(!number.valid) {
            errorLabel.text = "Invalid number";
            errorLabel.visible = true;
            return;
        }
        if(players.length < 1) {
            pageStack.replace(Qt.resolvedUrl("AuthAndNumberPage.qml"), { players: input.text, numbers: number.numberMade});
        }
        else {
            pageStack.replace(Qt.resolvedUrl("GamePage.qml"), {players: [{ name: players, answer: number.numberMade, statList: [], attempt: 1},
                              { name: input.text, answer: numbers, statList: [], attempt: 1}], currentPlayer: 0});
        }
    }

    function validateNumber() {
        var result = [+repeater.itemAt(0).children[0].text, +repeater.itemAt(1).children[0].text, +repeater.itemAt(2).children[0].text, +repeater.itemAt(3).children[0].text];
        for(var i = 0; i < 3; i++)
            for(var j = i + 1; j < 4; j++)
                if(result[i] == result[j])
                    return { valid: false };
        return { numberMade: result, valid: true };
    }
}
