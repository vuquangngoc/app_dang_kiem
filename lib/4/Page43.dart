import 'package:flutter/material.dart';

import '../1/Page15.dart';
import '../2/Page25.dart';
import '../3/Page35.dart';
import 'Page44.dart';
class Page43 extends StatefulWidget {
  static const String _title = 'Flutter Code Sample';
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<Page43> with WidgetsBindingObserver {
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
                  SizedBox(width: 20, height: 10),
                  Image.asset('images/nganhang.jpg', width: 450,height: 360),
                  SizedBox(width: 20, height: 100),
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
                            print('đã bấm nút quay lại page 42');
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
                                builder: (context) => Page44()));
                          } ,
                        ),
                      ]),
                  const SizedBox(
                    height: 300,
                  ),
                ],
              )),
        ),
      ),
    );
  }}