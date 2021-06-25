/**
 * Author, Agoo Clinton
 * Mail: agooclinton@gmail.com
 * Phone:<PHONE NUMBER>
 * Github/Gitlab Username: kahdichienja.
 * 
 */

const admin = require("firebase-admin");
const accountSid = 'AC811d7caae9568898530989b58061e900';
const authToken = '7e201cb32a4c01ef791cc6d10e57eec8';
const client = require('twilio')(accountSid, authToken);
const app = require("express")();
const cors = require("cors");
const parse = require("./parse");
const collectiondb = 'opemrsMpesaFailOrSuccess';

const firestoredb = admin.firestore();
app.use(cors({ origin: true }));

app.post("/", (req, res) => {
  console.log("Callback received.");



  const callbackData = req.body.Body.stkCallback;

  console.log(JSON.stringify(callbackData));

  const parsedData = parse(callbackData);

  if (parsedData.resultCode == 0) {
    // sendNotification("Payment Transaction Was successfull", "<PHONE NUMBER>")

    firestoredb.collection(collectiondb).add(parsedData).then(
      (err) => {
      if (err) {
        // console.log(err);
      } else {
        console.log("Transaction saved to database.");
      }
    }

    )
  } else {
    // sendNotification("Your transaction was not successful.", "<PHONE NUMBER>")

    firestoredb.collection(collectiondb).add(parsedData).then(
      (err) => {
      if (err) {
      } else {

        console.log("Transaction saved to database.");
      }
    }

    )
  }
  res.send("Completed");
});

const sendNotification =  (body, phoneNumber) => client.messages.create({
  body: body,
  from: "+12679302835",
  to: phoneNumber,

})
.then((message) => console.log(message.sid));



module.exports = app;
