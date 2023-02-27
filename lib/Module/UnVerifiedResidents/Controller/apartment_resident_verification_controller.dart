import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/Apartment.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/Building.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/Floor.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';
import '../../../Routes/set_routes.dart';
import '../../Login/Model/User.dart';
import '../Model/House.dart';
import '../Model/Measurement.dart';
import '../Model/Phase.dart';
import '../Model/Resident Model/ApartmentResident.dart' as ApartmentResident;


class ApartmentResidentVerificationController extends GetxController
{

  var data = Get.arguments;
  late final User userdata;
  late ApartmentResident.Data resident;

  String country = '';
  String state = '';
  String city = '';
  String propertyType = 'House';
  String residentalType = 'Rental';
  Phase? phases;
  Measurement? measurements;

  var isProperty = false;
  var measurementList = <Measurement>[];
  /* for apartments */

  Building? building;
  Floor? floor;
  Apartment? apartment;

  var buildingli = <Building>[];
  var floorli = <Floor>[];
  var apartmentli = <Apartment>[];
  TextEditingController vehicleNoController = TextEditingController();
  TextEditingController houseAddressDetailController = TextEditingController();

  var phaseList = <Phase>[];
  Property? houses;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userdata=data[0];
    resident=data[1];


    SelectedPhase(Phase(id: resident.phase?[0].id as int?, name: resident.phase![0].name, subadminid: resident.subadminid as int?, societyid: resident.societyid as int?));
    SelectedBuilding(Building(id:    resident.building?[0].id as int?, pid: resident.building?[0].pid as int?, societybuildingname: resident.building?[0].societybuildingname));
    SelectedFloor(Floor(id: resident.floor?[0].id as int?, buildingid: resident.floor?[0].buildingid as int?, name: resident.floor?[0].name));
    SelectedApartment(Apartment(id: resident.apartment?[0].id as int?, societybuildingfloorid: resident.apartment?[0].societybuildingfloorid as int?, name: resident.apartment?[0].name));
    SelectedMeasurement(Measurement(id: resident.measurement![0].id as int?, subadminid: resident.subadminid as int?, charges: resident.measurement![0].charges as int?, area: resident.measurement![0].area as int?, bedrooms: resident.measurement![0].bedrooms as int?, status: resident.measurement![0].status as int?, type: resident.measurement![0].type , unit: resident.measurement![0].unit));
    vehicleNoController.text = resident.vechileno!;
    state = resident.state!;
    city = resident.city!;
  }

  SelectedPropertyType(val) {
    propertyType = val;
    update();
  }

  SelectedPhase(val) async {


  building=null;
    floor=null;
     apartment=null;
     measurements=null;

    buildingli.clear();
    floorli.clear();
    apartmentli.clear();
    measurementList.clear();


    phases = val;

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


  Future<List<Building>> viewAllBuildingApi({required phaseid,required bearerToken}) async {

    print(phaseid);
    var response = await Dio().get(
        Api.societybuildings + '/' + phaseid.toString(),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${bearerToken}"
        }));
    var data = response.data['data'];

    buildingli = (data as List)
        .map((e) => Building(
      id: e['id'],
      pid: e['pid'],
      societybuildingname: e['societybuildingname'],
    ))
        .toList();

    return buildingli;
  }

  Future<List<Floor>> viewAllFloorApi({required buildingid,required bearerToken}) async {

    print(buildingid);
    var response = await Dio().get(
        Api.viewsocietybuildingfloors + '/' + buildingid.toString(),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${bearerToken}"
        }));
    var data = response.data['data'];

    floorli = (data as List)
        .map((e) => Floor(
      id: e['id'],
      buildingid: e['pid'],
      name: e['name'],
    ))
        .toList();

    return floorli;
  }

  Future<List<Apartment>> viewAllApartmentApi({required floorid,required bearerToken}) async {

    print(floorid);
    var response = await Dio().get(
        Api.viewsocietybuildingapartments + '/' + floorid.toString(),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${bearerToken}"
        }));
    var data = response.data['data'];

    apartmentli = (data as List)
        .map((e) => Apartment(
      id: e['id'],
      name: e['name'],
      societybuildingfloorid: e['societybuildingfloorid'],
    ))
        .toList();

    return apartmentli;
  }
  SelectedBuilding(val) async {
    apartmentli.clear();
    apartment = null;
    floor = null;
    floorli.clear();
    measurements = null;

    measurementList.clear();
    building = val;

    update();
  }

  SelectedFloor(val) async {
    apartmentli.clear();
    apartment = null;
    measurements = null;
    measurementList.clear();

    floor = val;

    update();
  }

  SelectedApartment(val) async {
    measurements = null;
    measurementList.clear();

    apartment = val;


    update();
  }


  Future verifyApartmentResidentApi({
    residentid,
    required int status,
    pid,
   buildingid,
   societybuildingfloorid,
    societybuildingapartmentid,
    measurementid,
    vechileno,
    required String token,
  }) async {
    final response = await Http.post(Uri.parse(Api.verifyapartmentresident),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token"
        },
        body: jsonEncode(<String, dynamic>{
          "residentid": residentid,
          "status": status,
          'buildingid':buildingid,
          'societybuildingfloorid':societybuildingfloorid,
          'societybuildingapartmentid':societybuildingapartmentid,
          'pid':pid,
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