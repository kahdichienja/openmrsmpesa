/**
 * Author, Agoo Clinton
 * Mail: agooclinton@gmail.com
 * Phone: 254797324006
 * Github/Gitlab Username: kahdichienja.
 * 
 */


const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();
const firestoredb = admin.firestore();
const  api = require('./api');
const  mpesaCallBackRegestrationFB = require('./callbackUrl');
const model = require('./api/models/index')

const accountSid = 'AC811d7caae9568898530989b58061e900';
const authToken = '7e201cb32a4c01ef791cc6d10e57eec8';
const client = require('twilio')(accountSid, authToken);

exports.opemMrsPaymentsAPI = functions.https.onRequest(api);
exports.mpesaCallBackRegestrationFB = functions.https.onRequest(mpesaCallBackRegestrationFB);

exports.onCreateOpemrsMpesaFailOrSuccess = functions.firestore
  .document("/opemrsMpesaFailOrSuccess/{id}")
  .onCreate(async (snapshot, context) => {

    // console.log("opemrsMpesaFailOrSuccess item created:", snapshot.data());

    const createdActivityNotificationItem = snapshot.data();

    

    // 1).get the chechout request id conneted to the document.


    const collectionRef = firestoredb.collection(model.transactionCollections);

    const snapshotD = await collectionRef.where("checkoutRequestID", "==", createdActivityNotificationItem.checkoutRequestID).get();
    
    if (snapshotD.empty) {
        console.log('No matching documents.');
        return;
    }  

    // let docData = firestoredb.collection(model.transactionCollections).where("checkoutRequestID", "==", createdActivityNotificationItem.checkoutRequestID).get()


    // console.log("opemrsMpesaFailOrSuccess item created:", docData);


    // 2). get phone number used for payment

    snapshotD.forEach(doc => {

        console.log(doc.id, '=>', doc.data());
        // sendNotification(`${createdActivityNotificationItem.resultDesc}`, `+${doc.data().phonenumberusedforpayment}`)

        // 3). notify as either success or failure depending on {createdActivityNotificationItem.resultDesc}
        client.messages.create({
            body: `${createdActivityNotificationItem.resultDesc}`,
            from: "+12679302835",
            to:  `+${doc.data().phonenumberusedforpayment}`,
          
          })
          .then((message) => console.log(message.sid))

    });


    // const sendNotification =  (body, phoneNumber) => client.messages.create({
    //     body: body,
    //     from: "+12679302835",
    //     to: phoneNumber,
      
    //   })
    //   .then((message) => console.log(message.sid));


  });