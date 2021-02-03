const express = require("express");
const app = express();
const mongoose = require("mongoose");
const dotenv = require('dotenv').config();
const employeesDb = require("./models/employee");

app.use("/static", express.static("public"));
app.set("view engine", "ejs");
app.use(express.urlencoded({ extended: true }));

//connection to db
mongoose.set("useFindAndModify", false);

mongoose.connect(process.env.DB_CONNECT, { useNewUrlParser: true }, () => {
    console.log("Polaczony z db!");
    app.listen(process.env.PORT || 3000, () => console.log("Dzialam na 3000!"));
});

// GET METHOD MAIN PAGE

app.get("/", (req, res) => {
    employeesDb.find({}, (err, emplo) => {
        res.render("index.ejs");
    });
});

// GET METHOD EMP PAGE

app.get("/list", (req, res) => {
    employeesDb.find({}, (err, emplo) => {
        res.render("employees.ejs", { employees: emplo });
    });
});

//POST METHOD

app.post('/',async (req, res) => {
    const emp = new employeesDb(
        {fname: req.body.fname,
        lname: req.body.lname,
        stanowisko: req.body.stanowisko,
        phone: req.body.phone,
        email: req.body.email});
    try {
        await emp.save();
        res.redirect("/");
    } catch (err) {
        res.redirect("/");
    }
});

//DELETE

app
    .route("/remove/:id")
    .get((req, res) => {
        const id = req.params.id;
        employeesDb.findByIdAndRemove(id, err => {
            if (err) return res.send(500, err);
            res.redirect("/list");
        });
    });

//UPDATE

app
    .route("/edit/:id")
    .get((req, res) => {
        const id = req.params.id;
        employeesDb.find({}, (err, emplo) => {
            res.render("edit.ejs", { employees: emplo, idTask: id });
        });
    })
    .post((req, res) => {
        const id = req.params.id;
        employeesDb.findByIdAndUpdate(id, { fname: req.body.fname, lname: req.body.lname, stanowisko:req.body.stanowisko, phone: req.body.phone, email: req.body.email }, err => {
            if (err) return res.send(500, err);
            res.redirect("/list");
        });
    });



