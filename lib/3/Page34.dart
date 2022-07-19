import 'package:flutter/material.dart';

import '../1/Page15.dart';
import '../2/Page25.dart';
import 'Page35.dart';
class Page34 extends StatefulWidget {
  static const String _title = 'Flutter Code Sample';
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<Page34> with WidgetsBindingObserver {
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
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "THANH TOÁN",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 20, height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 300,
                      height: 90,
                      color: Colors.amber[800],
                      child: TextButton.icon(
                          label: const Text('THANH TOÁN TRỰC TUYẾN',
                              style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold)),
                          icon: const Icon(
                            Icons.attach_money,
                            color: Colors.black,
                            size: 35,
                          ),
                          style: TextButton.styleFrom(
                              shape: const BeveledRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5)))),
                          onPressed: () {
                            print('đã bấm nút THANH TOÁN TRỰC TUYẾN');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Page35()));
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 300,
                      height: 90,
                      color: Colors.brown[600],
                      child: TextButton.icon(
                          label: const Text('THANH TOÁN TRỰC TIẾP',
                              style: TextStyle(color: Colors.white, fontSize: 19)),
                          icon: const Icon(
                            Icons.money,
                            color: Colors.black,
                            size: 35,
                          ),
                          style: TextButton.styleFrom(
                              shape: const BeveledRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5)))),
                          onPressed: () {
                            print('đã bấm nút THANH TOÁN TRỰC TIẾP');

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Page35()));
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 300,
                  ),
                ],
              )),
        ),
      ),
    );
  }}