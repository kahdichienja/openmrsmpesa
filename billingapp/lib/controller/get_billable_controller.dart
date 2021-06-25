import 'package:billingapp/services/fetch_network_data.dart';
import 'package:get/get.dart';

class GetBillableController extends GetxController {
  
  String url = "https://5c2b30020bcc.ngrok.io/api/v1/billables";
  var noDataobs = false.obs;
  List billableDataobs;
  bool get dataAvailable => noDataobs.value;
  List get billData => billableDataobs.obs;

  @override
  void onInit() {
    fetchBillableData();
    super.onInit();
  }

  Future<void> fetchBillableData() {
    return FetchNetworkDataService.fetchJsonData(url)
        .then((response) {
          if (response != null) billableDataobs = response;
        })
        .catchError((err) => print('Error!!!!! : $err'))
        .whenComplete(() => noDataobs.value = billableDataobs != null);
  }
}
