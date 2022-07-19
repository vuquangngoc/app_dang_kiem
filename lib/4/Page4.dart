import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../1/Page12.dart';
import '../2/Page22.dart';
import '../3/Page32.dart';
import 'Page42.dart';
import '../main.dart';
import '../repository.dart';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';

import 'package:image_picker/image_picker.dart';


class Page4 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}



class _MyAppState extends State<Page4> with WidgetsBindingObserver {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final emailEditingController = TextEditingController();
  final nameEditingController = TextEditingController();
  final sdtEditingController = TextEditingController();
  final hangbaohiemEditingController = TextEditingController();
  final loaixeEditingController = TextEditingController();
  // String _chosenValue = "something";

  String _email = "something";
  String _name = "something";
  int _sdt = 0;
  String _hangbaohiem = "something";
  String _loaixe = "something";


  Repository repo = Repository();
  List<String> _states = ["Tỉnh / Thành phố"];
  List<String> _districts = ["Điểm đăng kiểm"];
  String _selectedState = "Tỉnh / Thành phố";
  String _selectedDistrict = "Điểm đăng kiểm";

  String? dropdownValue;
  @override
  void initState() {
    _states = List.from(_states)..addAll(repo.getStates());
    super.initState();
  }

  File? image;
  Future pickImgae() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Không tải được ảnh lên :$e");
    }
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
    body: Container(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
    padding: const EdgeInsets.all(2),
    scrollDirection: Axis.vertical,
    child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // DropdownButton(
              //   items: _dropdownMenuItems,
              //   value: _selectedCompany,
              //   onChanged: onChangeDropdownItem,
              // ),

              const Text(
                'MUA BẢO HIỂM TNDS XE MÁY',
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
                controller: emailEditingController,
                onChanged: (text) {
                  this.setState(() {
                    _email =
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
                    labelText: "Email"),
              ),
              SizedBox(width: 20, height: 10),


              TextField(
                controller: loaixeEditingController,
                onChanged: (text) {
                  this.setState(() {
                    _loaixe =
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
                    labelText: "Loại xe"),
              ),
              SizedBox(width: 20, height: 10),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  image != null ?
                  Image.file(image!,
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ): Text("Tải lên hình ảnh đăng ký xe"),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      width: 90,
                      height: 35,
                      color: Colors.orangeAccent,
                      child: TextButton(
                        child: const Text('UPLOAD',style: TextStyle(fontWeight: FontWeight.bold),),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.brown,
                          onSurface: Colors.black,

                        ),
                        onPressed: () {
                          pickImgae();
                        },
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(width: 20, height: 10),
              TextField(
                controller: hangbaohiemEditingController,
                onChanged: (text) {
                  this.setState(() {
                    _hangbaohiem =
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
                    labelText: "Lựa chọn hãng bảo hiểm"),
              ),
              SizedBox(width: 20, height: 10),
              const Text(
                '*Khuyến cáo khách hàng nên lựa chọn các hãng bảo hiểm có ấn chỉ điện tử',
                style: TextStyle(fontSize: 11,color: Colors.red),
              ),

              SizedBox(width: 20, height: 30),
              SizedBox(width: 20, height: 10),

              FlatButton(
                child: Text('TIẾP TỤC '),
                padding: EdgeInsets.all(15.0),
                shape: StadiumBorder(),
                textColor: Colors.white,
                color: Colors.yellow[800],
                onPressed: () {
                  if (nameEditingController.text.isEmpty ||
                      emailEditingController.text.isEmpty ||
                      sdtEditingController.text.isEmpty ||
                     loaixeEditingController .text.isEmpty ||
                      hangbaohiemEditingController == null || image == null) {
                    const snackBar = SnackBar(
                        content: Text('Không được để trống'));
                    ScaffoldMessenger.of(context)
                        .showSnackBar(snackBar);
                  }else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Page42()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    )
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


  DropdownMenuItem<String> buildMenuitem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontSize: 15),
      ));
}
