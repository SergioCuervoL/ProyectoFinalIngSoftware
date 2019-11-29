const dbConnection = require('../../config/dbConnection');

module.exports = app => {
    const connection = dbConnection();
    
    app.get('/', (req, res) =>{
        connection.query('SELECT * FROM aspirante', (err, result)=>{
            console.log(err);
            res.render('ASPIRANTE/registrarAspirante', {
                aspirante: result
            });
        });
    });

    app.post('/registrarAspirante', (req, res) =>{
        const {txtNombre, txtApellido, txtCC, txtCorreo, txtContrasena} = req.body;
        connection.query('INSERT INTO aspirante SET?', {
            nombres: txtNombre , 
            apellidos: txtApellido, 
            cc: txtCC,
            correo: txtCorreo, 
            contrasena: txtContrasena
        }, (err, result) => {
            if(err!=null){
                res.send('No se pudo registrar');
            }
            else{
                res.redirect('/');
            }
            
        });
    });
}