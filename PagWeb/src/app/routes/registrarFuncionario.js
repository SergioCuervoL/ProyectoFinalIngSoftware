const dbConnection = require('../../config/dbConnection');

module.exports = app => {
    const connection = dbConnection();
    
    app.get('/', (req, res) =>{
        connection.query('SELECT * FROM funcionario', (err, result)=>{
            console.log(err);
            res.render('FUNCIONARIO/registrarFuncionario', {
                funcionario: result
            });
        });
    });

    app.post('/funcionario', (req, res) =>{
        const {txtNombre, txtApellido, txtCorreo, txtContrasena, txtKeySecret} = req.body;
        if(txtKeySecret==7476){
            connection.query('INSERT INTO funcionario SET?', {
                nombres: txtNombre , 
                apellidos: txtApellido, 
                correo: txtCorreo, 
                contrasena: txtContrasena
            }, (err, result) => {
                res.redirect('/');
            });
        }
        else{
            res.redirect('/');
        }
    });
}