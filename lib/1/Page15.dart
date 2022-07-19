import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../main.dart';
class Page15 extends StatefulWidget {
  const Page15({Key? key, required this.title,
    required this.userName,
    required this.phoneNumber,
    required this.bsx,
    required this.idTP,
    required this.idTDK,
    required this.hangxe,
    required this.year,
    required this.user,
    required this.sohuu,
    required this.idPTDK,
    required this.idPTDB,
    required this.voucher,
    required this.dateDK,
    required this.dichvu,
    required this.timeDK,}) : super(key: key);

  final String title;
  final String userName;
  final String phoneNumber;
  final String bsx;
  final int idTP;
  final int idTDK;
  final int idPTDK;
  final int idPTDB;
  final String hangxe;
  final int year;
  final bool user;
  final bool sohuu;

  final bool dichvu;
  final String voucher;
  final String dateDK;
  final String timeDK;
  @override
  State<Page15> createState() =>
     _MyAppState();

}

class _MyAppState extends State<Page15> with WidgetsBindingObserver {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  getData() async {
    var response = await http.post(
      Uri.parse("https://api.dangkiem.online/api/User/schedule"),
      headers: {
        "DataContent-Type": "application/json",
      },
      body: json.encode({
        "name": widget.userName,
        "phoneNumber": widget.phoneNumber,
        "licensePlates": widget.bsx,
        "cityId": widget.idTP,
        "stationId": widget.idTDK,
        "vehiclePKDId": widget.idPTDK,
        "vehiclePDBId": widget.idPTDB,
        "carCompany": widget.hangxe,
        "yearofManufacture": widget.year,
        "isOwner": widget.user,
        "uses": widget.sohuu,
        "useService": widget.dichvu,
        "voucherCode": widget.voucher,
        "schedule": widget.dateDK,
        "timeSlot": widget.timeDK
      }),
    );
    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        content: const Text('Đặt lịch thành công'),
        action: SnackBarAction(
          label: 'Ẩn',
          textColor: Colors.white,
          onPressed: () {
          },
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        backgroundColor: Colors.blue,
      ); ScaffoldMessenger.of(context)
          .showSnackBar(snackBar);


    } else {
      final snackBar = SnackBar(
        content: const Text('Thông tin không hợp lệ'),
        action: SnackBarAction(
          label: 'Ẩn',
          textColor: Colors.white,
          onPressed: () {
          },
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        backgroundColor: Colors.blue,
      ); ScaffoldMessenger.of(context)
          .showSnackBar(snackBar);
      throw Exception('Failed to create album.');
    }
  }
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
    // return MaterialApp(
    //   key: _scaffoldKey,
    //   title: "Giao diện thực tập",
    //   home: Scaffold(
    return Scaffold(
      key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                    "MÃ QR-CODE ĐẶT LỊCH ĐĂNG KIỂM CỦA BẠN",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, fontFamily: 'RobotoMono'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  QrImage(
                    data: "hello",
                    version: QrVersions.auto,
                    size: 230.0,
                  ),
                  const Text("(Vui lòng xuất trình cho nhân viên tiếp đón)"),
                  const SizedBox(
                    height: 15,
                    width: 25,
                  ),
                  const Text(
                    "- - - - - - - - - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - -  ",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "GIẤY TỜ HỒ SƠ BẠN CẦN CHUẨN BỊ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                              backgroundColor: Colors.brown[700],
                              onSurface: Colors.grey,
                            ),
                            onPressed: () {
                              getData();
                              // print('đã bấm nút HOÀN TẤT');
                              // Navigator.of(context).popUntil((route) => route.isFirst);
                            },
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 120,
                          height: 45,
                          color: Colors.orangeAccent,
                          child: TextButton(
                            child: const Text('Lưu QRCODE'),
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.amber[800],
                              onSurface: Colors.grey,
                            ),
                            onPressed: () {

                            },
                          ),
                        ),
                      )
                    ],
                  )

                ],
              )),
        ),
      // ),
    );
  }}