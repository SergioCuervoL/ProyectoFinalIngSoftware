const app = require('./config/server');

require('./app/routes/loginAspirante')(app);

//Inicializar servidor

app.listen(app.get('port'), () => {
    console.log('server on port ', app.get('port'));
});