import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/Resident%20Model/ApartmentResident.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/Resident%20Model/HouseResident.dart';
import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';

class UnVerifiedResidentController extends GetxController {
  var user = Get.arguments;
  late final User userdata;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userdata = this.user;


  }

  Future<HouseResident> viewUnVerifiedResidentApi(
      {required int subadminid,
      required String token,
      required int status}) async {
    print(token);

    final response = await Http.get(
      Uri.parse(Api.unverifiedhouseresident.toString() +
          '/' +
          subadminid.toString() +
          '/' +
          status.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return HouseResident.fromJson(data);
    }

    return HouseResident.fromJson(data);
  }

  Future<ApartmentResident> viewUnVerifiedApartmentResidentApi(
      {required int subadminid,
        required String token,
        required int status}) async {
    print(token);

    final response = await Http.get(
      Uri.parse(Api.unverifiedapartmentresident.toString() +
          '/' +
          subadminid.toString() +
          '/' +
          status.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ApartmentResident.fromJson(data);
    }

    return ApartmentResident.fromJson(data);
  }



}
