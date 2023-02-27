import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Constants/api_routes.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Houses/Model/Houses.dart';

class HouseController extends GetxController
{

  var data = Get.arguments;
  int? sid ;
  int? bid ;
  int? pid ;
  String? bearerToken;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

    sid=data[0];
    bid=data[1];
    pid=data[2];
    bearerToken=data[3];

  }

  Future<Houses> housesApi({required int sid, required String bearerToken}) async {
    print("${sid.toString()}");
    print(bearerToken);

    final response = await Http.get(
      Uri.parse(Api.properties + "/" + sid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $bearerToken"
      },
    );
    var data = jsonDecode(response.body.toString());

    ;

    if (response.statusCode == 200) {
      print(response.body);
      return Houses.fromJson(data);
    }

    return Houses.fromJson(data);
  }




}