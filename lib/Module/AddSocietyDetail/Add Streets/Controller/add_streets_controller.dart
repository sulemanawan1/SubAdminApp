import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../../Constants/api_routes.dart';
import '../../../../Routes/set_routes.dart';

class AddStreetsController extends GetxController
{
  var data = Get.arguments;
  int? bid;
  int? pid;
  bool isLoading = false;
  String? bearerToken;
  final fromController = TextEditingController();
  final toController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

    bid=data[0];
    pid=data[1];
    bearerToken=data[2];

  }



  addStreetsApi({
    required String bearerToken,
    required int bid,
    required String from,
    required String to,
  }) async {

    print(bearerToken);
    print(bid);
    print(from);
    print(to);

    isLoading = true;
    update();

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
    var request = Http.MultipartRequest('POST', Uri.parse(Api.addstreets));
    request.headers.addAll(headers);
    request.fields['from'] = from;
    request.fields['to'] = to;
    request.fields['bid'] = bid.toString();

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);


    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      print(response.body);
      Get.snackbar("Streets Add Successfully", "");
      Get.offAndToNamed(streets, arguments: [bid, bearerToken]);

      Get.offAndToNamed(streets, arguments: [
        bid,
       pid,
      bearerToken
      ]);

    } else if (response.statusCode == 403) {
      isLoading = false;
      update();
      var data = jsonDecode(response.body.toString());

      (data['errors'] as List)
          .map((e) => Get.snackbar(
        "Error",
        e.toString(),
      ))
          .toList();

    } else {
      isLoading = false;
      update();

      Get.snackbar("Failed to Add Streets", "");
    }
  }




}