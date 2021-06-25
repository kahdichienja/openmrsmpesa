/**
 * Author, Agoo Clinton
 * Mail: agooclinton@gmail.com
 * Phone: 254797324006
 * Github/Gitlab Username: kahdichienja.
 * 
 */
const request = require('request')
const clientcredentialsUrl  = require('../constants/string_url')



const accessToken = function (req, res, next) {
    // access token
    let url = clientcredentialsUrl.apiCredintialURL_sand
    let auth = Buffer.from(clientcredentialsUrl.consumer_key + ":" + clientcredentialsUrl.consumer_secret).toString("base64");

    request(
        {
            url: url,
            headers: {
                "Authorization": "Basic " + auth
            }
        }, 
        (error, response, body) => {
            if (error) {
                console.log(error)
            }
            else {
                // let resp = 
                req.access_token = JSON.parse(body).access_token
                
                next()
            }
        }
    )
}

const accessTokenTest = function (req, res, next) {
    const authTokeUrl = "http://api.kmhfltest.health.go.ke/o/token/"

    const buildAuthUrl = "grant_type=password&username=test@testmail.com&password=Test@1234&scope=read" + "lhRuA5CuWRqB9diSH2xaLx44V4C5rnvlHk5ybOaE:LC4L2x8Ml2Ox5lgFC00sdkqHGUieMDcCLkxGOlIst8Z2tVO4V1D5FcGtYjmecjvG8V7mY5YA9Yi4XgBNliqOGJWwn8Af5s71DB0HjoFb1lYSFbFAYGInbuSYCE2OsJkU";
    // access token
    let url = `${authTokeUrl}${buildAuthUrl}`
    let auth = Buffer.from(clientcredentialsUrl.consumer_key + ":" + clientcredentialsUrl.consumer_secret).toString("base64");

    request(
        {
            url: url,
            // headers: {
            //     "Authorization": "Basic " + auth
            // }
        }, 
        (error, response, body) => {
            if (error) {
                console.log(error)
            }
            else {
                // let resp = 
                console.log(JSON.parse(body));
                
                req.access_token = JSON.parse(body).access_token
                
                next()
            }
        }
    )
}



module.exports = {accessToken, accessTokenTest};