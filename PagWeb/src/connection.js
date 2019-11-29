const app = require('./config/server');

require('./app/routes/registrarProyectos')(app);

//Inicializar servidor

app.listen(app.get('port'), () => {
    console.log('server on port ', app.get('port'));
});