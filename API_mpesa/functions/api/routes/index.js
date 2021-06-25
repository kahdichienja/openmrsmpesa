/**
 * Author, Agoo Clinton
 * Mail: agooclinton@gmail.com
 * Phone: 254797324006
 * Github/Gitlab Username: kahdichienja.
 * 
 */
const express = require( 'express')

const payments = require('../controller/paymentController')
let router = express()

// api routes v1 (/v1/payments_api) { mpesa payments}
router.use('/payments_api', payments())


module.exports =  router