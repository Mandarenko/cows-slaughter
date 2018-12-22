import QtQuick 2.0
import QtQuick.LocalStorage 2.0

Item {
    property var database

    Component.onCompleted: {
        database = LocalStorage.openDatabaseSync("CowsSlaughterDatabase", "1.0")
        database.transaction(function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS RatingTable(
                 id INTEGER PRIMARY KEY AUTOINCREMENT,
                 player_name TEXT,
                 wins_number INTEGER)");
        });
    }

    function createPlayerRating(player_name, wins_number) {
        database = LocalStorage.openDatabaseSync("CowsSlaughterDatabase", "1.0");
        database.transaction(function(tx) {
            tx.executeSql("INSERT INTO RatingTable(player_name, wins_number)
                                VALUES(?, ?)", [player_name, wins_number]);
        });
    }

    function updateTransaction(id, player_name, wins_number) {
        database = LocalStorage.openDatabaseSync("CowsSlaughterDatabase", "1.0");
        database.transaction(function(tx) {
            tx.executeSql("UPDATE RatingTable SET player_namer = ?, wins_number = ?
                                 WHERE id = ?", [player_name, wins_number, id]);
        });
    }

    function removePlayerRating(id) {
        database = LocalStorage.openDatabaseSync("CowsSlaughterDatabase", "1.0");
        database.transaction(function(tx) {
            tx.executeSql("DELETE FROM RatingTable WHERE id = ?", [id]);
        });
    }

    function retrievePlayerRatings(callback) {
        database = LocalStorage.openDatabaseSync("CowsSlaughterDatabase", "1.0");
        database.readTransaction(function(tx) {
            var result = tx.executeSql("SELECT * FROM RatingTable ORDER BY id ASC");
            callback(result.rows)
        });
    }

    function retrievePlayerRating(id, callback) {
        database = LocalStorage.openDatabaseSync("CowsSlaughterDatabase", "1.0");
        database.readTransaction(function(tx) {
            var result = tx.executeSql("SELECT * FROM RatingTable WHERE id = ?", [id]);
            callback(result.rows.item(0));
        });
    }
}

