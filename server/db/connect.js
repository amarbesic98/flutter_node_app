const mongoose = require('mongoose');

const connectString =
'mongodb+srv://tech387:admin123@cluster0.2yupnb0.mongodb.net/?retryWrites=true&w=majority'



const connectDb = () =>{
    return mongoose.connect(connectString)

}

module.exports = connectDb;