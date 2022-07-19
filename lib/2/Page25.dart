import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../main.dart';
class Page25 extends StatefulWidget {
  static const String _title = 'Flutter Code Sample';
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<Page25> with WidgetsBindingObserver {
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
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(20.0),
                    child: Text(
                      "Cảm ơn bạn đã sử dụng dịch vụ,nhân viên CSKH sẽ liên hệ với bạn trong vòng 30 phút tới để xác nhận thông tin.Vui lòng để ý điện thoại trong thời gian trên",
                      style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),

                  const Text(
                    "- - - - - - - - - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - -  ",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    "GIẤY TỜ HỒ SƠ BẠN CẦN CHUẨN BỊ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(25, 10, 33, 10),
                      child: const Text(
                        "1.Đăng ký xe (Đối với xe thế chấp hoặc vay ngân hàng cần giấy biên chấp và đăng ký xe công chứng còn thời hạn)",
                        style: TextStyle(fontSize: 15),
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(16, 10, 230, 10),
                      child: const Text(
                        "2.Đăng kiểm xe cũ",
                        style: TextStyle(fontSize: 15),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 120,
                          height: 45,
                          color: Colors.orangeAccent,
                          child: TextButton(
                            child: const Text('HOÀN TẤT'),
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.yellow[700],
                              onSurface: Colors.grey,
                            ),
                            onPressed: () {
                              print('đã bấm nút HOÀN TẤT');
                              Navigator.of(context).popUntil((route) => route.isFirst);
                            },
                          ),
                        ),
                      ),

                    ],
                  )

                ],
              )),
        ),
      ),
    );
  }}