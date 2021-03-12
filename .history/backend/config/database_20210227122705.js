 const mysql = require('mysql');

// create the connection to database
const db = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'pos_db'
  });
   
  

// db.connect((err) => {
//              if (!err) {
//                  return console.error('error: ' + err.message);
//                }
//                console.log('Connected to the MySQL server.');
//          })

module.exports = db;