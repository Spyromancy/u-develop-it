const express = require('express');
const db = require('./db/connection');
const apiRoutes = require('./routes/apiRoutes');

const PORT = process.env.PORT || 3001;
const app = express();

// express middleware
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// Use apiRoutes
app.use('/api', apiRoutes);

// Database interaction
/*
db.query(`SELECT * FROM candidates`, (err, rows) => {
    console.log(rows);
});


// GET a single candidate
db.query(`SELECT * FROM candidates where id = 1`, (err, row) => {
    if(err){
        console.log(err);
    }
    console.log(row);
});


// DELETE a candidate
db.query('delete from candidates where id = ?', 1, (err, result) => {
    if(err) {
        console.log(err);
    }
    console.log(result);
});


// Create a candidate
const sql = `insert into candidates (id, first_name, last_name, industry_connected)
values (?,?,?,?)`;
const params = [1, 'Ronald', 'Firbank', 1];

db.query(sql,params, (err, result) => {
    if(err) {
        console.log(err);
    }
    console.log(result);
});
*/

// Default response for any other request (Not Found)
app.use((req,res) => {
    res.status(404).end();
})


db.connect(err => {
    if (err) throw err;
    console.log("Database connected.");
    app.listen(PORT, () => {
        console.log(`Server running on port ${PORT}`);
    });
})
