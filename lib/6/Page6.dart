import 'package:flutter/material.dart';
import '../1/Page12.dart';
import '../2/Page22.dart';
import '../3/Page32.dart';
import '../4/Page42.dart';
import 'Page62.dart';
import '../main.dart';
import '../repository.dart';
// class Item {
//   const Item({required this.namecity});
//   final String namecity;
// }

class Page6 extends StatefulWidget {
  static const String _title = 'Flutter Code Sample';
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}



class _MyAppState extends State<Page6> with WidgetsBindingObserver {
// const Page1({Key? key}) : super(key: key);
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
  String? dropdownmucdichsudung;


  bool isChecked = false;
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // DropdownButton(
              //   items: _dropdownMenuItems,
              //   value: _selectedCompany,
              //   onChanged: onChangeDropdownItem,
              // ),
              SizedBox(width: 20, height: 30),
              const Text(
                'MUA BẢO HIỂM VCX Ô TÔ',
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


              InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  contentPadding: EdgeInsets.all(0),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text(
                    "   Mục đích sử dụng",
                    style: TextStyle(fontSize: 17),
                  ),
                  value: dropdownmucdichsudung,
                  elevation: 16,
                  style: const TextStyle(color: Colors.red, ),
                  underline: Container(
                    height: 2,
                    color: Colors.white,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownmucdichsudung = newValue!;
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
              ),
              SizedBox(width: 20, height: 10),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Tải lên hình ảnh đăng ký xe",
                      style: TextStyle(fontSize: 15,color: Colors.grey),
                    ),
                  ),
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




              SizedBox(width: 20, height: 40),

              FlatButton(
                child: Text('TIẾP TỤC '),
                padding: EdgeInsets.all(15.0),
                shape: StadiumBorder(),
                textColor: Colors.white,
                color: Colors.yellow[800],
                onPressed: () {
                  print('đã bấm nút tiếp tục');
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Page62()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }



// void setState(Null Function() param0) {}
}
