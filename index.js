const express = require ('express');
const app = express();
const port = 4700;
let jwt = require("jsonwebtoken");
const cors = require('cors');



const bodyParser = require("body-parser");

//app.use(helmet());
app.use(cors());
app.use(bodyParser.json({ limit: "50mb" }));
app.use(bodyParser.urlencoded({ extended: true, limit:'50mb' }));


// /usuarios

const operationsRoutes = require('./routes/operations.routes')
const usersRoutes = require('./routes/users.routes')


app.use('/operations', operationsRoutes);
app.use('/users', usersRoutes);



app.listen(port, () => {
    console.log(`Server listeting on port ${port}`);
  });