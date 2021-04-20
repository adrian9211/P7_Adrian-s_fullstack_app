const mysql = require("mysql");

let dbConfig = mysql.createConnection({
  host: '172.20.144.1',
  user: 'root',
  password: 'paswd',
  database: 'groupmania',
  multipleStatements: true
});

dbConfig.connect(function(err) {
  if (err) {
    console.error('error connecting: ' + err.stack);
    return;
  }
  console.log('connected as id ' + dbConfig.threadId);
});


module.exports = dbConfig;

