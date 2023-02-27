import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';
import '../Model/Resident Model/HouseResident.dart' ;
import 'package:dio/dio.dart';
import 'package:http/http.dart' as Http;
class HouseResidentVerificationController extends GetxController {
  var data = Get.arguments;
  late final User userdata;

  late Data resident;
  String country = '';
  String state = '';
  String city = '';
  var isProperty = false;

  TextEditingController vehicleNoController = TextEditingController();
  TextEditingController houseAddressDetailController = TextEditingController();

  Phase? phases;
  Block? blocks;
  Street? streets;
  Property? houses;
  Measurement? measurements;
  String propertyType = 'House';
  String residentalType = 'Rental';
  var phaseList = <Phase>[];
  var blockList = <Block>[];
  var streetList = <Street>[];
  var houseList = <Property>[];
  var measurementList = <Measurement>[];
  var residentalTypeList = ['Rental', 'Owner'];

  SelectedPropertyType(val) {
    propertyType = val;
    update();
  }

  SelectedPhase(val) async {
    blockList.clear();
    blocks = null;
    streetList.clear();
    streets = null;
    houseList.clear();
    houses = null;
    houseAddressDetailController.clear();

    phases = val;

    update();
  }


  SelectedBlock(val) async {
    streetList.clear();
    streets = null;
    houseList.clear();
    houses = null;
    blocks = val;
    measurements = null;
    measurementList.clear();

    update();
  }

  SelectedStreet(val) async {
    houses = null;
    houseList.clear();

    houseAddressDetailController.clear();
    streets = val;

    update();
  }

  SelectedResidentalType(val) {
    residentalType = val;
    update();
  }

  SelectedMeasurement(val) {
    measurements = val;
    update();
  }

  Future<List<Phase>> viewAllPhasesApi(
      {required societyid, required bearerToken}) async {
    var response = await Dio().get(
        Api.view_all_phases + '/' + societyid.toString(),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${bearerToken}"
        }));
    var data = response.data['data'];

    phaseList = (data as List)
        .map((e) => Phase(
              id: e['id'],
              name: e['name'],
              subadminid: e['subadminid'],
              societyid: e['societyid'],
            ))
        .toList();

    return phaseList;
  }

  Future<List<Block>> viewAllBlocksApi(
      {required phaseId, required bearerToken}) async {

    var response = await Dio().get(
        Api.view_all_blocks + '/' + phaseId.toString(),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${bearerToken}"
        }));
    var data = response.data['data'];

    blockList = (data as List)
        .map((e) => Block(
              id: e['id'],
              name: e['name'],
              pid: e['pid'],
            ))
        .toList();

    return blockList;
  }

  Future<List<Street>> viewAllStreetsApi(
      {required blockId, required bearerToken}) async {
    print('Street aya');

    print(blockId);
    var response = await Dio().get(
        Api.view_all_streets + '/' + blockId.toString(),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${bearerToken}"
        }));
    var data = response.data['data'];

    streetList = (data as List)
        .map((e) => Street(
              id: e['id'],
              name: e['name'],
              bid: e['bid'],
            ))
        .toList();

    return streetList;
  }

  Future<List<Property>> viewAllHousesApi(
      {required streetId, required bearerToken}) async {
    print('House aya');

    print(streetId);

    var response = await Dio().get(
        Api.view_properties_for_residents + '/' + streetId.toString(),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${bearerToken}"
        }));
    var data = response.data['data'];

    houseList = (data as List)
        .map((e) => Property(
            id: e['id'],
            address: e['address'],
            sid: e['sid'],
            type: e['type'],
            typeid: e['typeid']))
        .toList();

    return houseList;
  }

  SelectedHouse(val) {
    houses = val;
    update();
  }

  Future<List<Measurement>> housesApartmentsModelApi(
      {required subAdminId,
      required String token,
      required String type}) async {
    print(subAdminId);
    print(token);
    print(type);

    var response = await Dio().get(
        Api.housesapartmentmeasurements +
            '/' +
            subAdminId.toString() +
            '/' +
            type.toString(),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token}"
        }));
    var data = response.data['data'];

    measurementList = (data as List)
        .map((e) => Measurement(
            id: e['id'],
            subadminid: e['subadminid'],
            charges: e['charges'],
            area: e['area'],
            bedrooms: e['bedrooms'],
            status: e['status'],
            type: e['type'],
            unit: e['unit']))
        .toList();

    return measurementList;
  }

  isPropertyHouseApartment() {
    isProperty = true;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userdata = data[0];
    resident = data[1];
    SelectedPhase(resident.phase![0]);
    SelectedBlock(resident.block![0]);
    SelectedStreet(resident.street![0]);
    SelectedHouse(resident.property![0]);
    SelectedMeasurement(resident.measurement![0]);
    vehicleNoController.text = resident.vechileno!;
    state = resident.state!;
    city = resident.city!;
    update();
  }

  Future verifyResidentApi({
 residentid,
    required int status,
    pid,
     bid,
 sid,
   propertyid,
     measurementid,
    vechileno,
    required String token,
  }) async {
    final response = await Http.post(Uri.parse(Api.verifyhouseresident),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token"
        },
        body: jsonEncode(<String, dynamic>{
          "residentid": residentid,
          "status": status,
          'pid':pid,
          'bid':bid,
          'sid':sid,
          'propertyid':propertyid,
          'measurementid':measurementid,
          "vechileno":vechileno
        }));

    print(response.body);

    if (response.statusCode == 200) {


      Get.offNamed(unverifiedresident,arguments: userdata);


      update();
    } else if (response.statusCode == 403) {

      var data = jsonDecode(response.body.toString());
      var errors =data['errors'] as List;

      for(int i=0; i<errors.length;i++)
      {
        Get.snackbar('Error', errors[i].toString());
      }
    }
  }




}
