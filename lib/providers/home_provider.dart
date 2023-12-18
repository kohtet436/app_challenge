import 'package:app_challenge/api_services/api_services.dart';
import 'package:app_challenge/models/product_model.dart';
import 'package:app_challenge/models/report_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePageProvider with ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  GlobalKey<FormState> createformKey = GlobalKey<FormState>();

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController addressEditingController = TextEditingController();

  FocusNode phoneFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();

  bool loading = false;
  List<ProductModel>? data = [];

  ApiServices services = ApiServices();

  getProductData(context) async {
    loading = true;
    data = await services.getData();
    loading = false;

    notifyListeners();
  }

  ProductModel findProdById(int productId) =>
      data!.firstWhere((element) => element.id == productId);

  Future<void> addDataToFirebase(ReportModel data) async {
    try {
      Map<String, dynamic> dataMap = data.toJson();

      await firestore.collection('report').add(dataMap);
    } catch (e) {
      print('Error adding data to Firestore: $e');
    }
    notifyListeners();
  }
}
