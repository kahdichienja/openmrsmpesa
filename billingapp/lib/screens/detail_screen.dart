import 'package:billingapp/components/schedule_card.dart';
import 'package:billingapp/controller/payment_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class BillableDetailScreen extends StatefulWidget {
  var _name;
  var _description;
  var _imageUrl;
  var amount;
  var description;

  BillableDetailScreen(this._name, this._description, this._imageUrl,
      {@required this.amount, @required this.description});

  @override
  _BillableDetailScreenState createState() => _BillableDetailScreenState();
}

class _BillableDetailScreenState extends State<BillableDetailScreen> {
  TextEditingController mpesaphoneNumber = TextEditingController();
  var _formKey = new GlobalKey<FormState>();
  var _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/detail_illustration2.png'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            widget._imageUrl,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget._name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: kTitleTextColor,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget._description,
                                style: TextStyle(
                                  color: kTitleTextColor.withOpacity(0.7),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Bill Description',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: kTitleTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.description,
                        style: TextStyle(
                          height: 1.6,
                          color: kTitleTextColor.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () => _imageBottomSheet(context),
                        child: ScheduleCard(
                          kBlueColor,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _imageBottomSheet(context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 20),
          child: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: Container(
              child: new Column(
                children: <Widget>[
                  Container(
                    decoration: AppColors.containerBoxDecorations,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      autocorrect: false,
                      onSaved: (String value) {
                        mpesaphoneNumber.text;
                      },
                      validator: AppColors.validatePhoneNumber,
                      controller: mpesaphoneNumber,
                      maxLines: 1,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.phone,
                          color: primary,
                        ),
                        labelText: 'Phone Number',
                        hintText: 'Phone No. must start with 254',
                        labelStyle: TextStyle(
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    decoration: AppColors.containerBoxDecorations,
                    child: CupertinoButton(
                      onPressed: _validateInputs,
                      color: primary,
                      child: const Text(
                        'Pay',
                        style: const TextStyle(fontSize: 17.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _validateInputs() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      setState(() {
        _autoValidate = true; // Start validating on every change.
      });
      Get.snackbar(
        'Error',
        'Please fix the errors in red before submitting.',
        backgroundColor: Colors.amber,
      );
    } else {
      form.save();
      // perform Save.
      Get.snackbar(
        'Success',
        'Validating and saving payment info...',
        backgroundColor: primary,
      );
      handlePayment();
    }
  }

  handlePayment() async {
    var apiMpesaProvider =
        Provider.of<PaymentController>(context, listen: false);
    await apiMpesaProvider
        .makePayment(amount: widget.amount, phoneNumber: mpesaphoneNumber.text)
        .then((value) async {
      print(value.data);

      if (value.data["responseCode"] == "0") {
        Get.snackbar(
          "Success",
          value.data['customerMessage'],
          backgroundColor: primary,
        );
      } else {
        Get.snackbar(
          "Error!!",
          value.data["CustomerMessage"],
          backgroundColor: Colors.red,
        );
        Get.back();
      }
    });
  }
}
