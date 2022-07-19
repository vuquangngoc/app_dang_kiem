import 'dart:async';
import 'dart:convert';
import 'package:test11/dat_lich_dang_kiem/a4.dart';
import 'package:test11/model/Voucher.dart';
import 'package:test11/model/chiphi.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Page13 extends StatefulWidget {
  const Page13(
      {Key? key,
      required this.title,
        required this.userName,
        required this.phoneNumber,
        required this.bsx,
        required this.idTP,
        required this.idTDK,
        required this.hangxe,
        required this.year,
        required this.hinhthuc,
        required this.sohuu,
      required this.idPTDK,
      required this.idPTDB,
        required this.dateDK,
        required this.timeDK,
     }) : super(key: key);

  final String title;
  final String userName;
  final String phoneNumber;
  final String bsx;
  final int idTP;
  final int idTDK;
  final String hangxe;
  final int year;
  final bool hinhthuc;
  final bool sohuu;
  final int idPTDK;
  final int idPTDB;
  final String dateDK;
  final String timeDK;

  @override
  State<Page13> createState() => _Page13PageState();
}

class _Page13PageState extends State<Page13> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked = false;
  var controllerUuDai = TextEditingController();
  late Future<Charge> futureCharge;
  Voucher? voucher;
  var errVoucher="Bạn chưa nhập voucher";
  var checkVoucher=false;

  Future<Charge> getPrice() async {
    var response = await http.post(
      Uri.parse("https://api.dangkiem.online/api/User/tempcosts"),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({
        "vehiclePdbId": widget.idPTDB,
        "vehiclePkdId": widget.idPTDK,
        "year": widget.year,
        "uses": widget.sohuu,
        "service": isChecked,
        "code": controllerUuDai.text,
        "licensePlates": widget.bsx
      }),
    );
    if (response.statusCode == 200) {
      return Charge.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }
  getVocher(String id) async{
   var reponse=await http.get(Uri.parse("https://api.dangkiem.online/api/Voucher/is_voucher/$id"));
   var jsonResponse = jsonDecode(reponse.body);
   if(reponse.statusCode==200){
     setState(() {
       Voucher.fromJson(jsonResponse);
      futureCharge= getPrice();
     });
   }
  }



  @override
  initState() {
    super.initState();
    futureCharge = getPrice();
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

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[800],
        title: Center(
            child: Column(children: <Widget>[
              Image.asset('images/logo.png', width: 50, height: 35),
              SizedBox(width: 20, height: 0),
              const Text('CỔNG DỊCH VỤ ĐĂNG KIỂM BẢO HIỂM',
                  style: TextStyle(fontSize: 17)),
            ])),
      ),
      body: SingleChildScrollView(
          child: FutureBuilder<Charge>(
        future: futureCharge,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "CHI PHÍ TẠM TÍNH",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20, height: 5),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    child: SizedBox(
                      height: 100,
                      width: 500,
                      child: Row(
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
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child:
                            Text(snapshot.data!.costPkd.toString()),
                          )
                        ],
                      ),
                    ),
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    child: SizedBox(
                      height: 100,
                      width: 500,
                      child: Row(
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
                            width: 103,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(snapshot.data!.costCert.toString()),
                          )
                        ],
                      ),
                    ),
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    child: SizedBox(
                      height: 100,
                      width: 500,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
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
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(snapshot.data!.costPdb.toString()),
                          )
                        ],
                      ),
                    ),
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    child: SizedBox(
                      height: 100,
                      width: 500,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith(getColor),
                            value: isChecked,
                            onChanged: (value ){
                              setState(() {
                                isChecked=value!;
                              });
                              futureCharge=getPrice();

                            }
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Lựa chọn dịch vụ đăng kiểm",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Visibility(
                            visible: isChecked,
                              child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(15),
                                width: 113,
                                height: 45,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child:  Text(snapshot.data!.costService.toString()),
                          ))

                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isChecked,
                      child:  DottedBorder(
                        borderType: BorderType.RRect,
                        child: SizedBox(
                          height: 80,
                          width: 500,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  "MÃ ƯU ĐÃI",
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.w900),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(15),
                                width: 120,
                                height: 50,
                                child: TextField(
                                    controller: controllerUuDai,
                                    decoration: InputDecoration(
                                      errorText: checkVoucher ? errVoucher:null,
                                        border:const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)))),
                                    keyboardType: TextInputType.text),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  width: 120,
                                  height: 45,
                                  color: Colors.orangeAccent,
                                  child: TextButton(
                                    child: const Text('ÁP DỤNG'),
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: Colors.blue,
                                      onSurface: Colors.grey,
                                    ),
                                    onPressed: () {
                                      var code=controllerUuDai.text;
                                       setState(() {
                                         if(controllerUuDai.text.isEmpty){
                                           checkVoucher=true;
                                         }else{
                                           getVocher(code);
                                         }
                                       });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "TỔNG CHI PHÍ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(15),
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(snapshot.data!.costTotalTemp),
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
                        onPressed: () {
                          print('đã bấm nút quay lại');
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
          nextpage14();

          },
          )
                    ],
                  )
                ]);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void nextpage14(){
    var userName=widget.userName;
    var phoneNumber=widget.phoneNumber;
    var bienso=widget.bsx;
    var tp=widget.idTP;
    var tdk=widget.idTDK;
    var hangxe=widget.hangxe;
    var nam=widget.year;
    var canhan=widget.hinhthuc;
    var sohuu=widget.sohuu;
    var idPTDk=widget.idPTDK;
    var idPTDB=widget.idPTDB;
    var dateDK=widget.dateDK;
    var voucher=controllerUuDai.text;
    var slot=widget.timeDK;
    var dichvu=isChecked;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>  Page14(
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
              voucher: voucher,
              dateDK: dateDK,
              timeDK: slot ,
              dichvu: dichvu,
              title:
              "CỔNG DỊCH VỤ ĐĂNG KIỂM BẢO HIỂM")),
    );

  }
}
