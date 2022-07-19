import 'package:flutter/material.dart';
import 'package:test11/model/City.dart';
import '../1/Page12.dart';
import '../2/Page22.dart';
import 'Page32.dart';
import '../main.dart';
import '../model/thanhpho.dart';
import '../repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// class Item {
//   const Item({required this.namecity});
//   final String namecity;
// }

class Page3 extends StatefulWidget {
  static const String _title = 'Flutter Code Sample';
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}



class _MyAppState extends State<Page3> with WidgetsBindingObserver {
// const Page1({Key? key}) : super(key: key);
  final emailEditingController = TextEditingController();
  final nameEditingController = TextEditingController();
  final sdtEditingController = TextEditingController();
  final biensoxeEditingController = TextEditingController();
  final diachinhanxeEditingController = TextEditingController();
  // String _chosenValue = "something";

  String _email = "something";
  String _name = "something";
  int _sdt = 0;
  String _biensoxe = "something";
  String _diachinhanxe = "something";


  Repository repo = Repository();
  List<String> _states = ["Tỉnh / Thành phố"];
  List<String> _districts = ["Điểm đăng kiểm"];
  String _selectedState = "Tỉnh / Thành phố";
  String _selectedDistrict = "Điểm đăng kiểm";

  String? dropdownValue;
  @override
  void initState() {
    _states = List.from(_states)..addAll(repo.getStates());
    getCity();
    super.initState();
  }

  City? selectTp;
  List<City> listTp = [];
  getCity() async {//City
    const String url = 'https://api.dangkiem.online/api/City';
    var response = await http.get(Uri.parse(url));
    List<dynamic> jsonResponse = jsonDecode(response.body)["city"];
    setState(() {
      listTp = List<City>.from(
          jsonResponse.map((it) => City.fromJson(it)));
    });
  }
  onChaneCity(City? value){
    setState(() {
      selectTp=value;
    });


  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Giao diện thực tập",
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // DropdownButton(
              //   items: _dropdownMenuItems,
              //   value: _selectedCompany,
              //   onChanged: onChangeDropdownItem,
              // ),

              const Text(
                'ĐÓNG PHÍ ĐƯỜNG BỘ TRỰC TIẾP',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),

              SizedBox(width: 20, height: 30),

              TextField(
                controller: nameEditingController,
                onChanged: (text) {
                  this.setState(() {
                    _name =
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
                    labelText: "Họ và tên"),
              ),
              SizedBox(width: 20, height: 10),

              TextField(
                  controller: sdtEditingController,
                  onChanged: (text) {
                    this.setState(() {
                      _sdt =
                      0; // khi state thay đổi => build() return => reload widget
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          //bán kính của viền
                          const Radius.circular(20),
                          //bo góc tính theo pixel,
                        ),
                      ),
                      labelText: "Số điện thoại"),
                  keyboardType: TextInputType.number),
              SizedBox(width: 20, height: 10),
              TextField(
                controller: biensoxeEditingController,
                onChanged: (text) {
                  this.setState(() {
                    _biensoxe =
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
                    labelText: "Biển số xe"),
              ),
              SizedBox(width: 20, height: 10),
              TextField(
                controller: diachinhanxeEditingController,
                onChanged: (text) {
                  this.setState(() {
                    _diachinhanxe =
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
                    labelText: "Địa chỉ nhận tem phí đường bộ"),
              ),
              SizedBox(width: 20, height: 10),
              // InputDecorator(
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20.0)),
              //     contentPadding: EdgeInsets.all(5),
              //   ),
              //   child: DropdownButton<String>(
              //     isExpanded: true,
              //     items: _states.map((String dropDownStringItem) {
              //       return DropdownMenuItem<String>(
              //         value: dropDownStringItem,
              //
              //         child: Text(dropDownStringItem,),
              //       );
              //     }).toList(),
              //     onChanged: (value) => _onSelectedState(value!),
              //     value: _selectedState,
              //   ),
              // ),


              // InputDecorator(
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20.0)),
              //     contentPadding: EdgeInsets.all(5),
              //   ),
              //   child:  DropdownButton<City>(
              //     hint: const Text(" Tỉnh/Tp",),
              //     underline: SizedBox(),
              //     value: selectTp,
              //     iconSize: 36,
              //     isExpanded: true,
              //     items: listTp.map((City item) {
              //       return DropdownMenuItem<City>(
              //         child: Text("   TP " + item.name),
              //         value: item,
              //       );
              //     }).toList(),
              //     onChanged: (value) {
              //       onChaneCity(value);
              //
              //     },
              //   ),
              // ),
              SizedBox(width: 20, height: 10),

              SizedBox(width: 20, height: 10),

              FlatButton(
                child: Text('TIẾP TỤC '),
                padding: EdgeInsets.all(15.0),
                shape: StadiumBorder(),
                textColor: Colors.white,
                color: Colors.yellow[800],
                onPressed: () {
                  print('đã bấm nút tiếp tục');
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Page32()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSelectedState(String value) {
    setState(() {
      _selectedDistrict = "Điểm đăng kiểm";
      _districts = ["Điểm đăng kiểm"];
      _selectedState = value;
      _districts = List.from(_districts)..addAll(repo.getLocalByState(value));
    });
  }

  void _onSelectedDistrict(String value) {
    setState(() => _selectedDistrict = value);
  }

// void setState(Null Function() param0) {}
}
