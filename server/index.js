const express = require('express')
const app = express()
const port = 3000;
const router = require('./routes/user.route')
const connectDb = require('./db/connect');
const cors = require('cors')

const bodyParser = require('body-parser')
app.use(cors())
app.use(bodyParser.urlencoded({extended:true}))
app.use(bodyParser.json())
app.use('/',router);

const start = async () =>{
    try {
        await connectDb()
        app.listen(port,()=>{
        console.log(`server is listening on port  ${port}`);
})
    } catch (error) {
        console.log(error);
        
    }
}

start()