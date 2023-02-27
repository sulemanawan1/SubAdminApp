import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Houses/Controller/houses_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/Empty%20List/empty_list.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';

import '../../../../Widgets/Loader/loader.dart';

class Houses extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HouseController>(
        init: HouseController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: ()async
            {

              await  Get.offNamed(streets, arguments: [
                controller.bid,
                controller.pid,
                controller.bearerToken
              ]);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  floatingActionButton: IconButton(
                      padding: EdgeInsets.only(top: 85),
                      iconSize: MediaQuery.of(context).size.height * 0.065,
                      icon: SvgPicture.asset('assets/floatingbutton.svg'),
                      onPressed: () {
                        Get.offNamed(addhouses,
                            arguments: [controller.sid,controller.bid,controller.pid, controller.bearerToken]);
                        // Get.offAndToNamed(addblocks,arguments: [controller.pid,controller.bearerToken]);
                      }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Houses',
                        onTap: (){

                          Get.offNamed(streets, arguments: [
                           controller.bid,
                            controller.pid,
                            controller.bearerToken
                          ]);
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                      Expanded(
                          child: FutureBuilder(
                              future: controller.housesApi(
                                  sid: controller.sid!,
                                  bearerToken: controller.bearerToken!),
                              builder:
                                  (BuildContext context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {

                                  if (snapshot.data != null && snapshot.data.data.length!=0) {
                                  return ListView.builder(
                                    itemCount: snapshot.data.data.length,
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      return SizedBox(
                                        height: 64,
                                        width: 324,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                          color: HexColor('#F3F3F3'),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                24, 0, 0, 0),
                                            child: Row(
                                              children: [
                                                Container(height: 43,
                                                  width: 43,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Color.fromRGBO(
                                                          255, 153, 0, 0.14),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/house1.png'))
                                                  ),
                                                ),
                                                SizedBox(width: 20,),
                                                Text(
                                                  snapshot.data.data[index]
                                                      .address
                                                      .toString(),
                                                  style: GoogleFonts.ubuntu(
                                                      fontStyle: FontStyle.normal,
                                                      // color: secondaryColor,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 18,
                                                      color: HexColor('#4D4D4D')),
                                                ),
                                                SizedBox(width: 132,)
                                                ,

                                                Image.asset(
                                                    'assets/arrowfrwd.png')
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                                  else {
                                    return EmptyList( name:'No Houses');
                                  }
                                } else if (snapshot.hasError) {
                                  return Icon(Icons.error_outline);
                                } else {
                                  return Loader();
                                }
                              })),
//                 MyButton(
//                     name: 'Next',
//                     onPressed: controller.isLoading
//                         ? null
//                         : () {
//                             if (controller.formkey.currentState!.validate()) {
// print(controller.myApiData);
//                             } else {
//                               return null;
//                             }
//                           })
                    ],
                  )),
            ),
          );
        });
  }
}
