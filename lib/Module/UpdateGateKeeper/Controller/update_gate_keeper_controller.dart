import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:image_picker/image_picker.dart';
import 'package:societyadminapp/Module/GateKepeer/Model/gate_keeper_model.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';
class UpdateGateKeeperController extends GetxController {
  var argument = Get.arguments;
  late final Gatekeeper gatekeeper;
  late final User user;
  var isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    gatekeeper = argument[0];
    user = argument[1];

    fnameController.text = gatekeeper.firstName!;
    lnameController.text = gatekeeper.lastName!;
    gatenoController.text = gatekeeper.gateno!;
    mobilenoController.text = gatekeeper.mobileno!;
    addressController.text = gatekeeper.address!;
    passwordController.text = gatekeeper.password!;
  }

  String? token;
  var file;
  var isFile = false;
  var isHidden = false;
  final formKey = new GlobalKey<FormState>();

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController mobilenoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gatenoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File? imageFile;

  getFromGallery(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      print('file picked: $pickedFile');
      // img = pickedFile as Image?;

      print('Assigning Image file');
      imageFile = File(pickedFile.path);
      update();
    }
  }

  getFromCamera(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      print('file picked: $pickedFile');
      // img = pickedFile as Image?;

      print('Assigning Image file');
      imageFile = File(pickedFile.path);
      update();
    }
  }

  Future updateGatekeeperApi({
    required int gatekeeperid,
    required String gatekeeperfirstname,
    required String gatekeeperlastname,
    required String gatekeepergateno,
    required String gatekeepermobileno,
    required String gatekeeperaddress,
    required String gatekeeperpassword,
    required File? image,
    required String bearerToken,
  }) async {
    print("update api");
    print(gatekeeperid.toString());
    print(gatekeeperfirstname);
    print(gatekeeperaddress);
    print(bearerToken.toString());
    print(image);
    isLoading=true;
    update();


    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};

    var request =
        Http.MultipartRequest('POST', Uri.parse(Api.update_gatekeeper));
    request.headers.addAll(headers);
    if (image != null) {
      request.files.add(await Http.MultipartFile.fromPath('image', image.path));
    }
    request.fields['firstname'] = gatekeeperfirstname;
    request.fields['lastname'] = gatekeeperlastname;

    request.fields['address'] = gatekeeperaddress;
    request.fields['mobileno'] = gatekeepermobileno;
    //request.fields['roleid'] = 1.toString();
    //request.fields['rolename'] = 'subadmin';
    request.fields['gateno'] = gatekeepergateno;

    request.fields['password'] = gatekeeperpassword;
    //request.fields['superadminid'] = userid.toString();
    request.fields['id'] = gatekeeperid.toString();

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body.toString());

      Get.offAndToNamed(gatekeeperscreen, arguments: user);
    } else {


    }
  }

  void togglePasswordView() {
    isHidden = !isHidden;
    update();
  }
}
