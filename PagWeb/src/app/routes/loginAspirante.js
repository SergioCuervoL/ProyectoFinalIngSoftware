const dbConnection = require('../../config/dbConnection');

module.exports = app => {
    const connection = dbConnection();
    
    app.get('/', (req, res) =>{
        connection.query('SELECT * FROM aspirante', (err, result)=>{
            console.log(err);
            res.render('ASPIRANTE/loginAspirantes', {
                aspirante: result
            });
        });
    });

    app.post('/loginAspirante', (req, res) =>{
        const {txtCorreo, txtContrasena} = req.body;
        connection.query('SELECT * FROM `aspirante` WHERE `correo`=\''+txtCorreo+'\' && `contrasena`=\''+txtContrasena+'\'', 
        (err, result) => {
            if(result == ''){
                console.log(result);
                res.send('No se ingresaron adecuadamente los datos');
            }else if(result != ''){
                res.send('Se ingreso correctamente a la sesion');
            }
            if(err != null){
                res.send(err);
            }
        });
    });
}