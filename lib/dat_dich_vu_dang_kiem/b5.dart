import 'dart:convert';

// import 'package:dkxe_myapp/modul/Datlich.dart';
import 'package:test11/model/qrcode.dart';
import 'package:test11/model/userdl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Page25 extends StatefulWidget {
  const Page25({Key? key,
    // required this.title,
    required this.userName,
    required this.phoneNumber,
    required this.bsx,
    required this.idTP,
    // required this.idTDK,
    required this.diachinhanxe,
    required this.hangxe,
    required this.year,
    required this.user,
    required this.sohuu,
    required this.idPTDK,
    required this.idPTDB,
    required this.voucher,
    required this.dateDK,
    // required this.dichvu,
    required this.timeDK,
  }) : super(key: key);
  final String diachinhanxe;
  // final String title;
  final String userName;
  final String phoneNumber;
  final String bsx;
  final int idTP;
  // final int idTDK;
  final int idPTDK;
  final int idPTDB;
  final String hangxe;
  final int year;
  final bool user;
  final bool sohuu;

  // final bool dichvu;
  final String voucher;
  final String dateDK;
  final String timeDK;
  @override
  State<Page25> createState() => _Page25State();
}

class _Page25State extends State<Page25> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked = false;
  late Future<Qrcode> futureQr;
  // upData() async {
  //   var response = await http.post(
  //     Uri.parse("https://api.dangkiem.online/api/User/schedule"),
  //     headers: {
  //       "Content-Type": "application/json",
  //     },
  //     body: json.encode({
  //       "name": widget.userName,
  //       "phoneNumber": widget.phoneNumber,
  //       "licensePlates": widget.bsx,
  //       "cityId": widget.idTP,
  //       "stationId": widget.idTDK,
  //       "vehiclePKDId": widget.idPTDK,
  //       "vehiclePDBId": widget.idPTDB,
  //       "carCompany": widget.hangxe,
  //       "yearofManufacture": widget.year,
  //       "isOwner": widget.user,
  //       "uses": widget.sohuu,
  //       "useService": widget.dichvu,
  //       "voucherCode": widget.voucher,
  //       "schedule": widget.dateDK,
  //       "timeSlot": widget.timeDK
  //     }),
  //   );
  //   if (response.statusCode == 200) {
  //     print('đã bấm nút HOÀN TẤT');
  //   // Navigator.of(context).popUntil((route) => route.isFirst);
  //   //   Future.delayed(Duration(seconds: 5),
  //   //           () => Navigator.of(context).popUntil((route) => route.isFirst)
  //   //   );
  //     final snackBar = SnackBar(
  //       content: const Text('Đặt lịch thành công'),
  //       action: SnackBarAction(
  //         label: 'Ẩn',
  //         textColor: Colors.white,
  //         onPressed: () {
  //         },
  //       ),
  //       behavior: SnackBarBehavior.floating,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(24),
  //       ),
  //       backgroundColor: Colors.blue,
  //     ); ScaffoldMessenger.of(context)
  //         .showSnackBar(snackBar);
  //     // Future.delay(
  //     //     const Duration(seconds: 5),
  //     //         () => popUntil((route) => route.isFirst)
  //     // );
  //
  //
  //   } else {
  //     final snackBar = SnackBar(
  //       content: const Text('Thông tin không hợp lệ'),
  //       action: SnackBarAction(
  //         label: 'Ẩn',
  //         textColor: Colors.white,
  //         onPressed: () {
  //         },
  //       ),
  //       behavior: SnackBarBehavior.floating,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(24),
  //       ),
  //       backgroundColor: Colors.blue,
  //     ); ScaffoldMessenger.of(context)
  //         .showSnackBar(snackBar);
  //     throw Exception('Failed to create album.');
  //   }
  // }





  Future<Qrcode> postQr() async {
    const uri = 'https://api.dangkiem.online/api/User/home_service';
    var name = widget.userName;
    var phone = widget.phoneNumber;
    var bsx = widget.bsx;
    var city = widget.idTP;
    // var stationId = widget.idTDK;
    var vehiclePKDId = widget.idPTDK;
    var diachinhanxe = widget.diachinhanxe;
    var vehiclePDBId = widget.idPTDB;
    var hang = widget.hangxe;
    var nam = widget.year;
    var isOwner = widget.user;
    var uses = widget.sohuu;
    // var useService = widget.dichvu;
    var voucher = widget.voucher;
    var date = widget.dateDK;
    var timeslot = widget.timeDK;
    var requestBody = {
      "name": name,
      "phoneNumber":phone ,
      "licensePlates":bsx ,
      "cityId":city ,
      "carDeliveryAddress":diachinhanxe,
      // "stationId": stationId,
      "vehiclePKDId": vehiclePKDId,
      "vehiclePDBId":vehiclePDBId ,
      "carCompany": hang,
      "yearofManufacture": nam,
      "isOwner": isOwner,
      "uses": uses,
      // "useService":useService ,
      "voucherCode": voucher,
      "date": date,
      "time":timeslot

    };
    Map<String, String> headers = {"Content-type": "application/json"};
    http.Response response = await http.post(
      Uri.parse(uri),
      headers: headers,
      body: json.encode(requestBody),
    );
    if (response.statusCode == 200) {
          print('đã bấm nút HOÀN TẤT');
        // Navigator.of(context).popUntil((route) => route.isFirst);
        //   Future.delayed(Duration(seconds: 5),
        //           () => Navigator.of(context).popUntil((route) => route.isFirst)
        //   );
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
      return Qrcode.fromJson(jsonDecode(response.body));
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
      throw Exception('Failed to load album');
    }
  }
  // getQrcore(String? id) async {
  //   String url = 'https://api.dangkiem.online/api/User/encode_iduser/$id';
  //   var response = await http.get(Uri.parse(url));
  //   List<dynamic> jsonResponse = jsonDecode(response.body);
  //   return jsonResponse;
  // }
  //
  // onChaneCiy(Qrcode? value){
  //   var id=value!.objectId;
  //   getQrcore(id);
  // }
  @override
  void initState() {
    super.initState();
    futureQr = postQr();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
           child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
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
                  height: 10,
                ),
                const Text(
                  "MÃ QR-CODE ĐẶT DỊCH VỤ ĐĂNG KIỂM CỦA BẠN",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, fontFamily: 'RobotoMono'),
                ),
                const SizedBox(
                  height: 20,
                ),
                // QrImage(
                //   data: "Hãy liên hệ theo số 0123456789 nếu bạn có thắc mắc",
                //   version: QrVersions.auto,
                //   size: 230.0,
                // ),


                FutureBuilder<Qrcode>(
                  future: futureQr,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return QrImage(
                        data: snapshot.data!.objectId,
                        version: QrVersions.auto,
                        size: 230.0,
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
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
                            // upData();
                            print('đã bấm nút HOÀN TẤT');
                            Future.delayed(Duration(seconds: 5),
                                    () => Navigator.of(context).popUntil((route) => route.isFirst)
                            );
                            final snackBar = SnackBar(
                              content: const Text('❤ Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi ❤'),

                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              backgroundColor: Colors.blue,
                            ); ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
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
                            backgroundColor: Colors.amber,
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
            ),

        ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
