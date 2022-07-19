import 'package:test11/dat_lich_dang_kiem/a5.dart';
import 'package:flutter/material.dart';

class Page14 extends StatefulWidget {
  const Page14({Key? key, required this.title,
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
  final String hangxe;
  final int year;
  final bool user;
  final bool sohuu;
  final int idPTDK;
  final int idPTDB;
  final String voucher;
  final String dateDK;
  final String timeDK;
 final bool dichvu;
  @override
  State<Page14> createState() => _Page14State();
}

class _Page14State extends State<Page14> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
      body: Center( child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                     senLickDK();
                    }),
              ),
            ),
    const SizedBox(
    height: 40,
    ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
    width: 300,
    height: 90,
    color: Colors.brown[600],
                child: TextButton.icon(
                    label: const Text('THANH TOÁN TRỰC TIẾP',
    style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold)),
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
                     senLickDK();
                    }),
              ),
            ),
            SizedBox(width: 20, height: 60),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
  void senLickDK(){
    var userName=widget.userName;
    var phoneNumber=widget.phoneNumber;
    var bienso=widget.bsx;
    var tp=widget.idTP;
    var tdk=widget.idTDK;
    var hangxe=widget.hangxe;
    var nam=widget.year;
    var canhan=widget.user;
    var sohuu=widget.sohuu;
    var idPTDk=widget.idPTDK;
    var idPTDB=widget.idPTDB;
    var vocher=widget.voucher;
    var dateDK=widget.dateDK;
    var slot=widget.timeDK ;
    var dichvu=widget.dichvu;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>  Page15(
              userName: userName,
              phoneNumber: phoneNumber,
              bsx: bienso,
              idTP: tp,
              idTDK: tdk,
              hangxe: hangxe,
              year: nam,
              user: canhan,
              sohuu: sohuu,
              idPTDK: idPTDk,
              idPTDB: idPTDB,
              dateDK: dateDK,
              voucher: vocher,
              timeDK: slot,
              dichvu: dichvu,
              title:
              "CỔNG DỊCH VỤ ĐĂNG KIỂM BẢO HIỂM")),
    );
  }
}
