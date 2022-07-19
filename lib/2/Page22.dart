import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../1/Page1.dart';
import 'Page23.dart';
import '../main.dart';
import 'package:intl/intl.dart';
import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import '../1/Page13.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/phuongtiendangkiem.dart';
import '../model/phuongtienduongbo.dart';


class Page22 extends StatefulWidget {
  // Page12(
  //     {required this.initialValue,
  //       required this.onDateChange,
  //       required this.hintText,
  //       this.color = CupertinoColors.label,
  //       this.hintColor = CupertinoColors.inactiveGray,
  //       this.pickerBackgroundColor = CupertinoColors.systemBackground,
  //       this.fontSize = 17.0,
  //       this.textfieldPadding = 15.0,
  //       this.enabled = true});
  //
  // final DateTime initialValue;
  // final Function onDateChange;
  // final String hintText;
  // final Color color;
  // final Color hintColor;
  // final Color pickerBackgroundColor;
  // final double fontSize;
  // final double textfieldPadding;
  // final bool enabled;
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<Page22> with WidgetsBindingObserver {
  final hinhthucEditingController = TextEditingController();

  String _hinhthuc = "something";
  String? dropdownValue;
  String? dropdownValue1;
  String? dropdownValue2;
  String? dropdownValue3;
  String? dropdownValue4;
  String? dropdownValue5;

  // String _selectedDate = 'Tap to select date';
  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? d = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2015),
  //     lastDate: DateTime(2020),
  //   );
  //   if (d != null)
  //     setState(() {
  //       _selectedDate = new DateFormat.yMMMMd("en_US").format(d);
  //     });
  // }
  static final Map<String, String> genderMap = {
    'a1': '08:00',
    'a2': '08:30',
    'a3': '09:00',
    'a4': '09:30',
    'a5': '10:00',
    'a6': '10:30',
    'a7': '11:00',
    'a8': '11:30',
    'a9': '13:30',
    'a10': '14:00',
    'a11': '14:30',
    'a12': '15:00',
    'a13': '15:30',
    'a14': '16:00',
  };
  String _selectedGender = genderMap.keys.first;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (d != null)
      setState(() {
        _selectedDate = new DateFormat.yMMMMd("en_US").format(d);
      });
  }

  String _selectedDate = 'Ngày đi đăng kiểm';

  List<String> sohuu = ['Cá nhân', 'Doanh nghiệp'];
  List<String> countries = [
    'Ô tô dưới 10 chỗ ngồi',
  ];
  List<String> countries2 = [
    'Ô tô dưới 10 chỗ',
    'Ô tô tải có trọng tải đến 2 tấn (bao gồm cả xe ô tô bán tải)',
    'Ô tô tải, đoàn ô tô (ô tô đầu kéo + sơ mi rơ mooc), có trọng tải trên 20 tấn và các loại ô tô chuyên dùng',

    'Ô tô tải, đoàn ô tô (ô tô đầu kéo + sơ mi rơ mooc), có trọng tải trên 7 tấn đến 20 tấn và các loại máy kéo',
    'Ô tô tải có trọng tải trên 2 tấn đến 7 tấn',
    'Máy kéo bông sen, công nông và các loại vận chuyển tương tự',
    'Rơ moóc và sơ mi rơ moóc',
    'Ô tô khách trên 40 ghế (kể cả lái xe), xe buýt',
    'Ô tô khách từ 25 đến 40 ghế (kể cả lái xe)',
    'Ô tô khách từ 10 đến 24 ghế (kể cả lái xe)',
    'Ô tô cứu thương',
  ];
  List<String> usaProvince = [
    'Xe chở người dưới 10 chỗ đăng ký tên cá nhân',
  ];
  List<String> usaProvince1 = [
    'Xe chở người dưới 10 chỗ (trừ xe đăng ký tên cá nhân); xe tải, xe ô tô chuyên dùng có khối lượng toàn bộ dưới 4.000 kg; các loại xe buýt vận tải hành khách công cộng (bao gồm cả xe đưa đón học sinh, sinh viên, công nhân được hưởng chính sách trợ giá như xe buýt); xe chở hàng và xe chở người 4 bánh có gắn động cơ',
  ];
  List<String> usaProvince2 = [
    'Xe chở người từ 10 chỗ đến dưới 25 chỗ; xe tải, xe ô tô chuyên dùng có khối lượng toàn bộ từ 4.000 kg đến dưới 8.500 kg',
    'Xe chở người từ 25 chỗ đến dưới 40 chỗ; xe tải, xe ô tô chuyên dùng có khối lượng toàn bộ từ 8.500 kg đến dưới 13.000 kg',
    'Xe chở người từ 40 chỗ trở lên; xe tải, xe ô tô chuyên dùng có khối lượng toàn bộ từ 13.000 kg đến dưới 19.000 kg; xe đầu kéo có khối lượng bản thân cộng với khối lượng cho phép kéo theo đến dưới 19.000 kg',
    'Xe tải, xe ô tô chuyên dùng có khối lượng toàn bộ từ 19.000 kg đến dưới 27.000 kg; xe đầu kéo có khối lượng bản thân cộng với khối lượng cho phép kéo theo từ 19.000 kg đến dưới 27.000 kg',
    'Xe tải, xe ô tô chuyên dùng có khối lượng toàn bộ từ 27.000 kg trở lên; xe đầu kéo có khối lượng bản thân cộng với khối lượng cho phép kéo theo từ 27.000 kg đến dưới 40.000 kg',
    'Xe ô tô đầu kéo có khối lượng bản thân cộng với khối lượng cho phép kéo theo từ 40.000 kg trở lên',
  ];
  List<String> provinces1 = [];
  List<String> provinces = [];
  String? selectedCountry;
  String? selectedProvince;
  String? selectedsohuu;
  dsphuongtiendangkiem? selectdsphuongtiendangkiem;
  List<dsphuongtiendangkiem> listdsphuongtiendangkiem = [];
  dsphuongtienduongbo? selectdsphuongtienduongbo;
  List<dsphuongtienduongbo> listdsphuongtienduongbo=[];

  getdsphuongtiendangkiem() async {
    const String url = 'https://api.dangkiem.online/api/Vehicle/false';
    var response = await http.get(Uri.parse(url));
    List<dynamic> jsonResponse = jsonDecode(response.body);
    setState(() {
      listdsphuongtiendangkiem = List<dsphuongtiendangkiem>.from(
          jsonResponse.map((it) => dsphuongtiendangkiem.fromJson(it)));
    });
  }
  getdsphuongtienduongbo(int id) async {
    String url = 'https://api.dangkiem.online/api/Vehicle/true';
    var response = await http.get(Uri.parse(url));
    List<dynamic> jsonResponse = jsonDecode(response.body);
    setState(() {
      listdsphuongtienduongbo = List<dsphuongtienduongbo>.from(
          jsonResponse.map((dk) => dsphuongtienduongbo.fromJson(dk)));
    });}


  @override
  void initState() {

    super.initState();
    getdsphuongtiendangkiem();
  }
  onChanephuongtiendangkiem(dsphuongtiendangkiem? value){
    setState(() {
      selectdsphuongtiendangkiem=value;
    });
    var id=value!.vehicleId;
    getdsphuongtienduongbo(id);
  }

  @override
  // final String formattedDate = DateFormat.yMd().format(_selectedDateTime);
  // final selectedText = Text('You selected: $formattedDate');
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Giao diện thực tập",
        home: Scaffold(
            appBar:PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
    child:  AppBar(
              backgroundColor: Colors.grey[800],

              title: Center(
                  child: Column(children: <Widget>[
                    Image.asset('images/logo.png', width: 50,height: 35),

                    SizedBox(width: 20, height: 0),
                const Text('CỔNG DỊCH VỤ ĐĂNG KIỂM BẢO HIỂM',
                    style: TextStyle(fontSize: 17)),
              ])),
    )  ),
            body: SingleChildScrollView(

                // padding: EdgeInsets.only(bottom: 15),
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 20, height: 20),
                const Text(
                  'ĐẶT DỊCH VỤ ĐĂNG KIỂM',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'NHẬN VÀ GIAO XE TẠI NHÀ',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(width: 20, height: 30),
                InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      contentPadding: EdgeInsets.all(3),
                    ),
                    child:
                    Padding(
                        padding: EdgeInsets.only(
                            left: 18,
                            top: 0, bottom: 0, right: 0
                        ),
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
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: const Text(
                                      "Hãng xe",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    value: dropdownValue,
                                    elevation: 16,

                                    style: const TextStyle(color: Colors.black, ),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.white,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      'Honda',
                                      'Huyndai',
                                      'Toyota',
                                      'Mazda',
                                      'KIA'
                                    ].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ))))  ),
                SizedBox(width: 20, height: 10),
                InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      contentPadding: EdgeInsets.all(3),
                    ),
                    child:
                    Padding(
                        padding: EdgeInsets.only(
                            left: 18,
                            top: 0, bottom: 0, right: 0
                        ),
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
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: const Text(
                                      "Năm sản xuất",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    value: dropdownValue1,
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.black),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.white,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue1 = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      '1996', '1997', '1998', '1999', '2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020', '2021'
                                    ].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ))))   ),
                SizedBox(width: 20, height: 10),
                InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      contentPadding: EdgeInsets.all(3),
                    ),
                    child:
                    Padding(
                        padding: EdgeInsets.only(
                            left: 18,
                            top: 0, bottom: 0, right: 0
                        ),
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
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: const Text(
                                      "Hình thức",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    value: dropdownValue2,
                                    elevation: 16,

                                    style: const TextStyle(color: Colors.black, ),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.white,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue2 = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      'Có kinh doanh vận tải',
                                      'Không kinh doanh vận tải'
                                    ].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ))))     ),
                SizedBox(width: 20, height: 10),
                InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      contentPadding: EdgeInsets.all(3),
                    ),
                    child:
                    Padding(
                        padding: EdgeInsets.only(
                            left: 18,
                            top: 0, bottom: 0, right: 0
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,

                            ),
                            child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    // left: 14.0, right: 14
                                  ),          child:   DropdownButton<String>(
                                  hint: const Text(
                                    "Sở hữu",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  underline: SizedBox(),
                                  value: selectedsohuu,
                                  isExpanded: true,
                                  items: sohuu.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (cba) {
                                    if (cba == 'Cá nhân') {
                                      provinces1=countries;
                                    } else if (cba == 'Doanh nghiệp') {
                                      provinces1 =countries2;
                                    } else {
                                      provinces1 = [];
                                    }
                                    setState(() {
                                      selectedCountry = null;
                                      selectedProvince = null;
                                      selectedsohuu = cba;
                                    });
                                  },
                                ),
                                ))))  ),
                SizedBox(width: 20, height: 10),
                InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      contentPadding: EdgeInsets.all(3),
                    ),
                    child:
                    Padding(
                        padding: EdgeInsets.only(
                            left: 18,
                            top: 0, bottom: 0, right: 0
                        ),
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
                                  child:  DropdownButton<dsphuongtiendangkiem>(
                                    hint: const Text("Loại phương tiện theo quy định đăng kiểm",),
                                    underline: SizedBox(),
                                    value: selectdsphuongtiendangkiem,
                                    iconSize: 36,
                                    isExpanded: true,
                                    items: listdsphuongtiendangkiem.map((dsphuongtiendangkiem item) {
                                      return DropdownMenuItem<dsphuongtiendangkiem>(
                                        child: Text( item.nameVehicle),
                                        value: item,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      onChanephuongtiendangkiem(value);
                                      selectdsphuongtienduongbo = null;
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
                    child:
                    Padding(
                        padding: EdgeInsets.only(
                            left: 18,
                            top: 0, bottom: 0, right: 0
                        ),
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
                                  child:  DropdownButton<dsphuongtienduongbo>(
                                    hint: const Text("Loại phương tiện theo qui định lưu thông đường bộ",),
                                    underline: SizedBox(),
                                    value: selectdsphuongtienduongbo,
                                    iconSize: 36,
                                    isExpanded: true,
                                    items: listdsphuongtienduongbo.map((dsphuongtienduongbo item) {
                                      return DropdownMenuItem<dsphuongtienduongbo>(
                                        child: Text( item.nameVehicle),
                                        value: item,
                                      );
                                    }).toList(),
                                    onChanged: (valuephuongtienduongbo) {
                                      setState(() {
                                        selectdsphuongtienduongbo =valuephuongtienduongbo!;
                                      });

                                    },
                                  ),
                                )))) ),


                SizedBox(width: 20, height: 10),


                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1.0, color: Colors.grey),
                        left: BorderSide(width: 1.0, color: Colors.grey),
                        right: BorderSide(width: 1.0, color: Colors.grey),
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          child: Text(_selectedDate,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 18)),
                          // "${selectedDate.toLocal()}".split(' ')[0],
                          // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          // ),
                          onTap: () {
                            _selectDate(context);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.calendar_today),
                          tooltip: 'Tap to open date picker',
                          onPressed: () {
                            _selectDate(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 20, height: 10),

                // Text(
                //   "${selectedDate.toLocal()}".split(' ')[0],
                //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                // ),
                // SizedBox(
                //   height: 20.0,
                // ),
                // RaisedButton(
                //   onPressed: () => _selectDate(context),
                //   child: Text(
                //     'Select date',
                //     style:
                //     TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                //   ),
                //   color: Colors.greenAccent,
                // ),

                // Row(
                //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //    children: <Widget>[
                //      InputDecorator(
                //        decoration: InputDecoration(
                //          border: OutlineInputBorder(
                //              borderRadius: BorderRadius.circular(20.0)),
                //          contentPadding: EdgeInsets.all(5),
                //        ),
                //        child: DropdownButton<String>(
                //          isExpanded: true,
                //          hint: const Text(
                //            "Hãng xe",
                //            style: TextStyle(fontSize: 17),
                //          ),
                //          value: dropdownValue,
                //          elevation: 16,
                //          style: const TextStyle(color: Colors.lightBlue),
                //          underline: Container(
                //            height: 2,
                //            color: Colors.white,
                //          ),
                //          onChanged: (String? newValue) {
                //            setState(() {
                //              dropdownValue = newValue!;
                //            });
                //          },
                //          items: <String>['Honda', 'Huyndai', 'Toyota', 'Mazda', 'KIA']
                //              .map<DropdownMenuItem<String>>((String value) {
                //            return DropdownMenuItem<String>(
                //              value: value,
                //              child: Text(value),
                //            );
                //          }).toList(),
                //        ),
                //      ),
                //      InputDecorator(
                //        decoration: InputDecoration(
                //          border: OutlineInputBorder(
                //              borderRadius: BorderRadius.circular(20.0)),
                //          contentPadding: EdgeInsets.all(5),
                //        ),
                //        child: DropdownButton<String>(
                //          isExpanded: true,
                //          hint: const Text(
                //            "Hãng xe",
                //            style: TextStyle(fontSize: 17),
                //          ),
                //          value: dropdownValue,
                //          elevation: 16,
                //          style: const TextStyle(color: Colors.lightBlue),
                //          underline: Container(
                //            height: 2,
                //            color: Colors.white,
                //          ),
                //          onChanged: (String? newValue) {
                //            setState(() {
                //              dropdownValue = newValue!;
                //            });
                //          },
                //          items: <String>['Honda', 'Huyndai', 'Toyota', 'Mazda', 'KIA']
                //              .map<DropdownMenuItem<String>>((String value) {
                //            return DropdownMenuItem<String>(
                //              value: value,
                //              child: Text(value),
                //            );
                //          }).toList(),
                //        ),
                //      ),
                //      InputDecorator(
                //        decoration: InputDecoration(
                //          border: OutlineInputBorder(
                //              borderRadius: BorderRadius.circular(20.0)),
                //          contentPadding: EdgeInsets.all(5),
                //        ),
                //        child: DropdownButton<String>(
                //          isExpanded: true,
                //          hint: const Text(
                //            "Hãng xe",
                //            style: TextStyle(fontSize: 17),
                //          ),
                //          value: dropdownValue,
                //          elevation: 16,
                //          style: const TextStyle(color: Colors.lightBlue),
                //          underline: Container(
                //            height: 2,
                //            color: Colors.white,
                //          ),
                //          onChanged: (String? newValue) {
                //            setState(() {
                //              dropdownValue = newValue!;
                //            });
                //          },
                //          items: <String>['Honda', 'Huyndai', 'Toyota', 'Mazda', 'KIA']
                //              .map<DropdownMenuItem<String>>((String value) {
                //            return DropdownMenuItem<String>(
                //              value: value,
                //              child: Text(value),
                //            );
                //          }).toList(),
                //        ),
                //      ),
                //
                //    ]),

                // Container(
                //   height: 200,
                //   child: CupertinoDatePicker(
                //     mode: CupertinoDatePickerMode.date,
                //     initialDateTime: DateTime(1969, 1, 1),
                //     onDateTimeChanged: (DateTime newDateTime) {
                //       // Do something
                //     },
                //   ),
                // ),

                // InkWell(
                //   child: Text(
                //       _selectedDate,
                //       textAlign: TextAlign.center,
                //       style: TextStyle(color: Color(0xFF000000))
                //   ),
                //   onTap: (){
                //     _selectDate(context);
                //   },
                // ),
                // IconButton(
                //   icon: Icon(Icons.calendar_today),
                //   tooltip: 'Tap to open date picker',
                //   onPressed: () {
                //     _selectDate(context);
                //   },
                // ),
                //

                // new Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: <Widget>[  const Padding(
                //         padding: EdgeInsets.only(bottom: 5.0),
                //       ),
                //       CupertinoRadioChoice(
                //           choices: genderMap,
                //           onChange: onGenderSelected,
                //           initialKeyValue: _selectedGender),
                //       ]
                // ),

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
                          print('đã bấm nút tiếp tục');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Page23()));
                        },
                      ),
                    ]),

                // DropdownButton<String>(
                //   value: dropdownValue,
                //   icon: const Icon(Icons.arrow_downward),
                //   iconSize: 24,
                //   elevation: 16,
                //   style: const TextStyle(
                //       color: Colors.deepPurple
                //   ),
                //   underline: Container(
                //     height: 2,
                //     color: Colors.deepPurpleAccent,
                //   ),
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       dropdownValue = newValue!;
                //     });
                //   },
                //   items: <String>['One', 'Two', 'Free', 'Four']
                //       .map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   })
                //       .toList(),
                // ),
              ],
            ))));
  }

  void onGenderSelected(String genderKey) {
    setState(() {
      _selectedGender = genderKey;
    });
  }
}
// void onBirthdayChange(DateTime birthday) {
//   setState(() {
//     _selectedDateTime = birthday;
//   });
// }
// }
