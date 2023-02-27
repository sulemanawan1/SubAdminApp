import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/Generate%20Bill/Controller/generate_bill_controller.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';

import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';

class GenerateBill extends StatelessWidget {
  const GenerateBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenerateBillController>(
      init:GenerateBillController(),

        builder: (controller) {
      return SafeArea(


        child: Scaffold(


          body: Column(children: [

          MyBackButton(text: 'Generate Bill',),
          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.04,
          ),
          SvgPicture.asset(
            "assets/notices_vector.svg",
          ),
          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.04,
          ),
          MyTextFormField(

              onTap: () {
                controller.chooseBillStartDate(context);
              },
              suffixIcon: SvgPicture.asset(
                  "assets/add_event_icon.svg",

                  fit: BoxFit.scaleDown
              ),
              fillColor: Colors.white,
              controller: controller.bill_start_date,
              validator: emptyStringValidator,
              hintText: 'Choose Bill Start Date',
              labelText: 'Choose Bill Start Date',
              onFocusedBorderColor: primaryColor,
              onEnabledBorderColor: primaryColor),

          MyTextFormField(

              onTap: () {
                controller.chooseBillEndDate(context);
              },
              suffixIcon: SvgPicture.asset(
                  "assets/add_event_icon.svg",

                  fit: BoxFit.scaleDown
              ),
              fillColor: Colors.white,
              controller: controller.bill_end_date,
              validator: emptyStringValidator,
              hintText: 'Choose Bill END Date',
              labelText: 'Choose Bill END Date',
              onFocusedBorderColor: primaryColor,
              onEnabledBorderColor: primaryColor),
          MyTextFormField(

              onTap: () {
                controller.chooseBillDueDate(context);
              },
              suffixIcon: SvgPicture.asset(
                  "assets/add_event_icon.svg",

                  fit: BoxFit.scaleDown
              ),
              fillColor: Colors.white,
              controller: controller.bill_due_date,
              validator: emptyStringValidator,
              hintText: 'Choose Bill Due Date',
              labelText: 'Choose Bill Due Date',
              onFocusedBorderColor: primaryColor,
              onEnabledBorderColor: primaryColor),

MyButton(name: 'Generate', onPressed:controller.isLoading?null: () async{


  print(controller.user.userid);
  print(controller.bill_start_date.text);
  print(controller.bill_end_date.text);
  print(controller.bill_due_date.text);
  print(controller.status);
controller.residentList=await  controller.viewResidentsApi(controller.user.userid!, controller.user.bearerToken!);
  controller.li.clear();

for(int i=0 ;i <controller.residentList.length;i++)
  {

  controller.li.add(controller.residentList[i].residentid);

  }


  await  controller.generateBillApi(billstartdate: controller.bill_start_date.text, billenddate: controller.bill_end_date.text, duedate: controller.bill_due_date.text, status: controller.status, residentlists: controller.li, bearerToken: controller.user.bearerToken!, subadminid: controller.user.userid!);


},)

        ],),)
        ,

      );
    });
  }
}

