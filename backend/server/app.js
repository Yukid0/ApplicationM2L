const express = require('express');
const app = express();
const cors = require('cors');
const dotenv = require('dotenv');

dotenv.config();

const dbService = require('./dbService');

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));


//                                      USERS


app.post('/insertUser', (request, response) => {
    const { nom, prenom, password, email, tel, salt } = request.body;


    const db = dbService.getDbServiceInstance();
    console.log(nom, prenom, password, email, tel, salt);

    const result = db.insertNewUser(nom, prenom, password, email, tel, salt); // inserNewUser à Creer

    result
        .then(data => response.json({ data: data }))
        .catch(err => console.log(err));


});

app.get('/getUserId/:email/:password', (request, response) => {
    const { email, password } = request.params;


    const db = dbService.getDbServiceInstance();
    console.log(email);
    const result = db.getUserId(password, email);

    result
        .then(data => response.json({ data: data }))
        .catch(err => console.log(err));
});


app.get('/getUserInfos/:id', (request, response) => {
    const { id } = request.params;

    const db = dbService.getDbServiceInstance();

    const result = db.getUserInfos(id); // getInfoById à creer

    result
        .then(data => response.json({ data: data }))
        .catch(err => console.log(err));
});

//                                      TERRAINS

app.get('/getTerrains', (request, response) => {
    const db = dbService.getDbServiceInstance();

    const result = db.getAllTerrains();

    result
        .then(data => response.json({ data: data }))
        .catch(err => console.log(err));
});

//                                      CRENEAUX



app.post('/insertCreneau/:id_terrain/:id_user', (request, response) => {
    const { id_terrain } = request.params;              //ne sais pas si ce sont les bons (params/body)
    const { id_user } = request.params;
    const { date } = request.body;
    const { heuredebut } = request.body;
    const { heurefin } = request.body;


    const db = dbService.getDbServiceInstance();

    const result = db.insertNewCreneau(id_terrain, id_user, date, heuredebut, heurefin);

    result
        .then(data => response.json({ data: data }))
        .catch(err => console.log(err));


});





app.get('/getAllCreneaux', (request, response) => {
    const db = dbService.getDbServiceInstance();

    const result = db.getAllCreneaux();

    result
        .then(data => response.json({ data: data }))
        .catch(err => console.log(err));
});

app.get('/getCreneauxByIds/:id_user/:id_terrain', (request, response) => {
    const { id_user } = request.params;
    const { id_terrain } = request.params;

    const db = dbService.getDbServiceInstance();

    const result = db.getCreneauxByIds(id_user, id_terrain); // getInfoById à creer

    result
        .then(data => response.json({ data: data }))
        .catch(err => console.log(err));
});

app.delete('/deleteCreneau/:id', (request, response) => {
    const { id } = request.params;
    const db = dbService.getDbServiceInstance();

    const result = db.deleteCreneau(id);

    result
        .then(data => response.json({ success: data }))
        .catch(err => console.log(err));
});


app.patch('/updateCreneau', (request, response) => {

    const { date } = request.body;
    const { heuredebut } = request.body;
    const { heurefin } = request.body;
    const { id_terrain } = request.body;
    const { id } = request.body;
    const db = dbService.getDbServiceInstance();

    const result = db.updateCreneauById(date, heuredebut, heurefin, id_terrain, id);

    result
        .then(data => response.json({ success: data }))
        .catch(err => console.log(err));
});

app.patch('/updateUserName', (request, response) => {

    const { nom } = request.body;
    const { id } = request.body;
    const db = dbService.getDbServiceInstance();

    const result = db.updateUserName(nom, id);

    result
        .then(data => response.json({ success: data }))
        .catch(err => console.log(err));
});
app.patch('/updateUser1stName', (request, response) => {

    const { prenom } = request.body;
    const { id } = request.body;
    const db = dbService.getDbServiceInstance();

    const result = db.updateUser1stName(prenom, id);

    result
        .then(data => response.json({ success: data }))
        .catch(err => console.log(err));
});
app.patch('/updateUserPassword', (request, response) => {

    const { password } = request.body;
    const { id } = request.body;
    const db = dbService.getDbServiceInstance();

    const result = db.updateUserPassword(password, id);

    result
        .then(data => response.json({ success: data }))
        .catch(err => console.log(err));
});
app.patch('/updateUserEmail', (request, response) => {

    const { email } = request.body;
    const { id } = request.body;
    const db = dbService.getDbServiceInstance();

    const result = db.updateUserEmail(email, id);

    result
        .then(data => response.json({ success: data }))
        .catch(err => console.log(err));
});
app.patch('/updateUserTel', (request, response) => {

    const { tel } = request.body;
    const { id } = request.body;
    const db = dbService.getDbServiceInstance();

    const result = db.updateUserTel(tel, id);

    result
        .then(data => response.json({ success: data }))
        .catch(err => console.log(err));
});





app.listen(process.env.PORT, () => console.log('app is running'));