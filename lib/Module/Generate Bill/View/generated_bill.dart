import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';

import '../../../Routes/set_routes.dart';
import '../Controller/generated_bill_controller.dart';

class GeneratedBill extends StatelessWidget {
  const GeneratedBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<GeneratedBillController>(
          init: GeneratedBillController(),
          builder: (controller) {
            return Scaffold(
                body: Column(
                  children: [
                    MyBackButton(text: 'Generated Bill'),
                    Expanded(
                      child: FutureBuilder(
                          future: controller.generatedBillApi(
                              controller.user!.userid!,
                              controller.user.bearerToken!),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return DataTable(
                                  dataRowHeight: 40,
                                  columnSpacing: 30,
                                  // dataTextStyle: TextStyle(fontSize: 14,color: Colors.black),
                                  border: TableBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  columns: [
                                    DataColumn(label: Text('Name')),
                                    DataColumn(label: Text('Cnic')),
                                    DataColumn(label: Text('DueDate')),
                                    DataColumn(label: Text('Charges')),
                                    DataColumn(label: Text('Status')),
                                  ],
                                  rows: (snapshot.data.data as List)
                                      .map((e) => DataRow(cells: [
                                            DataCell(Text(
                                                e.firstname.toString() +
                                                    ' ' +
                                                    e.lastname.toString())),
                                            DataCell(Text(e.cnic.toString())),
                                            DataCell(
                                                Text(e.duedate.toString())),
                                            DataCell(
                                                Text(e.charges.toString())),
                                            DataCell(Text(e.status.toString())),
                                          ]))
                                      .toList());
                            } else if (snapshot.hasError) {
                              return Icon(Icons.error_outline);
                            } else {
                              return CircularProgressIndicator();
                            }
                          }),
                    ),
                  ],
                ),
                floatingActionButton: IconButton(
                    padding: EdgeInsets.only(top: 85),
                    iconSize: MediaQuery.of(context).size.height * 0.065,
                    icon: SvgPicture.asset('assets/floatingbutton.svg'),
                    onPressed: () {
                      Get.toNamed(generatebill, arguments: controller.user);
                    }));
          }),
    );
  }
}
