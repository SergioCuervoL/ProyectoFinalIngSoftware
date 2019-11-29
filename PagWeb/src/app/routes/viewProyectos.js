const dbConnection = require('../../config/dbConnection');
const server = require('../../config/server');

module.exports = app => {
    const connection = dbConnection();
    
    app.get('/', (req, res) =>{
        connection.query('SELECT * FROM proyecto', (err, result)=>{
            console.log(err);
            res.render('PROYECTOS/viewProyectos', {
                proyecto: result
            });
        });
    });
}