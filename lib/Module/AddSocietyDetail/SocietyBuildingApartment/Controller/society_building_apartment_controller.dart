import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Module/AddSocietyDetail/Blocks/Model/Blocks.dart';

import '../../../../Constants/api_routes.dart';
import '../../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../../../Login/Model/User.dart';
import '../Model/SocietyBuildingApartment.dart';

class SocietyBuildingApartmentController extends GetxController {
  var data = Get.arguments;
  int? fid;
  String? bearerToken;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

    fid = data[0];
    bearerToken = data[1];
  }

  Future<SocietyBuildingApartment> SocietyBuildingApartmentsApi(
      {required int fid, required String bearerToken}) async {
    print("${fid.toString()}");
    print(bearerToken);

    final response = await Http.get(
      Uri.parse(Api.viewsocietybuildingapartments + "/" + fid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $bearerToken"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    ;

    if (response.statusCode == 200) {
      return SocietyBuildingApartment.fromJson(data);
    }

    return SocietyBuildingApartment.fromJson(data);
  }
}
