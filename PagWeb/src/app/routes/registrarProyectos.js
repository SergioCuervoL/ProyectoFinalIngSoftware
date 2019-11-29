const dbConnection = require('../../config/dbConnection');

module.exports = app => {
    const connection = dbConnection();
    
    app.get('/', (req, res) =>{
        connection.query('SELECT * FROM proyecto', (err, result)=>{
            console.log(err);
            res.render('PROYECTOS/registrarProyectos', {
                proyecto : result
            });
        });
    });

    app.post('/registrarProyecto', (req, res) =>{
        const {txtCategoria, txtDescripcion, txtArea, txtIdFuncionario} = req.body;
            connection.query('INSERT INTO proyecto SET?', {
                categoriaProyecto: txtCategoria, 
                descripcion: txtDescripcion, 
                area: txtArea, 
                FUNCIONARIO_idFuncionario: txtIdFuncionario
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