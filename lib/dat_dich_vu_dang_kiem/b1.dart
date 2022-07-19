import 'dart:convert';
import 'dart:core';

import 'package:test11/dat_lich_dang_kiem/a2.dart';
import 'package:test11/model/thanhpho.dart';
import 'package:test11/model/TramDK.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test11/dat_dich_vu_dang_kiem/b2.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Page2> createState() => _Page2PageState();
}

class _Page2PageState extends State<Page2> {
    final diachinhanxeEditingController = TextEditingController();
    var controllerDiachi_dl = TextEditingController();
  var controllerName_dl = TextEditingController();
  var controllerPhone_dl = TextEditingController();
  var controllerBienso_dl = TextEditingController();
  var controllerAddress_dl = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
   var checkName=false;
   var errorName="Họ và tên không được để trống";
  var checkPhone=false;
  var errorPhone="Số điện thoại không được để trống";
  var checkBSX=false;
  var errorBSX="Biển số xe không được để trống";
    var checkDiachi=false;
    var errorDiachi="Địa chỉ không được để trống";
  var checkTP=false;
  var errorTP="Thành phố không được để trống";
  // var checkTDK=false;
  // var errorTDK="Trạm đăng kiểm không được để trống";
    String _diachinhanxe = "something";
  List<CityData> listTp =[];
  CityData? selectTp;
  //  TramDk? selectDk;
  // List<TramDk> listDk = [];

  getCity() async {
    const String url = 'https://api.dangkiem.online/api/City';
    var response = await http.get(Uri.parse(url));
     var jsonResponse = jsonDecode(response.body);
     //CityData cityData=CityData.fromJson(jsonResponse);
    setState(() {
      listTp = List<CityData>.from(jsonResponse['city'].map((it) => CityData.fromJson(it)));
    });
  }


  // getTramDk(int cityID) async {
  //   String url = 'https://api.dangkiem.online/api/Station/$cityID';
  //   http.Response response = await http.get(Uri.parse(url));
  //   List<dynamic> jsonResponse = jsonDecode(response.body);
  //   setState(() {
  //     listDk = List<TramDk>.from(jsonResponse.map((dk) => TramDk.fromJson(dk)));
  //   });
  // }

  @override
  void initState() {
    super.initState();
    getCity();
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
              // const Icon(
              //   Icons.security,
              //   color: Colors.yellow,
              //   size: 29,
              // ),
              Image.asset('images/logo.png', width: 50,height: 35),
              SizedBox(width: 20, height: 0),
              const Text('CỔNG DỊCH VỤ ĐĂNG KIỂM BẢO HIỂM',
                  style: TextStyle(fontSize: 17)),
            ])),
      ),
      body: Center(
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
             child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
             const Text(
                'ĐẶT DỊCH VỤ ĐĂNG KIỂM',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
                          SizedBox(width: 20, height: 5),
              const Text(
                'NHẬN VÀ GIAO XE TẠI NHÀ',
                style: TextStyle(fontSize: 17, color: Colors.grey),
              ),
              SizedBox(width: 20, height: 30),

                          TextField(
                              controller: controllerName_dl,
                              decoration:  InputDecoration(
                                errorText: checkName ? errorName:null ,
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  labelText: "Họ và tên",
                                  hintText: "Họ và tên"),
                              keyboardType: TextInputType.text),
              SizedBox(width: 20, height: 10),
                          TextField(
                              controller: controllerPhone_dl,
                              decoration:  InputDecoration(
                                  errorText: checkPhone ? errorPhone:null ,
                                  border:const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  labelText: "Số điện thoại",
                                  hintText: "Số điện thoại"),
                              keyboardType: TextInputType.number),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: controllerBienso_dl,
                            decoration:  InputDecoration(
                                errorText: checkBSX ? errorBSX:null ,
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                labelText: "Biển số xe",
                                hintText: "Biển số xe"),
                          ),
                          SizedBox(width: 20, height: 10),
            TextField(
                controller: controllerDiachi_dl,
                onChanged: (text) {
                  this.setState(() {
                    _diachinhanxe =
                        text; // khi state thay đổi => build() return => reload widget
                  });
                },
                decoration: InputDecoration(
                    errorText: checkDiachi ? errorDiachi:null ,

                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        //bán kính của viền
                          const Radius.circular(20) //bo góc tính theo pixel
                      ),
                    ),
                    labelText: "Địa chỉ nhận xe"),
              ),
              SizedBox(width: 20, height: 10),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: DropdownButton<CityData>(
                                hint: const Text("Tỉnh/ Thành phố"),
                                value: selectTp ,
                                iconSize: 36,
                                isExpanded: true,
                                items: listTp.map((CityData item) {
                                  return DropdownMenuItem<CityData>(
                                    child: Text(item.name),
                                    value: item,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectTp = value;
                                  });
                                  // listDk = [];
                                  // // selectDk = null;
                                  // getTramDk(value!.cityId);
                                }),
                          ),
                          SizedBox(width: 20, height: 10),
                          // Container(
                          //   padding: const EdgeInsets.all(5.0),
                          //   decoration: BoxDecoration(
                          //     border: Border.all(color: Colors.grey),
                          //     borderRadius: BorderRadius.circular(20),
                          //   ),
                          //   child: DropdownButton<TramDk>(
                          //     hint: const Text("Trạm đăng kiểm"),
                          //     value: selectDk ,
                          //     iconSize: 30,
                          //     isExpanded: true,
                          //     items: listDk.map((TramDk itemDk) {
                          //       return DropdownMenuItem<TramDk>(
                          //         child: Text(
                          //           itemDk.stationName+"\n"+itemDk.address,
                          //           overflow: TextOverflow.ellipsis,
                          //         ),
                          //         value: itemDk,
                          //       );
                          //     }).toList(),
                          //     onChanged: (valueDk) {
                          //       setState(() {
                          //         selectDk = valueDk!;
                          //
                          //       });
                          //     },
                          //   ),
                          // ),
                          const SizedBox(
                            height: 20,
                          ),

                          FlatButton(
                            child: Text('TIẾP TỤC '),
                            padding: EdgeInsets.all(15.0),
                            shape: StadiumBorder(),
                            textColor: Colors.white,
                            color: Colors.yellow[800],
                            onPressed: ()

                            {
                              checkValue();

                            },
                          ),
                        ])
                   ,


              // By default, show a loading spinner.

              )),

    );
  }
  void checkValue(){
    // int idTDK=selectDk!.stationId;
    String bienso=controllerBienso_dl.text;
    String name=controllerName_dl.text;
    String phone=controllerPhone_dl.text;
    String diachi=controllerDiachi_dl.text;
    int idTP=selectTp!.cityId;
    setState(() {
      if (controllerName_dl.text.isEmpty ||
          controllerPhone_dl.text.isEmpty ||
          controllerBienso_dl.text.isEmpty ||
controllerDiachi_dl.text.isEmpty||
          selectTp == null
          // selectDk == null
      ) {
        checkDiachi=true;
        checkName=true;
        checkPhone=true;
        checkBSX=true;
        checkTP=true;
        // checkTDK=true;
        final snackBar = SnackBar(
          content: const Text('Bạn chưa điền đủ thông tin'),
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  Page22(
              name: name,
              phone: phone,
                diachinhanxe:diachi,
              tp: idTP,
              bsx: bienso,
               // stationID: idTDK,
                ),
          ),
        );
      }
    });
  }
}
