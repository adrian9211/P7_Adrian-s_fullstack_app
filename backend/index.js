// import express
const express = require('express');
// import cors
const cors = require('cors');
// import routes
//import router from "./routes/routes.js";
const router = require('./routes/routes');
// init express
const app = express();

const port = process.env.PORT || 5000

// use express json
app.use(express.json());
 
// use cors
app.use(cors());
 
// use router
app.use(router);

app.listen(port, () => console.log(`Server running at http://localhost:${port}`));

module.exports = app;
