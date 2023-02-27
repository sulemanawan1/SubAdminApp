import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';
import '../../View Residents/Model/Resident.dart';

class GenerateBillController extends GetxController
{
  var userdata = Get.arguments;

late final User user;
  int status=0;
  bool isLoading=false;
var   residentList=[];
List<int> li=[];


@override
void onInit() {
  // TODO: implement onInit
  super.onInit();
  print("init");
 user = this.userdata;

}

  TextEditingController bill_start_date = TextEditingController();
  TextEditingController bill_end_date = TextEditingController();
  TextEditingController bill_due_date = TextEditingController();

  Future chooseBillStartDate(context) async {
    DateTime? picked = await showDatePicker(
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030),
        context: context);
    if (picked != null) picked.toString();
    bill_start_date.text = picked.toString().split(' ')[0];

    update();
  }
  Future chooseBillEndDate(context) async {
    DateTime? picked = await showDatePicker(
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030),
        context: context);
    if (picked != null) picked.toString();
    bill_end_date.text = picked.toString().split(' ')[0];

    update();
  }
  Future chooseBillDueDate(context) async {
    DateTime? picked = await showDatePicker(
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030),
        context: context);
    if (picked != null) picked.toString();
    bill_due_date.text = picked.toString().split(' ')[0];

    update();
  }

viewResidentsApi(int subadminiid, String token) async {
  print(subadminiid.toString());
  print(token);

  final response = await Http.get(
    Uri.parse(Api.view_residents + "/" +subadminiid.toString()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token"
    },
  );
  var data = jsonDecode(response.body.toString());


  if (response.statusCode == 200) {
    print(data);
// Residents.fromJson(data);
    final List<Resident>   li= await (data['residentslist'] as List).map((e) =>
        Resident(

            firstname: e['firstname'],image: e['image'],password: e['password'],id: e['id'],
            address: e['address'],committeemember: e["committeemember"],cnic: e['cnic'],
            lastname: e['lastname'],mobileno: e['mobileno'],

            propertytype: e['propertytype'],
            residentid:e['residentid'] ,residenttype:e ['residenttype'],roleid: e['roleid'],
            rolename: e['rolename'],subadminid: e['subadminid'],
            vechileno: e['vechileno'], created_at: e['created_at'], updated_at: e['updated_at']


        ),


    ).toList();


    return li;
  }
}

generateBillApi({

  required String billstartdate,
  required String billenddate,
  required String duedate,
  required int status,
  required var residentlists,
  required String bearerToken,
  required int subadminid,
}) async {
  isLoading = true;
  update();

  

   

  Map<String, List<int>> results = {
    "residentlist": residentlists
  };
  print("----");

  print(jsonEncode(results));
  final response = await Http.post(
    Uri.parse(Api.generatebill),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $bearerToken"
    },
    body: jsonEncode(<String, dynamic>{
      "subadminid": subadminid,
      "residentlist":jsonEncode(results),
      "duedate": duedate,
      "billstartdate": billstartdate,
      "billenddate": billenddate,
      "status": status,





    }),
  );

  if (response.statusCode == 200) {

    Get.snackbar("Success", "Bill Generated Successfully");
    isLoading=false;
    update();
  }

  else {
    isLoading = false;
    update();
    print(response.body);
    Get.snackbar("Failed to generate Bill", "");
  }
}




}