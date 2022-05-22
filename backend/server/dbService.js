const mysql = require('mysql');
const dotenv = require('dotenv');
let instance = null;
dotenv.config();

const connection = mysql.createConnection({  // Connexion BDD
    host: process.env.HOST,
    user: process.env.USER,
    password: process.env.PASSWORD,
    database: process.env.DATABASE,
    port: process.env.DB_PORT
});

connection.connect((err) => {               // Erreur de connexion
    if (err) {
        console.log(err.message);
    }
    // console.log('db ' + connection.state);
});


class DbService {    // Contiens les fonctions qu'on utilisera pour GET/UPDATE/INSERT ou DELETE les données
    static getDbServiceInstance() {
        return instance ? instance : new DbService(); // Créé s'il n'y en a pas, une nouvelle instance de DbService
    }

    //                                      USERS


    async insertNewUser(nom, prenom, password, email, tel, salt) {
        try {

            let insertId;
            const query = "INSERT INTO user ( nom, prenom, password, email, tel, salt) VALUES (?,?,?,?,?,?);";


            connection.query(query, [nom, prenom, password, email, tel, salt], (err, result) => {
                if (err)
                    console.log(err.message);
                console.log(result);
                insertId = result.insertId;
            })

        } catch (error) {
            console.log(error);
        }
    }


    async getUserId(password, email) {
        try {
            const response = await new Promise((resolve, reject) => {

                const query = "SELECT id FROM user WHERE password = ? AND email = ?;";

                connection.query(query, [password, email], (err, results) => {
                    if (err) reject(new Error(err.message));
                    resolve(results);
                })
                console.log(query);
            });
            console.log(response);
            return response;
        } catch (error) {
            console.log(error);
        }
    }


    async getUserInfos(id) {
        try {
            const response = await new Promise((resolve, reject) => {

                const query = "SELECT * FROM user WHERE id = ?";

                connection.query(query, [id], (err, results) => {
                    if (err) reject(new Error(err.message));
                    resolve(results);
                })
            });

            return response;
        } catch (error) {
            console.log(error);
        }
    }

    //                                      TERRAINS 

    async getAllTerrains() {
        try {
            const response = await new Promise((resolve, reject) => {

                const query = "SELECT * FROM terrain;";

                connection.query(query, (err, results) => {
                    if (err) reject(new Error(err.message));
                    resolve(results);
                })
            });

            return response;
        } catch (error) {
            console.log(error);
        }
    }

    //                                      CRENEAUX


    async insertNewCreneau(id_terrain, id_user, date, heuredebut, heurefin) {
        try {
            let insertId;
            const query = "INSERT INTO creneau ( id_terrain, id_user, date, heuredebut, heurefin) VALUES (?,?,?,?,?);";


            connection.query(query, [id_terrain, id_user, date, heuredebut, heurefin], (err, result) => {
                if (err)
                    console.log(err.message);
                console.log(result);
                insertId = result.insertId;
            })

        } catch (error) {
            console.log(error);
        }
    }

    async getAllCreneaux() {
        try {
            const response = await new Promise((resolve, reject) => {

                const query = "SELECT * FROM creneau;";

                connection.query(query, (err, results) => {
                    if (err) reject(new Error(err.message));
                    resolve(results);
                })
            });

            return response;
        } catch (error) {
            console.log(error);
        }
    }

    async getCreneauxByIds(id_user, id_terrain) {
        try {
            const response = await new Promise((resolve, reject) => {

                const query = "SELECT * FROM creneau WHERE id_user = ? AND id_terrain =?;";

                connection.query(query, [id_user, id_terrain], (err, results) => {
                    if (err) reject(new Error(err.message));
                    resolve(results);
                })
            });

            return response;
        } catch (error) {
            console.log(error);
        }
    }

    async getCreneauxByIds(id_user, id_terrain) {
        try {
            const response = await new Promise((resolve, reject) => {

                const query = "SELECT * FROM creneau WHERE id_user = ? AND id_terrain =?;";

                connection.query(query, [id_user, id_terrain], (err, results) => {
                    if (err) reject(new Error(err.message));
                    resolve(results);
                })
            });

            return response;
        } catch (error) {
            console.log(error);
        }
    }

    async deleteCreneau(id) {
        try {
            id = parseInt(id, 10);   // jsp pq 
            const response = await new Promise((resolve, reject) => {
                const query = "DELETE FROM creneau WHERE id = ?";

                connection.query(query, [id], (err, result) => {
                    if (err) reject(new Error(err.message));
                    resolve(result.affectedRows);
                })
            });

            return response === 1 ? true : false;
        } catch (error) {
            console.log(error);
            return false;
        }
    }

    async updateCreneauById(date, heuredebut, heurefin, id_terrain, id) {
        try {
            id = parseInt(id, 10);
            const response = await new Promise((resolve, reject) => {
                const query = "UPDATE creneau SET date = ?, heuredebut = ?, heurefin = ?, id_terrain = ? WHERE id = ?";

                connection.query(query, [date, heuredebut, heurefin, id_terrain, id], (err, result) => {
                    if (err) reject(new Error(err.message));
                    resolve(result.affectedRows);
                })
            });

            return response === 1 ? true : false;
        } catch (error) {
            console.log(error);
            return false;
        }
    }
    async updateUserName(nom, id) {
        try {
            id = parseInt(id, 10);
            const response = await new Promise((resolve, reject) => {
                const query = "UPDATE user SET nom = ? WHERE id = ?";

                connection.query(query, [nom, id], (err, result) => {
                    if (err) reject(new Error(err.message));
                    resolve(result.affectedRows);
                })
            });

            return response === 1 ? true : false;
        } catch (error) {
            console.log(error);
            return false;
        }
    }
    async updateUser1stName(prenom, id) {
        try {
            id = parseInt(id, 10);
            const response = await new Promise((resolve, reject) => {
                const query = "UPDATE user SET prenom = ? WHERE id = ?";

                connection.query(query, [prenom, id], (err, result) => {
                    if (err) reject(new Error(err.message));
                    resolve(result);
                })
            });

            return response === 1 ? true : false;
        } catch (error) {
            console.log(error);
            return false;
        }
    }
    async updateUserPassword(password, id) {
        try {
            id = parseInt(id, 10);
            const response = await new Promise((resolve, reject) => {
                const query = "UPDATE user SET password = ? WHERE id = ?";

                connection.query(query, [password, id], (err, result) => {
                    if (err) reject(new Error(err.message));
                    resolve(result.affectedRows);
                })
            });

            return response === 1 ? true : false;
        } catch (error) {
            console.log(error);
            return false;
        }
    }
    async updateUserEmail(email, id) {
        try {
            id = parseInt(id, 10);
            const response = await new Promise((resolve, reject) => {
                const query = "UPDATE user SET email = ? WHERE id = ?";

                connection.query(query, [email, id], (err, result) => {
                    if (err) reject(new Error(err.message));
                    resolve(result.affectedRows);
                })
            });

            return response === 1 ? true : false;
        } catch (error) {
            console.log(error);
            return false;
        }
    }
    async updateUserTel(tel, id) {
        try {
            id = parseInt(id, 10);
            const response = await new Promise((resolve, reject) => {
                const query = "UPDATE user SET tel = ? WHERE id = ?";

                connection.query(query, [tel, id], (err, result) => {
                    if (err) reject(new Error(err.message));
                    resolve(result.affectedRows);
                })
            });

            return response === 1 ? true : false;
        } catch (error) {
            console.log(error);
            return false;
        }
    }
}






module.exports = DbService;