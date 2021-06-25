
/**
 * Author, Agoo Clinton
 * Mail: agooclinton@gmail.com
 * Phone: 254797324006
 * Github/Gitlab Username: kahdichienja.
 * 
 */
const business_short_code = "174379";
const lipa_na_mpesa_passkey = "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919";

const consumer_key = "RtGRiELIAa6BJ1LLt3uY3xeqQlguVmqr";
const consumer_secret = "3vqlK0GmXtGjspr4";


const callbackURL_sand = "https://openmrsbilling.herokuapp.com/api/v1/lnm/";

const apiCredintialURL_sand = "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials";
const apiurlforstkpush_sand = "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest";


module.exports = {
    consumer_secret,
    consumer_key,
    apiCredintialURL_sand,   
    business_short_code,
    apiurlforstkpush_sand,
    callbackURL_sand,
    lipa_na_mpesa_passkey
}