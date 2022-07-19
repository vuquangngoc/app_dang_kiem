import 'dart:convert';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:test11/model/Loaiphuongtien.dart';
import 'package:test11/model/ngaydangkiem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'b3.dart';
import 'package:test11/model/time.dart';
class Page22 extends StatefulWidget {
  Page22(
      {Key? key,

      required this.diachinhanxe,
      // required this.stationID,
      required this.bsx,
      required this.name,
      required this.phone,
      required this.tp})
      : super(key: key);


  String name;
  String phone;
  String bsx;
  String diachinhanxe;
  int tp;
  // int stationID;

  @override
  State<Page22> createState() => _Page22PageState();
}

class _Page22PageState extends State<Page22> {
  TextEditingController controllerCar = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String? selectedDate;
  final itemHinhthuc = ['Không kinh doanh vận tải', 'Có kinh doanh vận tải'];
  final itemSohuu = ['Cá nhân', 'Doanh Nghiệp'];
  String? valueHinhthuc;
  String? valueSohuu;
  final itemPT = ["A", "B"];
  List<PTDK> listPT = [];
  PTDK? selectPT;
  List<PTDK> listRoadVerhicle = [];
  PTDK? selectPTDB;
  int? selectYear;
  List<int> listYear = [];

  List<String> listDate = [];
  String? valueDate;

  bool group_Value = true;
  bool group_Sohuu = true;
  getYear() async {
    const String url = 'https://api.dangkiem.online/api/Year';
    var response = await http.get(Uri.parse(url));
    List<int> jsonResponse = jsonDecode(response.body).cast<int>();
    setState(() {
      listYear = jsonResponse;
    });
  }

  getPT(bool searchable) async {
    String url = 'https://api.dangkiem.online/api/Vehicle/$searchable';
    var responese = await http.get(Uri.parse(url));
    if (responese.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(responese.body);
      List<PTDK> listPTDK =
          List<PTDK>.from(jsonResponse.map((it) => PTDK.fromJson(it)));
      setState(() {
        listPT = listPTDK;
      });
    }
  }

  getPTDB(bool searchable) async {
    String url = 'https://api.dangkiem.online/api/Vehicle/$searchable';
    var responese = await http.get(Uri.parse(url));
    if (responese.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(responese.body);
      List<PTDK> listPTDB =
          List<PTDK>.from(jsonResponse.map((it) => PTDK.fromJson(it)));
      setState(() {
        listRoadVerhicle = listPTDB;
      });
    }
  }

  getDate(String date) async {
    String url =
        'https://api.dangkiem.online/api/Slot/slot_home?datetime=$date';
        // 'https://api.dangkiem.online/api/Slot?datetime=$date&stationId=$id';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // var jsonResponse = jsonDecode(response.body);
      List<String> jsonResponse = jsonDecode(response.body)['data'].cast<String>();
      setState(() {
        listDate = jsonResponse;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getPT(false);
    getPTDB(true);
    getYear();
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
          Image.asset('images/logo.png', width: 50, height: 35),
          SizedBox(width: 20, height: 0),
          const Text('CỔNG DỊCH VỤ ĐĂNG KIỂM BẢO HIỂM',
              style: TextStyle(fontSize: 17)),
        ])),
      ),
      body: SingleChildScrollView(
          // padding: const EdgeInsets.all(8),
          // scrollDirection: Axis.vertical,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 20, height: 20),
                const Text(
                  'ĐẶT DỊCH VỤ ĐĂNG KIỂM',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20, height: 5),
                const Text(
                  'NHẬN VÀ GIAO XE TẠI NHÀ',
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
                SizedBox(width: 20, height: 10),
               TextField(
                              controller: controllerCar,
                              decoration: const InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  labelText: "Hãng xe", hintText: "Hãng xe"),
                              keyboardType: TextInputType.text),
                        // ))),
                SizedBox(width: 20, height: 10),
                InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      contentPadding: EdgeInsets.all(3),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 18, top: 0, bottom: 0, right: 0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    // left: 14.0, right: 14
                                  ),
                                  child: DropdownButton<int>(
              hint: const Text("Năm sản xuất"),
              value: selectYear,
              iconSize: 36,
              isExpanded: true,
              items: listYear.map((item) {
                return DropdownMenuItem<int>(
                  child: Text('$item'),
                  value: item,
                );
              }).toList(),
              onChanged: (value) => setState(() {
                    selectYear = value;
                  })),
    ))))   ),
                SizedBox(width: 20, height: 10),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 300, 0),
          child: const Text(
            "Hình thức",
            style: TextStyle(fontSize: 17),
          ),
        ),
        RadioListTile(
            title: const Text("Có kinh doan vận tải"),
            value: true,
            groupValue: group_Value,
            onChanged: (value) => setState(() {
                  group_Value = true;
                })),
        RadioListTile(
            title: const Text("Không kinh doan vận tải"),
            value: false,
            groupValue: group_Value,
            onChanged: (value) => setState(() {
                  group_Value = false;
                })),
                SizedBox(width: 20, height: 10),

                Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 300, 0),
          child: const Text(
            "Sở hữu",
            style: TextStyle(fontSize: 17),
          ),
        ),
        RadioListTile(
            title: const Text("Cá nhân"),
            value: true,
            groupValue: group_Sohuu,
            onChanged: (valuesh) => setState(() {
                  group_Sohuu = true;
                })),
        RadioListTile(
            title: const Text("Doanh nghiệp"),
            value: false,
            groupValue: group_Sohuu,
            onChanged: (valuesh) => setState(() {
                  group_Sohuu = false;
                })),
                SizedBox(width: 20, height: 0
                ),

          InputDecorator(
          decoration: InputDecoration(
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)),
    contentPadding: EdgeInsets.all(3),
    ),
    child: Padding(
    padding: EdgeInsets.only(
    left: 18, top: 0, bottom: 0, right: 0),
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
    ),
    child: DropdownButtonHideUnderline(
    child: Padding(
    padding: const EdgeInsets.only(
    // left: 14.0, right: 14
    ),
          child: DropdownButton<PTDK>(
            hint: const Text(
              "Loại phương tiện theo quy định đăng kiểm",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 15),
            ),
            value: selectPT,
            iconSize: 30,
            isExpanded: true,
            items: listPT.map((PTDK item) {
              return DropdownMenuItem<PTDK>(
                child: Text(" " + item.nameVehicle),
                value: item,
              );
            }).toList(),
            onChanged: (valuePTDK) {
              setState(() {
                selectPT = valuePTDK;
                selectPTDB = null;
              });
            },
          ),
    ))))),
                SizedBox(width: 20, height: 10),

                InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      contentPadding: EdgeInsets.all(3),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 18, top: 0, bottom: 0, right: 0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    // left: 14.0, right: 14
                                  ),
                                  child: DropdownButton<PTDK>(
                                      hint: const Text(
                                        "Loại phương tiện theo quy định lưu thông đường bộ",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      value: selectPTDB,
                                      iconSize: 30,
                                      isExpanded: true,
                                      items: listRoadVerhicle.map((PTDK item) {
                                        return DropdownMenuItem<PTDK>(
                                          child: Text(
                                              item.nameVehicle,
                                              overflow: TextOverflow.ellipsis
                                          ),
                                          value: item,
                                        );
                                      }).toList(),
                                      onChanged: (valuePTDB) {
                                        setState(() {
                                          selectPTDB = valuePTDB;
                                        });
                                      }),
                                ))))),
                SizedBox(width: 20, height: 0),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(15),
                        width: 170,
                        height: 60,
                        child: DateTimePicker(
                            type: DateTimePickerType.date,
                            dateMask: 'dd/MM/yyyy',
                            initialDatePickerMode: DatePickerMode.day,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                            initialDate: DateTime.now(),
                            icon: const Icon(Icons.date_range),
                            dateLabelText: 'Ngày đăng kiểm',
                            calendarTitle: 'Chọn ngày đăng kiểm',
                            cancelText: 'Huỷ bỏ',
                            confirmText: 'Xong',
                            onChanged: (date) {
                              setState(() {
                                selectedDate = date;
                              });
                              listDate = [];
                              valueDate = null;

                              getDate(date);
                            }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(15),
                        width: 160,
                        height: 60,
                        child: DropdownButton<String>(
                            hint: const Text(
                              " Chọn giờ đến",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 17),
                            ),
                            icon: const Icon(Icons.access_time),
                            value: valueDate,
                            iconSize: 28,
                            isExpanded: true,
                            items: listDate.map((String item) {
                              return DropdownMenuItem<String>(
                                child: Text(
                                  item,
                                ),
                                value: item,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                valueDate = value;
                                // getDate(value, widget.selectedDate);
                              });
                            }),
                      ),
                    ]),


        const SizedBox(
          height: 0,
        ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
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
            child: Text('TIẾP TỤC'),
            textColor: Colors.white,
            color: Colors.yellow[800],
            onPressed: () {
              var biensx = widget.bsx;
                  var name = widget.name;
                  var phone = widget.phone;
                  var idTP = widget.tp;
                  var diachi = widget.diachinhanxe;
                  // var idTDk = widget.stationID;

                  var hx = controllerCar.text;
                  int PTDK = selectPT!.vehicleId;
                  int PTDB = selectPTDB!.vehicleId;
                  var hinhthuc = group_Value;
                  var sohuu = group_Sohuu;

                  var nam = selectYear;
                  var ngayDK = selectedDate!;
                  var slotDK = valueDate.toString();
                  if (selectYear == null ||
                      selectPT == null ||
                      selectPTDB == null ||
                      controllerCar.text.isEmpty) {
                    const snackBar =
                        SnackBar(content: Text('Bạn chưa điền đủ thông tin'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Page23(
                          diachinhanxe:diachi,
                          userName: name,
                          phoneNumber: phone,
                          bsx: biensx,
                          idTP: idTP,
                          // idTDK: idTDk,


                          hangxe: hx,
                          year: nam as int,
                          sohuu: sohuu,
                          hinhthuc: hinhthuc,
                          idPTDB: PTDB,
                          idPTDK: PTDK,
                          dateDK: ngayDK,
                            slotdk : slotDK,
                          // timeDK: listDate.toString(),


                        ),
                      ),
                    );
                  }
                },
              ),
              ]),  ],
                          )));
    }
  DropdownMenuItem<String> buildMenuitem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontSize: 15),
      ));
}
