import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import '../1/Page1.dart';
import '../1/Page12.dart';
import '../1/Page14.dart';
import 'Page24.dart';
import '../main.dart';
import '../repository.dart';
import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

// class Item {
//   const Item({required this.namecity});
//   final String namecity;
// }

class Page23 extends StatefulWidget {
  static const String _title = 'Flutter Code Sample';
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<Page23> with WidgetsBindingObserver {
// const Page1({Key? key}) : super(key: key);
  static final Map<String, String> genderMap = {
    'male': 'Male',
    'female': 'Female',
    'other': 'Other',
  };
  int _selection = 0;

  selectTime(int? timeSelected) {
    setState(() {
      _selection = timeSelected!;
    });
  }

  String _selectedGender = genderMap.keys.first;


  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }
    return MaterialApp(
      title: "Giao diện thực tập",
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Center(
              child: Column(children: <Widget>[
                Image.asset('images/logo.png', width: 50,height: 35),

                SizedBox(width: 20, height: 0),
                const Text('CỔNG DỊCH VỤ ĐĂNG KIỂM BẢO HIỂM',
                    style: TextStyle(fontSize: 17)),
              ])),
        ),
        body: Center(
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[


                    // DropdownButton(
                    //   items: _dropdownMenuItems,
                    //   value: _selectedCompany,
                    //   onChanged: onChangeDropdownItem,
                    // ),

                    // Text(
                    //   "${selectedDate.toLocal()}".split(' ')[0],
                    //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(
                    //   height: 20.0,
                    // ),
                    // RaisedButton(
                    //   onPressed: () => _selectDate(context),
                    //   child: Text(
                    //     'Select date',
                    //     style:
                    //     TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    //   ),
                    //   color: Colors.greenAccent,
                    // ),
                    const Text(
                      'CHI PHÍ TẠM TÍNH ',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20, height: 5),
                    const Text(
                      "- - - - - - - - - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - -  ",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 0.1,
                    ),
                    // GroupButton(
                    //   spacing: 5,
                    //   isRadio: false,
                    //   direction: Axis.horizontal,
                    //   onSelected: (index, isSelected) =>
                    //       print('$index button is ${isSelected ? 'selected' : 'unselected'}'),
                    //   buttons: ["Dart","Kotlin","Java","Swift","Objective-C","Python","JS"],
                    //   selectedButtons: [0, 1], /// [List<int>] after 2.2.1 version
                    //   selectedTextStyle: TextStyle(
                    //     fontWeight: FontWeight.w600,
                    //     fontSize: 16,
                    //     color: Colors.red,
                    //   ),
                    //   unselectedTextStyle: TextStyle(
                    //     fontWeight: FontWeight.w600,
                    //     fontSize: 14,
                    //     color: Colors.grey[600],
                    //   ),
                    //   selectedColor: Colors.white,
                    //   unselectedColor: Colors.grey,
                    //   selectedBorderColor: Colors.red,
                    //   unselectedBorderColor: Colors.grey,
                    //   borderRadius: BorderRadius.circular(5.0),
                    //   selectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
                    //   unselectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
                    // ),

                    // const Padding(
                    //   padding: EdgeInsets.only(bottom: 5.0),
                    // ),
                    // CupertinoRadioChoice(
                    //     choices: genderMap,
                    //     onChange: onGenderSelected,
                    //     initialKeyValue: _selectedGender),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     InkWell(
                    //       onTap: () {
                    //         setState(() {
                    //           _selection = 1;
                    //         });
                    //       },
                    //       child: Stack(
                    //         children: <Widget>[
                    //           Container(
                    //             height: 40,
                    //             width: 100,
                    //             color:
                    //                 _selection == 1 ? Colors.green : Colors.white,
                    //           ),
                    //           Row(
                    //             children: <Widget>[
                    //               Radio(
                    //                 focusColor: Colors.white,
                    //                 groupValue: _selection,
                    //                 onChanged: selectTime,
                    //                 value: 1,
                    //               ),
                    //               Text(
                    //                 "11:00 ",
                    //                 style: TextStyle(fontWeight: FontWeight.bold),
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     InkWell(
                    //       onTap: () {
                    //         setState(() {
                    //           _selection = 2;
                    //         });
                    //       },
                    //       child: Stack(
                    //         children: <Widget>[
                    //           Container(
                    //             height: 40,
                    //             width: 100,
                    //             color:
                    //                 _selection == 2 ? Colors.green : Colors.white,
                    //           ),
                    //           Row(
                    //             children: <Widget>[
                    //               Radio(
                    //                 focusColor: Colors.white,
                    //                 groupValue: _selection,
                    //                 onChanged: selectTime,
                    //                 value: 2,
                    //               ),
                    //               Text(
                    //                 "13:00",
                    //                 style: TextStyle(fontWeight: FontWeight.bold),
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     InkWell(
                    //       onTap: () {
                    //         setState(() {
                    //           _selection = 3;
                    //         });
                    //       },
                    //       child: Stack(
                    //         children: <Widget>[
                    //           Container(
                    //             height: 40,
                    //             width: 100,
                    //             color:
                    //                 _selection == 3 ? Colors.green : Colors.white,
                    //           ),
                    //           Row(
                    //             children: <Widget>[
                    //               Radio(
                    //                 focusColor: Colors.white,
                    //                 groupValue: _selection,
                    //                 onChanged: selectTime,
                    //                 value: 3,
                    //               ),
                    //               Text(
                    //                 "13:00",
                    //                 style: TextStyle(fontWeight: FontWeight.bold),
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),



                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Phí kiểm định",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(15),
                          width: 107,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(""),
                        )
                      ],
                    ),
                    const Text(
                      "- - - - - - - - - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - -  ",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Lệ phí cấp chứng nhận đăng kiểm",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(15),
                          width: 107,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(""),
                        )
                      ],
                    ),
                    const Text(
                      "- - - - - - - - - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - -  ",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Phí bảo trì đường bộ",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(15),
                          width: 107,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(""),
                        )
                      ],
                    ),
                    const Text(
                      "- - - - - - - - - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - -  ",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Phí dịch vụ đi đăng kiểm",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(15),
                          width: 107,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(""),
                        )
                      ],
                    ),
                    const Text(
                      "- - - - - - - - - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - -  ",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "MÃ ƯU ĐÃI",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(15),
                          width: 120,
                          height: 50,
                          child: const TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)))),
                              keyboardType: TextInputType.text),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 90,
                            height: 35,
                            color: Colors.orangeAccent,
                            child: TextButton(
                              child: const Text('ÁP DỤNG',style: TextStyle(fontWeight: FontWeight.bold),),
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.blue,
                                onSurface: Colors.black,

                              ),
                              onPressed: () {
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    const Text(
                      "- - - - - - - - - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - -  ",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "TỔNG CHI PHÍ",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(15),
                          width: 221,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(""),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlatButton(
                            shape: StadiumBorder(),
                            padding: EdgeInsets.all(15.0),
                            child: Text('QUAY LẠI'),
                            textColor: Colors.white,
                            color: Colors.brown[600],

                            // onPressed: () {
                            //   print('đã bấm nút quay lại page 1');
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (context) => Page1()));
                            //
                            // },
                            onPressed: () {
                              print('đã bấm nút quay lại page 1');
                              Navigator.pop(context);
                            },
                          ),
                          FlatButton(
                            padding: EdgeInsets.all(15.0),
                            shape: StadiumBorder(),
                            child: Text('TIẾP TỤC'),
                            textColor: Colors.white,
                            color: Colors.yellow[800],
                            onPressed: () {

                              print('đã bấm nút tiếp tục');
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Page24()));
                            } ,
                          ),
                        ]),
                  ])),
        ),
      ),
    );
  }

  void onGenderSelected(String genderKey) {
    setState(() {
      _selectedGender = genderKey;
    });
  }
}
// void onGenderSelected(String genderKey) {
//   setState(() {
//     _selectedGender = genderKey;
//   });
// }
