import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'Page42.dart';

class MotorcyclePage extends StatefulWidget {
  const MotorcyclePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MotorcyclePage> createState() => _MotorcyclePageState();
}

class _MotorcyclePageState extends State<MotorcyclePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerLX = TextEditingController();

  final itemBH= ['Bảo Việt', 'Phúc thọ','VT'];
  String? valueBH;


  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("K tải được ảnh lên :$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(2),
            scrollDirection: Axis.vertical,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "MUA BẢO HIỂM TDNS XE MÁY",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                      controller: _controllerName,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20))),
                          labelText: "Họ và tên",
                          hintText: "Họ và tên"),
                      keyboardType: TextInputType.text),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                      controller: _controllerPhone,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20))),
                          labelText: "Số điện thoại",
                          hintText: "Số điện thoại"),
                      keyboardType: TextInputType.number),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _controllerName,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        labelText: "Email",
                        hintText: "Email"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _controllerLX,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        labelText: "Loại xe",
                        hintText: "Loại xe"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      image != null ?
                      Image.file(image!,
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      ): Text("Tải lên hình ảnh đăng ký xe"),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 150,
                          height: 50,
                          color: Colors.orangeAccent,
                          child: TextButton(
                            child: const Text('UPLOAD'),
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.brown,
                              onSurface: Colors.grey,
                            ),
                            onPressed: () {
                              pickImage();
                            },

                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButton<String>(
                        hint: const Text(
                          "Lựa chọn hãng bảo hiểm",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 15),
                        ),
                        value: valueBH,
                        iconSize: 30,
                        isExpanded: true,
                        items: itemBH.map(buildMenuitem).toList(),
                        onChanged: (value) => setState(() {
                          valueBH = value;
                        })),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 150,
                      height: 60,
                      color: Colors.orangeAccent,
                      child: TextButton(
                          child: const Text('TIẾP TỤC'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.amber,
                            onSurface: Colors.grey,
                          ),
                          onPressed: () {
                            if (_controllerName.text.isEmpty ||
                                _controllerEmail.text.isEmpty ||
                                _controllerPhone.text.isEmpty ||
                                _controllerLX.text.isEmpty ||
                                valueBH == null || image == null) {
                              const snackBar = SnackBar(
                                  content: Text('Không được để trống'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }else{
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>Page42()),
                              );
                            }
                          }
                      ),
                    ),
                  )
                ]),
          ),
          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }

  DropdownMenuItem<String> buildMenuitem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontSize: 15),
      ));
}
