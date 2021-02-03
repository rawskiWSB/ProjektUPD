const mongoose = require('mongoose');

const employeeSchema = new mongoose.Schema({
    fname: {
        type: String
    },
    lname: {
        type: String
    },
    stanowisko: {
        type: String
    },
    phone: {
        type: String
    },
    email: {
        type: String
    },
    date: {
        type: Date,
        default: Date.now
    }
})

module.exports = mongoose.model('employee',employeeSchema);