import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/phuongtiendangkiem.dart';
import '../model/phuongtienduongbo.dart';
import '../repository2.dart';
import 'Page1.dart';
import '../main.dart';
import 'package:intl/intl.dart';
import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'Page13.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:date_time_picker/date_time_picker.dart';
import 'package:test11/model/time.dart';
class Page12 extends StatefulWidget {
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



  Page12(  {Key? key,required this.stationID,})
      : super(key: key);


  int stationID;
  // String bsx;

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<Page12>  {
  final hinhthucEditingController = TextEditingController();
  int stationID= 0;
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

  String hangxe = 'something';
  List listItem = ['Honda', 'Huyndai', 'Toyota', 'Mazda', 'KIA'];

  // DateTime selectedDate = DateTime.now();
  // _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2025),
  //   );
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //     });
  // }
  List<int> listYear = [];
  int? selectYear;
  getYear() async {
    const String url = 'https://api.dangkiem.online/api/Year';
    var response = await http.get(Uri.parse(url));
    List<int> jsonResponse = jsonDecode(response.body).cast<int>();
    setState(() {
      listYear = jsonResponse;
    });
  }


  List<Date> listDate = [];
  Date? valueDate;
  String? selectedDate;
  getDate(String date, id) async {
    String url = 'https://api.dangkiem.online/api/Slot?datetime=$date&stationId=$id';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      setState(() {
        listDate =
        List<Date>.from(
            jsonResponse['slot'].map((date) => Date.fromJson(date)));
      });
    }
  }




  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate:  DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (d != null)
      setState(() {
        _selectedDate = new DateFormat.yMMMMd("en_US").format(d);
      });
  }

  String _selectedDate = 'Ngày đi đăng kiểm';

  Repository2 repo = Repository2();
  List<String> _states2 = ["Tỉnh / Thành phố"];
  List<String> _districts2 = ["Trạm đăng kiểm"];
  String _selectedState2 = "Tỉnh / Thành phố";
  String _selectedDistrict2 = "Trạm đăng kiểm";

  int _value = 1;


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
    _states2 = List.from(_states2)..addAll(repo.getStates());
    super.initState();
    getdsphuongtiendangkiem();
    getYear();
  }
  onChanephuongtiendangkiem(dsphuongtiendangkiem? value){
    setState(() {
      selectdsphuongtiendangkiem=value;
    });
    var id=value!.vehicleId;
    getdsphuongtienduongbo(id);
  }




  List<String> sohuu = ['Cá nhân', 'Doanh nghiệp'];
  List<String> countries = ['Ô tô dưới 10 chỗ ngồi', ];
  List<String> countries2 = ['Ô tô dưới 10 chỗ',
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
  // List<String> indiaProvince = ['New Delhi', 'Bihar', 'Rajasthan'];
  List<String> usaProvince = ['Xe chở người dưới 10 chỗ đăng ký tên cá nhân', ];
  List<String> usaProvince1 = ['Xe chở người dưới 10 chỗ (trừ xe đăng ký tên cá nhân); xe tải, xe ô tô chuyên dùng có khối lượng toàn bộ dưới 4.000 kg; các loại xe buýt vận tải hành khách công cộng (bao gồm cả xe đưa đón học sinh, sinh viên, công nhân được hưởng chính sách trợ giá như xe buýt); xe chở hàng và xe chở người 4 bánh có gắn động cơ',

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






  @override
  // final String formattedDate = DateFormat.yMd().format(_selectedDateTime);
  // final selectedText = Text('You selected: $formattedDate');
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Giao diện thực tập",
        home: Scaffold(
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
            body: SingleChildScrollView(

                // padding: EdgeInsets.only(bottom: 15),
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 20, height: 20),
                // Padding(
                // padding: const EdgeInsets.all(8.0),
                // child: DropdownButton(
                //   value: hangxe,
                //   onChanged: (newValue),
                // )),
                const Text(
                  'ĐẶT LỊCH ĐĂNG KIỂM',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20, height: 20),

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
    // InputDecorator(
    // decoration: InputDecoration(
    // border: OutlineInputBorder(
    // borderRadius: BorderRadius.circular(20.0)),
    // contentPadding: EdgeInsets.all(3),
    // ),
    // child:
    // Padding(
    // padding: EdgeInsets.only(
    // left: 18,
    // top: 0, bottom: 0, right: 0
    // ),
    // child: Container(
    // decoration: BoxDecoration(
    // borderRadius: BorderRadius.circular(10),
    // color: Colors.white,
    //
    // ),
    // child: DropdownButtonHideUnderline(
    // child: Padding(
    // padding: const EdgeInsets.only(
    // // left: 14.0, right: 14
    // ),
    //               child: DropdownButton<String>(
    //                 isExpanded: true,
    //                 hint: const Text(
    //                   "Năm sản xuất",
    //                   style: TextStyle(fontSize: 17),
    //                 ),
    //                 value: dropdownValue1,
    //                 elevation: 16,
    //                 style: const TextStyle(color: Colors.black),
    //                 underline: Container(
    //                   height: 2,
    //                   color: Colors.white,
    //                 ),
    //                 onChanged: (String? newValue) {
    //                   setState(() {
    //                     dropdownValue1 = newValue!;
    //                   });
    //                 },
    //                 items: <String>[
    //                   '1996', '1997', '1998', '1999', '2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020', '2021'
    //                 ].map<DropdownMenuItem<String>>((String value) {
    //                   return DropdownMenuItem<String>(
    //                     value: value,
    //                     child: Text(value),
    //                   );
    //                 }).toList(),
    //               ),
    // ))))   ),
    //             SizedBox(width: 20, height: 10),
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
                                  child: DropdownButton<int>(
                                      hint: const Text(
                                        "Năm sản xuất",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      value: selectYear,
                                      iconSize: 25,
                                      isExpanded: true,
                                      items: listYear.map((item) {
                                        return DropdownMenuItem<int>(
                                          child: Text('$item'),
                                          value: item,
                                        );
                                      }).toList(),
                                      onChanged: (value) =>
                                          setState(() {
                                            selectYear = value;
                                          })),
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
                // TextField(
                //   controller: hinhthucEditingController,
                //   onChanged: (text) {
                //     this.setState(() {
                //       _hinhthuc =
                //           text; // khi state thay đổi => build() return => reload widget
                //     });
                //   },
                //   decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //         borderRadius: const BorderRadius.all(
                //             //bán kính của viền
                //             const Radius.circular(20) //bo góc tính theo pixel
                //             ),
                //       ),
                //       contentPadding: EdgeInsets.all(0),
                //       labelText: "       Hình thức",labelStyle: TextStyle(fontSize: 17) ),
                // ),
                SizedBox(width: 20, height: 10),

                  // DropdownButton<String>(
                  //   isExpanded: true,
                  //   hint: const Text(
                  //     "Sở hữu",
                  //     style: TextStyle(fontSize: 17),
                  //   ),
                  //   value: dropdownValue3,
                  //   elevation: 16,
                  //   style: const TextStyle(color: Colors.lightBlue),
                  //   underline: Container(
                  //     height: 2,
                  //     color: Colors.white,
                  //   ),
                  //   onChanged: (String? newValue) {
                  //     setState(() {
                  //       dropdownValue3 = newValue!;
                  //     });
                  //   },
                  //   items: <String>['Cá nhân', 'Doanh nghiệp']
                  //       .map<DropdownMenuItem<String>>((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  // ),
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


    //
    //
    //             InputDecorator(
    //               decoration: InputDecoration(
    //                 border: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(20.0)),
    //                 contentPadding: EdgeInsets.all(5),
    //               ),
    //               child:
    //               // DropdownButton<String>(
    //               //   isExpanded: true,
    //               //   hint: const Text(
    //               //     "Loại phương tiện theo quy định đăng kiểm",
    //               //     style: TextStyle(fontSize: 17),
    //               //   ),
    //               //   value: dropdownValue4,
    //               //   elevation: 16,
    //               //   style: const TextStyle(color: Colors.lightBlue),
    //               //   underline: SizedBox(),
    //               //   // Container(
    //               //   //   height: 2,
    //               //   //   color: Colors.white,
    //               //   // ),
    //               //   onChanged: (String? newValue) {
    //               //     setState(() {
    //               //       dropdownValue4 = newValue!;
    //               //     });
    //               //   },
    //               //   items: <String>[
    //               //     '',
    //               //     'Ô tô tải có trọng tải đến 2 tấn (bao gồm cả xe ô tô bán tải)',
    //               //     'Ô tô tải, đoàn ô tô (ô tô đầu kéo + sơ mi rơ mooc), có trọng tải trên 20 tấn và các loại ô tô chuyên dùng',
    //               //     'Ô tô tải, đoàn ô tô (ô tô đầu kéo + sơ mi rơ mooc), có trọng tải trên 7 tấn đến 20 tấn và các loại máy kéo',
    //               //     'Ô tô tải có trọng tải trên 2 tấn đến 7 tấn',
    //               //     'Máy kéo bông sen, công nông và các loại vận chuyển tương tự',
    //               //     'Rơ moóc và sơ mi rơ moóc',
    //               //     'Ô tô khách trên 40 ghế (kể cả lái xe), xe buýt',
    //               //     'Ô tô khách từ 25 đến 40 ghế (kể cả lái xe)',
    //               //     'Ô tô khách từ 10 đến 24 ghế (kể cả lái xe)',
    //               //     'Ô tô cứu thương',
    //               //   ].map<DropdownMenuItem<String>>((String value) {
    //               //     return DropdownMenuItem<String>(
    //               //       value: value,
    //               //       child: Text(value),
    //               //     );
    //               //   }).toList(),
    //               // ),
    // Padding(
    // padding: EdgeInsets.only(
    //     left: 18,
    //     top: 0, bottom: 0, right: 0
    // ),
    // child: Container(
    // decoration: BoxDecoration(
    // borderRadius: BorderRadius.circular(10),
    // color: Colors.white,
    //
    // ),
    // child: DropdownButtonHideUnderline(
    // child: Padding(
    //   padding: const EdgeInsets.only(
    //       // left: 14.0, right: 14
    //   ),
    //
    // child: DropdownButton<String>(
    //
    //                 hint: const Text(
    //                       "Loại phương tiện theo quy định đăng kiểm",
    //                       style: TextStyle(fontSize: 17),
    //                     ),                    value: selectedCountry,
    //                 isExpanded: true,
    //                 items: provinces1 .map((String value) {
    //                   return DropdownMenuItem<String>(
    //                     value: value,
    //                     child: Text(value),
    //                   );
    //                 }).toList(),
    //                 underline: SizedBox(),
    //                 onChanged: (country) {
    //                   if (country == 'Ô tô dưới 10 chỗ ngồi') {
    //                     provinces = usaProvince;
    //                   } else if (country == 'Ô tô dưới 10 chỗ') {
    //                     provinces = usaProvince1;
    //                   }else if (country == 'Ô tô tải có trọng tải đến 2 tấn (bao gồm cả xe ô tô bán tải)') {
    //                     provinces = usaProvince2;
    //                   }else if (country == 'Ô tô tải, đoàn ô tô (ô tô đầu kéo + sơ mi rơ mooc), có trọng tải trên 20 tấn và các loại ô tô chuyên dùng') {
    //                     provinces = usaProvince2;
    //                   }else if (country == 'Ô tô tải, đoàn ô tô (ô tô đầu kéo + sơ mi rơ mooc), có trọng tải trên 7 tấn đến 20 tấn và các loại máy kéo') {
    //                     provinces = usaProvince2;
    //                   }else if (country == 'Ô tô tải có trọng tải trên 2 tấn đến 7 tấn') {
    //                     provinces = usaProvince2;
    //                   }else if (country == 'Máy kéo bông sen, công nông và các loại vận chuyển tương tự') {
    //                     provinces = usaProvince2;
    //                   }else if (country == 'Rơ moóc và sơ mi rơ moóc') {
    //                     provinces = usaProvince2;
    //                   }else if (country == 'Ô tô khách trên 40 ghế (kể cả lái xe), xe buýt') {
    //                     provinces = usaProvince2;
    //                   }else if (country == 'Ô tô khách từ 25 đến 40 ghế (kể cả lái xe)') {
    //                     provinces = usaProvince2;
    //                   }else if (country == 'Ô tô khách từ 10 đến 24 ghế (kể cả lái xe)') {
    //                     provinces = usaProvince2;
    //                   } else if (country == 'Ô tô cứu thương') {
    //                     provinces = usaProvince1;
    //                   } else {
    //                     provinces = [];
    //                   }
    //                   setState(() {
    //                     selectedProvince = null;
    //                     selectedCountry = country;
    //                   });
    //                 },
    //               ),
    //             ))))),
    //             SizedBox(width: 20, height: 10),
    //             InputDecorator(
    //               decoration: InputDecoration(
    //                 border: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(20.0)),
    //                 contentPadding: EdgeInsets.all(5),
    //
    //               ),
    //               child:
    //               // DropdownButton<String>(
    //               //   isExpanded: true,
    //               //   hint: const Text(
    //               //     "Loại phương tiện theo qui định lưu thông đường bộ",
    //               //     style: TextStyle(fontSize: 17),
    //               //   ),
    //               //   value: dropdownValue5,
    //               //   elevation: 16,
    //               //   style: const TextStyle(color: Colors.lightBlue),
    //               //   underline: SizedBox(),
    //               //   onChanged: (String? newValue) {
    //               //     setState(() {
    //               //       dropdownValue5 = newValue!;
    //               //     });
    //               //   },
    //               //   items: <String>[
    //               //     'Xe chở người dưới 10 chỗ đăng ký tên cá nhân',
    //               //     'Xe chở người dưới 10 chỗ (trừ xe đăng ký tên cá nhân); xe tải, xe ô tô chuyên dùng có khối lượng toàn bộ dưới 4.000 kg; các loại xe buýt vận tải hành khách công cộng (bao gồm cả xe đưa đón học sinh, sinh viên, công nhân được hưởng chính sách trợ giá như xe buýt); xe chở hàng và xe chở người 4 bánh có gắn động cơ',
    //               //     'Xe chở người từ 10 chỗ đến dưới 25 chỗ; xe tải, xe ô tô chuyên dùng có khối lượng toàn bộ từ 4.000 kg đến dưới 8.500 kg',
    //               //     'Xe chở người từ 25 chỗ đến dưới 40 chỗ; xe tải, xe ô tô chuyên dùng có khối lượng toàn bộ từ 8.500 kg đến dưới 13.000 kg',
    //               //     'Xe chở người từ 40 chỗ trở lên; xe tải, xe ô tô chuyên dùng có khối lượng toàn bộ từ 13.000 kg đến dưới 19.000 kg; xe đầu kéo có khối lượng bản thân cộng với khối lượng cho phép kéo theo đến dưới 19.000 kg',
    //               //     'Xe tải, xe ô tô chuyên dùng có khối lượng toàn bộ từ 19.000 kg đến dưới 27.000 kg; xe đầu kéo có khối lượng bản thân cộng với khối lượng cho phép kéo theo từ 19.000 kg đến dưới 27.000 kg',
    //               //     'Xe tải, xe ô tô chuyên dùng có khối lượng toàn bộ từ 27.000 kg trở lên; xe đầu kéo có khối lượng bản thân cộng với khối lượng cho phép kéo theo từ 27.000 kg đến dưới 40.000 kg',
    //               //     'Xe ô tô đầu kéo có khối lượng bản thân cộng với khối lượng cho phép kéo theo từ 40.000 kg trở lên',
    //               //   ].map<DropdownMenuItem<String>>((String value) {
    //               //     return DropdownMenuItem<String>(
    //               //       value: value,
    //               //       child: Text(value),
    //               //     );
    //               //   }).toList(),
    //               // ),
    // Padding(
    // padding: EdgeInsets.only(
    // left: 18,
    // top: 0, bottom: 0, right: 0
    // ),
    // child: Container(
    // decoration: BoxDecoration(
    // borderRadius: BorderRadius.circular(10),
    // color: Colors.white,
    //
    // ),
    // child: DropdownButtonHideUnderline(
    // child: Padding(
    // padding: const EdgeInsets.only(
    // // left: 14.0, right: 14
    // ),
    //
    // child:                DropdownButton<String>(
    //                 hint: const Text(
    //                       "Loại phương tiện theo qui định lưu thông đường bộ",
    //                       style: TextStyle(fontSize: 17),
    //                     ),
    //                 value: selectedProvince,
    //                 isExpanded: true,
    //                 underline: SizedBox(),
    //                 items: provinces.map((String value) {
    //                   return DropdownMenuItem<String>(
    //                     value: value,
    //                     child: Text(value),
    //                   );
    //                 }).toList(),
    //                 onChanged: (province) {
    //                   setState(() {
    //
    //                     selectedProvince = province;
    //                   });
    //                 },
    //               ),
    // ))))),







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


                SizedBox(width: 20, height: 1),





// ngày đi đnagw kiểm
//                 Container(
//                   decoration: const BoxDecoration(
//                       border: Border(
//                         top: BorderSide(width: 1.0, color: Colors.grey),
//                         left: BorderSide(width: 1.0, color: Colors.grey),
//                         right: BorderSide(width: 1.0, color: Colors.grey),
//                         bottom: BorderSide(width: 1.0, color: Colors.grey),
//                       ),
//                       borderRadius: BorderRadius.all(Radius.circular(20))),
//                   child: Padding(
//                     padding: const EdgeInsets.all(0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: <Widget>[
//                         InkWell(
//                           child: Text(_selectedDate,
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                   color: Colors.grey[700], fontSize: 18)),
//                           // "${selectedDate.toLocal()}".split(' ')[0],
//                           // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                           // ),
//                           onTap: () {
//                             _selectDate(context);
//                           },
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.calendar_today),
//                           tooltip: 'Tap to open date picker',
//                           onPressed: () {
//                             _selectDate(context);
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(width: 20, height: 10),







//                 Container(
//                   decoration: const BoxDecoration(
//                       border: Border(
//                         top: BorderSide(width: 1.0, color: Colors.grey),
//                         left: BorderSide(width: 1.0, color: Colors.grey),
//                         right: BorderSide(width: 1.0, color: Colors.grey),
//                         bottom: BorderSide(width: 1.0, color: Colors.grey),
//                       ),
//                       borderRadius: BorderRadius.all(Radius.circular(20))),
//                   child: Padding(
//                     padding: const EdgeInsets.all(0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: <Widget>[
//                        new DateTimePicker(
//                             type: DateTimePickerType.date,
//                             dateMask: 'dd/MM/yyyy',
//                             initialDatePickerMode: DatePickerMode.day,
//                             // selectableDayPredicate: (date) {
//                             //   if (date.weekday == 7) {
//                             //     return false;
//                             //   }
//                             //   return true;
//                             // },
//                             firstDate: DateTime.now(),
//                             lastDate: DateTime(2100),
//                             initialDate: DateTime.now(),
//                             icon: const Icon(Icons.date_range),
//                             dateLabelText: 'Ngày đăng kiểm',
//                             calendarTitle: 'Chọn ngày đăng kiểm',
//                             cancelText: 'Huỷ bỏ',
//                             confirmText: 'Xong',
//                             onChanged: (date) {
//                               setState(() {
//                                 selectedDate = date;
//                               });
//                               listDate = [];
//                               valueDate = null;
//                               // getDate(date, widget.stationID);
//                             }),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(width: 20, height: 10),

                new Row(
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

                      child:  DateTimePicker(
                      type: DateTimePickerType.date,
                      dateMask: 'dd/MM/yyyy',
                      initialDatePickerMode: DatePickerMode.day,
                      // selectableDayPredicate: (date) {
                      //   if (date.weekday == 7) {
                      //     return false;
                      //   }
                      //   return true;
                      // },

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
                        getDate(date, widget.stationID);
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

                      child: DropdownButton<Date>(
                      hint: const Text(
                        "Chọn giờ đến",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 15),

                      ),
                      value: valueDate,
                      iconSize: 36,
                      isExpanded: true,
                      items: listDate.map((Date item) {
                        return DropdownMenuItem<Date>(
                          child: Text(
                            item.time + "(" + item.slot.toString() + ")",
                            overflow: TextOverflow.fade,
                          ),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          valueDate = value;
                        });
                      }),
                ),
]),




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
                //   children: <Widget>[
                //   const Padding(
                //         padding: EdgeInsets.only(bottom: 5.0),
                //       ),
                //       CupertinoRadioChoice(
                //           choices: genderMap,
                //           onChange: onGenderSelected,
                //           initialKeyValue: _selectedGender),
                //       ]
                // ),







                SizedBox(width: 20, height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child:Text(
                    "Chọn giờ đến",
                   style: TextStyle(
                        fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // SizedBox(width: 20, height: 10),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(children: <Widget>[
                  MyRadioListTile<int>(
                  value: 1,
                  groupValue: _value,
                  leading: '08:00',

                  onChanged: (value) => setState(() => _value = value!),
                ),
                MyRadioListTile<int>(
                  value: 2,
                  groupValue: _value,
                  leading: '08:30',
                  onChanged: (value) => setState(() => _value = value!),
                ),
                MyRadioListTile<int>(
                  value: 3,
                  groupValue: _value,
                  leading: '09:00',
                  onChanged: (value) => setState(() => _value = value!),
                ),
                        MyRadioListTile<int>(
                          value: 4,
                          groupValue: _value,
                          leading: '09:30',

                          onChanged: (value) => setState(() => _value = value!),
                        ),
                        MyRadioListTile<int>(
                          value: 5,
                          groupValue: _value,
                          leading: '10:00',
                          // title: Text('Two'),
                          onChanged: (value) => setState(() => _value = value!),
                        ),
                        MyRadioListTile<int>(
                          value: 6,
                          groupValue: _value,
                          leading: '10:30',
                          // title: Text('Three'),
                          onChanged: (value) => setState(() => _value = value!),
                        ),  MyRadioListTile<int>(
                          value: 7,
                          groupValue: _value,
                          leading: '11:00',
                          // title: Text('Three'),
                          onChanged: (value) => setState(() => _value = value!),
                        ),

                      ]
                      ),
                      Row(children: <Widget>[
                        MyRadioListTile<int>(
                          value: 8,
                          groupValue: _value,
                          leading: '11:30',

                          onChanged: (value) => setState(() => _value = value!),
                        ),
                        MyRadioListTile<int>(
                          value: 9,
                          groupValue: _value,
                          leading: '13:30',
                          onChanged: (value) => setState(() => _value = value!),
                        ),
                        MyRadioListTile<int>(
                          value: 10,
                          groupValue: _value,
                          leading: '14:00',
                          onChanged: (value) => setState(() => _value = value!),
                        ),
                        MyRadioListTile<int>(
                          value: 11,
                          groupValue: _value,
                          leading: '14:30',

                          onChanged: (value) => setState(() => _value = value!),
                        ),
                        MyRadioListTile<int>(
                          value: 12,
                          groupValue: _value,
                          leading: '15:00',
                          // title: Text('Two'),
                          onChanged: (value) => setState(() => _value = value!),
                        ),
                        MyRadioListTile<int>(
                          value: 13,
                          groupValue: _value,
                          leading: '15:30',
                          // title: Text('Three'),
                          onChanged: (value) => setState(() => _value = value!),
                        ),  MyRadioListTile<int>(
                          value: 14,
                          groupValue: _value,
                          leading: '16:00',
                          // title: Text('Three'),
                          onChanged: (value) => setState(() => _value = value!),
                        ),
                      ]
                      ),
                  ]
                      ),



  //               new Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: <Widget>[
  //                   Container(
  //                     decoration: const BoxDecoration(
  //                         border: Border(
  //                           top: BorderSide(width: 1.0, color: Colors.grey),
  //                           left: BorderSide(width: 1.0, color: Colors.grey),
  //                           right: BorderSide(width: 1.0, color: Colors.grey),
  //                           bottom: BorderSide(width: 1.0, color: Colors.grey),
  //                         ),
  //                         borderRadius: BorderRadius.all(Radius.circular(20))),
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(3),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                         children: <Widget>[
  //                           InkWell(
  //                             child: Text(_selectedDate,
  //                                 textAlign: TextAlign.left,
  //                                 style: TextStyle(
  //                                     color: Colors.grey[700], fontSize: 18)),
  //                             // "${selectedDate.toLocal()}".split(' ')[0],
  //                             // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                             // ),
  //                             onTap: () {
  //                               _selectDate(context);
  //                             },
  //                           ),
  //                           IconButton(
  //                             icon: Icon(Icons.calendar_today),
  //                             tooltip: 'Tap to open date picker',
  //                             onPressed: () {
  //                               _selectDate(context);
  //                             },
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //
  //                 ]),


  SizedBox(width: 20, height: 0),

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
                          // if(
                          //
                          // // hinhthucEditingController.text.isEmpty||
                          // selectedProvince== null||
                          // selectedCountry == null||
                          // selectedsohuu == null||
                          //     dropdownValue == null||
                          //     dropdownValue1 == null||
                          //     dropdownValue2 == null||
                          //     _selectedDate== null
                          // ){
                          //   const snackBar = SnackBar(
                          //       content: Text('Không được để trống', style: TextStyle(color: Colors.red),));
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(snackBar);
                          // }else {
                            print('đã bấm nút tiếp tục');
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Page13()));
                          // }
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
  void _onSelectedState2(String value) {
    setState(() {
      _selectedDistrict2 = "Trạm đăng kiểm";
      _districts2 = ["Trạm đăng kiểm"];
      _selectedState2 = value;
      _districts2 = List.from(_districts2)..addAll(repo.getLocalByState(value));
    });
  }

  void _onSelectedDistrict2(String value) {
    setState(() => _selectedDistrict2 = value);
  }

}
// void onBirthdayChange(DateTime birthday) {
//   setState(() {
//     _selectedDateTime = birthday;
//   });
// }
// }
class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String leading;
  final Widget? title;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: 56,

        padding: EdgeInsets.symmetric(horizontal: 0,vertical:0),
        child: Row(
          children: [
            _customRadioButton,
            SizedBox(width:5),
            if (title != null) title,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : null,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Text(
        leading,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[600]!,
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
      ),
    );
  }
}