import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../../Constants/api_routes.dart';
import '../../../../Routes/set_routes.dart';

class AddHousesController extends GetxController
{

  var data = Get.arguments;
int? sid;
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

  sid = data[0];
  bid = data[1];
  pid = data[2];
  bearerToken = data[3];






}



addHousesApi({
  required String bearerToken,
  required int sid,
  required String from,
  required String to,
}) async {

  print(bearerToken);
  print(sid);
  print(from);
  print(to);

  isLoading = true;
  update();

  Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
  var request = Http.MultipartRequest('POST', Uri.parse(Api.addproperties));
  request.headers.addAll(headers);
  request.fields['from'] = from;
  request.fields['to'] = to;
  request.fields['type'] = 'house';
  request.fields['typeid'] = 0.toString();
  request.fields['sid'] = sid.toString();

  var responsed = await request.send();
  var response = await Http.Response.fromStream(responsed);



  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());

    print(response.body);


    Get.offNamed(houses, arguments: [
      sid,
     bid,
      pid,
     bearerToken
    ]);

    Get.snackbar("Houses Add Successfully", "");

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

    Get.snackbar("Failed to Add Houses", "");
  }
}





}