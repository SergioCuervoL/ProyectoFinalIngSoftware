const dbConnection = require('../../config/dbConnection');

module.exports = app => {
    const connection = dbConnection();
    
    app.get('/', (req, res) =>{
        connection.query('SELECT * FROM funcionario', (err, result)=>{
            console.log(result);
            console.log(err);
            res.render('FUNCIONARIO/loginFuncionario', {
                funcionario: result
            });
        });
    });
}