var db;

function initialiseDB() {
    db = LocalStorage.openDatabaseSync("CowsSlaughterDatabase", "1.0");

    db.transaction(function(tx) {
        tx.executeSql('CREATE TABLE IF NOT EXISTS RatingTable(id INTEGER PRIMARY KEY AUTOINCREMENT, player_name TEXT, wins_number INTEGER)');
        console.log('Database initialized');
    });
}

function addPlayerRating(player_name, wins_number) {
    if (!db) initialiseDB();

    var lcplayer = player_name.toLowerCase().replace(/\s+/g, '').replace(/\b\w/g, function(l){ return l.toUpperCase() });
    db.transaction(function(tx) {
        var rs = tx.executeSql('SELECT * FROM RatingTable');
        var model = [];
        var flag = false;
        for (var i = 0; i < rs.rows.length; i++) {
            var row = rs.rows.item(i);
            if(lcplayer == row.player_name){
                db.transaction(function(tx) {
                    tx.executeSql('UPDATE RatingTable SET wins_number = ? WHERE id = ?', [row.wins_number+1, row.id]);
                });
                flag = true;
            }
        }
        if(!flag)
            db.transaction(function(tx) {
                tx.executeSql('INSERT INTO RatingTable(player_name, wins_number) VALUES(?, ?)', [lcplayer, wins_number]);
            });
    });
}

function removePlayerRating(id) {
    if (!db) initialiseDB();

    db.transaction(function(tx) {
        tx.executeSql("DELETE FROM RatingTable WHERE id = ?", [id]);
    });
}

function removeAll() {
    if (!db) initialiseDB();

    db.transaction(function(tx) {
        tx.executeSql('DELETE FROM RatingTable');
    });
}

function retrievePlayerRating(id, callback) {
    if (!db) initialiseDB();

    db.readTransaction(function(tx) {
        var result = tx.executeSql("SELECT * FROM RatingTable WHERE id = ?", [id]);
        callback(result.rows.item(0));
    });
}

function getRatings(callback) {
    if (!db) initialiseDB();

    db.transaction(function(tx) {
        var rs = tx.executeSql('SELECT * FROM RatingTable');
        var model = [];
        for (var i = 0; i < rs.rows.length; i++) {
            var row = rs.rows.item(i);
            model.push({
                           playerName: row.player_name,
                           winsNumber: row.wins_number
                       });
            model.sort(function( a, b ) {return b.winsNumber - a.winsNumber});
        }
        callback(model);
    });
}
