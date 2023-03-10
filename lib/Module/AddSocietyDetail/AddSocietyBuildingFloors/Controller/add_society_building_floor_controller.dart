import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Routes/set_routes.dart';

import '../../../../Constants/api_routes.dart';
import '../../../Login/Model/User.dart';

class AddSocietyBuildingFloorsController extends GetxController {
  var user = Get.arguments;
  int? index;
  int? buildingid;
  var bearertoken;
  
  bool isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    
    

                    
    buildingid=user[0];
    bearertoken=user[2];
    
  }

  final fromController = TextEditingController();
  final toController = TextEditingController();

  addSocietybuildingFloorsApi({
    required String bearerToken,
    
    required int buildingid,

    required String from,
    required String to,
  }) async {
    isLoading = true;
    update();

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
    var request = Http.MultipartRequest('POST', Uri.parse(Api.addsocietybuildingfloors));
    request.headers.addAll(headers);

    request.fields['from'] = from;
    request.fields['to'] = to;
    
    request.fields['buildingid'] = buildingid.toString();

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      print(response.body);
      Get.snackbar("Floors Add Successfully", "");
      
    
      Get.offAndToNamed(societybuildingfloorsscreen, arguments: user);

    } else if (response.statusCode == 403) {
      isLoading = false;
      update();
      var data = jsonDecode(response.body.toString());

      Get.snackbar(
        "Error",
        data.toString(),
      );
    } else {
      isLoading = false;
      update();

      Get.snackbar("Failed to Add Phases", "");
    }
  }
}
