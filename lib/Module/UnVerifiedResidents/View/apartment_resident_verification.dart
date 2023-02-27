import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Controller/apartment_resident_verification_controller.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/Apartment.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/Building.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/Floor.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/Measurement.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/Phase.dart';

import '../../../Constants/api_routes.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My Text/my_text.dart';

class ApartmentResidentVerification extends GetView {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: GetBuilder<ApartmentResidentVerificationController>(
          init:ApartmentResidentVerificationController() ,

          builder: (controller) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,


            children: [
              MyBackButton(
                text: 'Apartment Resident Verification',
                onTap: () {
                  Get.offNamed(unverifiedresident,
                      arguments: controller.userdata);
                },
              ),

              Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    width: 180,
                                    height: 180,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 0.1,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: NetworkImage(imageBaseUrl +
                                                controller.resident.image
                                                    .toString()))),
                                  ),
                                ),
                                MyText(name: 'Name'),
                                MyText(
                                  name: controller.resident.firstname
                                      .toString() +
                                      "" +
                                      controller.resident.lastname.toString(),
                                  color: Colors.grey,
                                ),
                                MyText(name: 'Cnic'),
                                MyText(
                                  name: controller.resident.cnic.toString(),
                                  color: Colors.grey,
                                ),
                                MyText(name: 'Mobile no'),
                                MyText(
                                  name:
                                  controller.resident.mobileno.toString(),
                                  color: Colors.grey,
                                ),
                                MyText(name: 'Country'),
                                MyText(
                                  name: controller.country.toString(),
                                  color: Colors.grey,
                                ),
                                MyText(name: 'State'),
                                MyText(
                                  name: controller.resident.state.toString(),
                                  color: Colors.grey,
                                ),
                                MyText(name: 'City'),
                                MyText(
                                  name: controller.resident.city.toString(),
                                  color: Colors.grey,
                                ),
                                MyText(name: 'Residental Type'),
                                MyText(
                                  name: controller.resident.residenttype
                                      .toString(),
                                  color: Colors.grey,
                                ),
                                MyText(name: 'Phase'),
                                DropdownSearch<Phase>(
                                  validator: (value) =>
                                  value == null ? 'field required' : null,
                                  asyncItems: (String filter) async {
                                    print(filter);
                                    return controller.viewAllPhasesApi(
                                        societyid:
                                        controller.userdata.societyid!,
                                        bearerToken:
                                        controller.userdata.bearerToken);
                                  },
                                  onChanged: (Phase? data) {
                                    controller.SelectedPhase(data);
                                  },
                                  selectedItem: controller.phases,
                                  itemAsString: (Phase p) {
                                    return p.name.toString();
                                  },
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(
                                          8, 0, 0, 0),
                                      child: Text(
                                        "Select Building",
                                        style: GoogleFonts.ubuntu(
                                            fontStyle:
                                            FontStyle.normal,
                                            // color: secondaryColor,
                                            fontWeight:
                                            FontWeight.w400,
                                            fontSize: 14,
                                            color:
                                            HexColor('#4D4D4D')),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
                                      child: DropdownSearch<Building>(
                                        validator: (value) =>
                                        value == null
                                            ? 'field required'
                                            : null,
                                        asyncItems:
                                            (String filter) async {
                                          print(filter);
                                          return controller.viewAllBuildingApi(phaseid: controller.phases?.id,bearerToken: controller.userdata.bearerToken);
                                        },
                                        onChanged: (Building? data) {
                                          controller.SelectedBuilding(
                                              data);
                                        },
                                        selectedItem:
                                        controller.building,
                                        itemAsString: (Building p) {
                                          return p.societybuildingname.toString();
                                        },
                                      ),
                                    ),

                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(
                                          8, 0, 0, 0),
                                      child: Text(
                                        "Select Floor",
                                        style: GoogleFonts.ubuntu(
                                            fontStyle:
                                            FontStyle.normal,
                                            // color: secondaryColor,
                                            fontWeight:
                                            FontWeight.w400,
                                            fontSize: 14,
                                            color:
                                            HexColor('#4D4D4D')),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
                                      child: DropdownSearch<Floor>(
                                        validator: (value) =>
                                        value == null
                                            ? 'field required'
                                            : null,
                                        asyncItems:
                                            (String filter) async {
                                          print(filter);
                                          return controller.viewAllFloorApi(buildingid: controller.building?.id,bearerToken: controller.userdata.bearerToken);
                                        },
                                        onChanged: (Floor? data) {
                                          controller.SelectedFloor(
                                              data);
                                        },
                                        selectedItem:
                                        controller.floor,
                                        itemAsString: (Floor p) {
                                          return p.name.toString();
                                        },
                                      ),
                                    ),



                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(
                                          8, 0, 0, 0),
                                      child: Text(
                                        "Select Apartment",
                                        style: GoogleFonts.ubuntu(
                                            fontStyle:
                                            FontStyle.normal,
                                            // color: secondaryColor,
                                            fontWeight:
                                            FontWeight.w400,
                                            fontSize: 14,
                                            color:
                                            HexColor('#4D4D4D')),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
                                      child: DropdownSearch<Apartment>(
                                        validator: (value) =>
                                        value == null
                                            ? 'field required'
                                            : null,
                                        asyncItems:
                                            (String filter) async {
                                          print(filter);
                                          return controller.viewAllApartmentApi(floorid: controller.floor?.id,bearerToken: controller.userdata.bearerToken);
                                        },
                                        onChanged: (Apartment? data) {
                                          controller.SelectedApartment(
                                              data);
                                        },
                                        selectedItem:
                                        controller.apartment,
                                        itemAsString: (Apartment p) {
                                          return p.name.toString();
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(
                                          8, 0, 0, 0),
                                      child: Text(
                                        "Select Area Type",
                                        style: GoogleFonts.ubuntu(
                                            fontStyle:
                                            FontStyle.normal,
                                            // color: secondaryColor,
                                            fontWeight:
                                            FontWeight.w400,
                                            fontSize: 14,
                                            color:
                                            HexColor('#4D4D4D')),
                                      ),
                                    ),
                                    DropdownSearch<Measurement>(
                                      validator: (value) =>
                                      value == null ? 'field required' : null,
                                      asyncItems: (String filter) async {
                                        print(filter);
                                        return controller
                                            .housesApartmentsModelApi(
                                            subAdminId: controller
                                                .phases!.subadminid!,
                                            token: controller
                                                .userdata!.bearerToken!,
                                            type: 'apartment');
                                      },
                                      onChanged: (Measurement? data) {
                                        controller.SelectedMeasurement(data);
                                      },
                                      selectedItem: controller.measurements,
                                      itemAsString: (Measurement p) {
                                        return p.area.toString() +
                                            ' ' +
                                            p.unit.toString();
                                      },
                                    ),


                                  ],),

                                MyText(name: 'Vechile Number'),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: TextFormField(
                                    controller:
                                    controller.vehicleNoController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white70,
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        hintText: 'Vehicle Number',
                                        hintStyle: TextStyle(
                                          decorationStyle:
                                          TextDecorationStyle.dashed,
                                        )),
                                  ),
                                ),
                                Center(
                                  child: MyButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        controller.verifyApartmentResidentApi(
                                            residentid: controller
                                                .resident.residentid,
                                            status: 1,
                                            token: controller
                                                .userdata.bearerToken!,
                                            measurementid:
                                            controller.measurements!.id,
                                            pid: controller.phases!.id!,
                                            buildingid: controller.building!.id!,
                                            societybuildingfloorid: controller.floor!.id!,
                                            societybuildingapartmentid: controller.apartment!.id!,
                                            vechileno: controller
                                                .vehicleNoController.text);
                                        // Get.offNamed(unverifiedresident,
                                        //     arguments: controller.userdata);
                                      }
                                    },
                                    name: 'Verify',
                                    color: Colors.green,
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    )),
              ),





          ],),
        );
      }),


    ));
  }
}
