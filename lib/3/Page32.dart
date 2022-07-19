import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../1/Page1.dart';
import 'Page33.dart';
import '../main.dart';
import 'package:intl/intl.dart';
import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import '../1/Page13.dart';

class Page32 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<Page32> with WidgetsBindingObserver {
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

  String _selectedDate = 'Chọn thời gian đóng';
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
                    const Icon(
                      Icons.security,
                      color: Colors.yellow,
                      size: 29,
                    ),
                    SizedBox(width: 20, height: 7),
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
                    const Text(
                      'ĐÓNG PHÍ ĐƯỜNG BỘ TRỰC TIẾP',
                      style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20, height: 30),
                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        contentPadding: EdgeInsets.all(5),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text(
                          "Hãng xe",
                          style: TextStyle(fontSize: 17),
                        ),
                        value: dropdownValue,
                        elevation: 16,
                        style: const TextStyle(color: Colors.lightBlue),
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
                    ),
                    SizedBox(width: 20, height: 10),

                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        contentPadding: EdgeInsets.all(5),
                      ),
                      child: DropdownButton<String>(
                        hint: const Text(
                          "Loại phương tiện ",
                          style: TextStyle(fontSize: 17),
                        ),
                        value: selectedCountry,
                        isExpanded: true,
                        items: provinces1.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        underline: SizedBox(),
                        onChanged: (country) {


                          setState(() {
                            selectedProvince = null;
                            selectedCountry = country;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 20, height: 10),
                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        contentPadding: EdgeInsets.all(5),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text(
                          "Năm sản xuất",
                          style: TextStyle(fontSize: 17),
                        ),
                        value: dropdownValue1,
                        elevation: 16,
                        style: const TextStyle(color: Colors.lightBlue),
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
                          '1996',
                          '1997',
                          '1998',
                          '1999',
                          '2000',
                          '2001',
                          '2002',
                          '2003',
                          '2004',
                          '2005',
                          '2006',
                          '2007',
                          '2008',
                          '2009',
                          '2010',
                          '2011',
                          '2012',
                          '2013',
                          '2014',
                          '2015',
                          '2016',
                          '2017',
                          '2018',
                          '2019',
                          '2020',
                          '2021'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(width: 20, height: 10),
                    TextField(
                      controller: hinhthucEditingController,
                      onChanged: (text) {
                        this.setState(() {
                          _hinhthuc =
                              text; // khi state thay đổi => build() return => reload widget
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              //bán kính của viền
                                const Radius.circular(20) //bo góc tính theo pixel
                            ),
                          ),
                          labelText: "Hình thức"),
                    ),
                    SizedBox(width: 20, height: 10),
                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        contentPadding: EdgeInsets.all(5),
                      ),
                      child: DropdownButton<String>(
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
                            provinces1 = countries;
                          } else if (cba == 'Doanh nghiệp') {
                            provinces1 = countries2;
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
                    ),

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





                    new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlatButton(
                            child: Text('QUAY LẠI'),
                            textColor: Colors.white,
                            color: Colors.yellow[600],

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
                                  builder: (context) => Page33()));
                            },
                          ),
                        ]),

                  ],
                ))));
  }

  void onGenderSelected(String genderKey) {
    setState(() {
      _selectedGender = genderKey;
    });
  }
}

