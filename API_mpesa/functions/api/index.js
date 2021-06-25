/**
 * Author, Agoo Clinton
 * Mail: agooclinton@gmail.com
 * Phone: 254797324006
 * Github/Gitlab Username: kahdichienja.
 * 
 */
const app = require("express")();
const cors = require("cors");
const routes  = require('./routes');
app.use(cors({ origin: true }));


/**
 * 
 * API Version @v1
 * @routes /v1
 */
app.use('/v1', routes)


module.exports = app;
