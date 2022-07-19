import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../main.dart';
class Page62 extends StatefulWidget {
  static const String _title = 'Flutter Code Sample';
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<Page62> with WidgetsBindingObserver {
// const Page1({Key? key}) : super(key: key);



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
                    margin: const EdgeInsets.all(0.0),
                    child: Text(
                      "Cảm ơn bạn đã đặt mua bảo hiểm vật chất xe (thân vỏ)",
                      style: TextStyle(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.bold),
                    ),

                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(0.0),
                    child: Text(
                      "Các hãng bảo hiểm sẽ báo giá chi tiết và các gói tương ứng cho bạn",
                      style: TextStyle(fontSize: 12, color: Colors.grey[600],fontWeight: FontWeight.bold),
                    ),

                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(0.0),
                    child: Text(
                      "qua địa chỉ email hoặc ứng dụng SAUTO",
                      style: TextStyle(fontSize: 12, color: Colors.grey[600],fontWeight: FontWeight.bold),
                    ),

                  ),
                  const SizedBox(
                    height: 60,
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