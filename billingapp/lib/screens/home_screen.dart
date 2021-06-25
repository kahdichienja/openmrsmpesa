import 'dart:convert';

import 'package:billingapp/components/category_card.dart';
import 'package:billingapp/components/bill_card.dart';
import 'package:billingapp/controller/get_billable_controller.dart';
import 'package:billingapp/services/payment_service.dart';
import 'package:billingapp/services/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../constant.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List billables = List();
  bool _isLoading = true;

  List selectedBillables = List();
  String selectedName;
  bool _isSelected = false;

  @override
  void initState() {
    getBillables();
    super.initState();
  }

  getBillables() async {
    String url = "https://openmrsbilling.herokuapp.com/api/v1/billables";
    ApiMpesaService _api = ApiMpesaService();
    try {
      var res = await _api.getApiData(path: url);
      var body = jsonDecode(res.body);
      var dat = body;
      billables.addAll(dat);

      _isLoading = false;

      // print(billables);

      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: black,
          centerTitle: true,
          title: Text(
            'Cashier Module',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: kTitleTextColor,
            ),
          ),
        ),
        // backgroundColor: kBackgroundColor,
        body: Container(
          decoration: AppColors.containerBoxDecorations,
          child: SafeArea(
            bottom: false,
            child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                _isLoading
                    ? Container(
                        margin: EdgeInsets.only(top: 32.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : billables.length == 0
                        ? Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 32.0),
                              child: Text(
                                "Oops! No data available",
                                style: TextStyle(color: Colors.orange),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: StaggeredGridView.countBuilder(
                              shrinkWrap: true,
                              padding: EdgeInsets.all(5),
                              controller:
                                  ScrollController(keepScrollOffset: false),
                              crossAxisCount: 4,
                              itemCount: billables.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  InkWell(
                                onTap: () {
                                  setState(
                                    () {
                                      selectedBillables =
                                          billables[index]['billing_queue'];
                                      selectedName = billables[index]
                                          ['billing_service_name'];
                                      _isSelected = true;
                                    },
                                  );
                                },
                                child: CategoryCard(
                                  billables[index]['billing_service_name'],
                                  FormateDateTime.getClearText(
                                      billables[index]['img']),
                                  black,
                                ),
                              ),
                              staggeredTileBuilder: (int index) =>
                                  new StaggeredTile.count(
                                      2, index.isEven ? 2 : 1),
                              mainAxisSpacing: 4.0,
                              crossAxisSpacing: 4.0,
                            ),
                          ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    _isSelected ? selectedName : 'Select Service To View Queue',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: kTitleTextColor,
                    ),
                  ),
                ),
                buildDoctorList(),
              ],
            ),
          ),
        ));
  }

  buildDoctorList() {
    return _isSelected
        ? Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: selectedBillables.length == 0
                ? Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 32.0),
                      child: Text(
                        "Oops! No data available",
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(1),
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    itemCount: selectedBillables.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BillableDetailScreen(
                                "Name:\n ${selectedBillables[index]['fields']['patient_name']}",
                                'Gender: ${selectedBillables[index]['fields']['gender']} \nBill: ${selectedBillables[index]['fields']['total_bill']}/=',
                                'assets/images/doctor1.png',
                                amount: selectedBillables[index]['fields']
                                    ['total_bill'],
                                description: selectedBillables[index]['fields']
                                    ['billing_detail'],
                              ),
                            ),
                          );
                        },
                        child: BillableListView(
                          "Name: \n${selectedBillables[index]['fields']['patient_name']}",
                          'Gender: ${selectedBillables[index]['fields']['gender']} \nBill: ${selectedBillables[index]['fields']['total_bill']}/=',
                          'assets/images/doctor1.png',
                          kBlueColor,
                        ),
                      );
                    },
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    controller: ScrollController(keepScrollOffset: false),
                  ),
          )
        : SizedBox.shrink();
  }
}
