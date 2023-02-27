import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Add%20Blocks/Controller/add_block_controller.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Constants/constants.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/My Button/my_button.dart';

class AddBlocks extends GetView {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<AddBlockController>(
            init: AddBlockController(),
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      MyBackButton(
                        text: 'Add Blocks',
                        onTap: (){

                          Get.offAndToNamed(blocks, arguments: [
                           controller.pid,
                            controller.bearerToken
                          ]);

                        },
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 244,
                        width: 299,
                        child: Card(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 28, left: 27),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 27),
                                  child: Row(
                                    children: [
                                      Container(
                                        color: Color(0xFFF7F8FA),
                                        height: 25,
                                        width: 98,
                                        child: Center(
                                            child: Text(
                                          'From Blocks',
                                          style: TextStyle(
                                              color: HexColor('#535353')),
                                        )),
                                      ),
                                      SizedBox(
                                        width: 18,
                                      ),
                                      Image(
                                          image:
                                              AssetImage('assets/arrow1.png')),
                                      SizedBox(
                                        width: 18,
                                      ),
                                      Container(
                                        color: Color(0xFFF7F8FA),
                                        height: 25,
                                        width: 98,
                                        child: Center(
                                            child: Text(
                                          'To Blocks',
                                          style: TextStyle(
                                              color: HexColor('#535353')),
                                        )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 38),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 38),
                                      child: Container(
                                        width: 75,
                                        height: 75,
                                        color:
                                            Color.fromRGBO(255, 153, 0, 0.14),
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: Image(
                                                  image: AssetImage(
                                                      'assets/blockfieldpic.png')),
                                            ),
                                            Center(
                                              child: TextFormField(
                                                validator: emptyStringValidator,
                                                controller:
                                                    controller.fromController,
                                                keyboardType:
                                                    TextInputType.number,
                                                enabled: true,
                                                decoration: InputDecoration(
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          BorderSide(), //<-- SEE HERE
                                                    ),
                                                    border: InputBorder.none),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 72,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 75,
                                        height: 75,
                                        color:
                                            Color.fromRGBO(255, 153, 0, 0.14),
                                        // decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/textfieldimg.png'))),

                                        child: Stack(
                                          children: [
                                            Center(
                                              child: Image(
                                                  image: AssetImage(
                                                      'assets/blockfieldpic.png')),
                                            ),
                                            Center(
                                              child: TextFormField(
                                                validator: emptyStringValidator,
                                                controller:
                                                    controller.toController,
                                                keyboardType:
                                                    TextInputType.number,
                                                enabled: true,
                                                decoration: InputDecoration(
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          BorderSide(), //<-- SEE HERE
                                                    ),
                                                    border: InputBorder.none),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MyButton(
                                height: 37,
                                width: 222,
                                border: 5,
                                onPressed: () {
                                  // print(controller.user.userid);
                                  // print(controller.user.bearerToken);

                                  controller.addBlocksApi(
                                    bearerToken: controller.bearerToken!,
                                    from: controller.fromController.text
                                        .toString(),
                                    to: controller.toController.text.toString(),
                                    pid: controller.pid!,
                                  );
                                },
                                name: 'Save',
                              )
                            ],
                          ),
                        ),
                      ),
                    
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
