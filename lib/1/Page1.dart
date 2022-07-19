// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:test11/model/thanhpho.dart';
// import 'Page12.dart';
// import '../model/TramDK.dart';
// import '../repository.dart';
//
// // class Item {
// //   const Item({required this.namecity});
// //   final String namecity;
// // }
//
// class Page1 extends StatefulWidget {
//   static const String _title = 'Flutter Code Sample';
//   @override
//   State<StatefulWidget> createState() {
//     return _MyAppState();
//   }
// }
//
// // class Company {
// //   int id = 0;
// //   String namecity = "something";
// //   Company(this.id, this.namecity);
// //   static List<Company> getCompanies() {
// //     return <Company>[
// //       Company(1, 'Hà Nội'),
// //       Company(2, 'tp HCM '),
// //       Company(3, 'Nam Định'),
// //       Company(4, 'Nghệ An'),
// //     ];
// //   }
// // }
//
// class _MyAppState extends State<Page1> with WidgetsBindingObserver {
// // const Page1({Key? key}) : super(key: key);
//   final emailEditingController = TextEditingController();
//   final nameEditingController = TextEditingController();
//   final sdtEditingController = TextEditingController();
//   final biensoxeEditingController = TextEditingController();
//   // String _chosenValue = "something";
//
//   City? selectTp;
//   List<City> listTp = [];
//   TramDk? selectDk;
//   List<TramDk> listDk=[];
//
//   var stationID;
//
//   getCity() async {//City
//     const String url = 'https://api.dangkiem.online/api/City';
//     var response = await http.get(Uri.parse(url));
//     List<dynamic> jsonResponse = jsonDecode(response.body)["city"];
//     setState(() {
//       listTp = List<City>.from(
//           jsonResponse.map((it) => City.fromJson(it)));
//     });
//   }
//   getTramDk(int id) async {
//     String url = 'https://api.dangkiem.online/api/Station/$id';
//     var response = await http.get(Uri.parse(url));
//     List<dynamic> jsonResponse = jsonDecode(response.body);
//     setState(() {
//       listDk = List<TramDk>.from(
//           jsonResponse.map((dk) => TramDk.fromJson(dk)));
//     });}
//     @override
//   void initState() {
//     _states = List.from(_states)..addAll(repo.getStates());
//     super.initState();
//     getCity();
//   }
//   onChaneCity(City? value){
//     setState(() {
//       selectTp=value;
//     });
//     var id=value!.cityId;
//     getTramDk(id);
//   }
//   String _email = "something";
//   String _name = "something";
//   int _sdt = 0;
//   String _biensoxe = "something";
// //   List<Company> _companies = Company.getCompanies();
// //   late List<DropdownMenuItem<Company>> _dropdownMenuItems;
// // late   Company? _selectedCompany;
// //   @override
// //   void initState() {
// //     _dropdownMenuItems = buildDropdownMenuItems(_companies);
// //     _selectedCompany = _dropdownMenuItems[0].value!;
// //     super.initState();
// //   }
// //
// //   List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
// //     List<DropdownMenuItem<Company>> items = [];
// //     for (Company company in companies) {
// //       items.add(
// //         DropdownMenuItem(
// //           value: company,
// //           child: Text(company.namecity),
// //         ),
// //       );
// //     }
// //     return items;
// //   }
// //
// //    onChangeDropdownItem(Company? selectedCompany) {
// //     setState(() {
// //       _selectedCompany = selectedCompany;
// //     });
// //   }
//   Repository repo = Repository();
//   List<String> _states = ["Tỉnh / Thành phố"];
//   List<String> _districts = ["Trạm đăng kiểm"];
//   String _selectedState = "Tỉnh / Thành phố";
//   String _selectedDistrict = "Trạm đăng kiểm";
//
//   String? dropdown2Value;
//   // @override
//   // void initState2() {
//   //   _states = List.from(_states)..addAll(repo.getStates());
//   //   super.initState();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Giao diện thực tập",
//       home: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           backgroundColor: Colors.grey[800],
//           title: Center(
//               child: Column(children: <Widget>[
//             // const Icon(
//             //   Icons.security,
//             //   color: Colors.yellow,
//             //   size: 29,
//             // ),
//                 Image.asset('images/logo.png', width: 50,height: 35),
//                 SizedBox(width: 20, height: 0),
//             const Text('CỔNG DỊCH VỤ ĐĂNG KIỂM BẢO HIỂM',
//                 style: TextStyle(fontSize: 17)),
//           ])),
//         ),
//         body: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//
//
//
//               const Text(
//                 'ĐẶT LỊCH ĐĂNG KIỂM',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(width: 20, height: 30),
//
//               TextField(
//                 controller: nameEditingController,
//                 onChanged: (text) {
//                   this.setState(() {
//                     _name =
//                         text; // khi state thay đổi => build() return => reload widget
//                   });
//                 },
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: const BorderRadius.all(
//                           //bán kính của viền
//                           const Radius.circular(20) //bo góc tính theo pixel
//                           ),
//                     ),
//                     labelText: "Họ và tên"),
//               ),
//               SizedBox(width: 20, height: 10),
//
//               TextField(
//                   controller: sdtEditingController,
//                   onChanged: (text) {
//                     this.setState(() {
//                       _sdt =
//                           0; // khi state thay đổi => build() return => reload widget
//                     });
//                   },
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: const BorderRadius.all(
//                           //bán kính của viền
//                           const Radius.circular(20),
//                           //bo góc tính theo pixel,
//                         ),
//                       ),
//                       labelText: "Số điện thoại"),
//                   keyboardType: TextInputType.number),
//               SizedBox(width: 20, height: 10),
//               TextField(
//                 controller: biensoxeEditingController,
//                 onChanged: (text) {
//                   this.setState(() {
//                     _biensoxe =
//                         text; // khi state thay đổi => build() return => reload widget
//                   });
//                 },
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: const BorderRadius.all(
//                           //bán kính của viền
//                           const Radius.circular(20) //bo góc tính theo pixel
//                           ),
//                     ),
//                     labelText: "Biển số xe"),
//               ),
//               SizedBox(width: 20, height: 10),
//               // InputDecorator(
//               //   decoration: InputDecoration(
//               //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
//               //     contentPadding: EdgeInsets.all(5),
//               //   ),
//               //   child: DropdownButton<String>(
//               //         isExpanded: true,
//               //         hint: const Text("Tỉnh / Thành phố", style: TextStyle(fontSize: 15),),
//               //         value: dropdownValue,
//               //         elevation: 16,
//               //         style: const TextStyle(color: Colors.deepPurple),
//               //         underline: Container(
//               //           height: 2,
//               //           color: Colors.white,
//               //         ),
//               //         onChanged: (String? newValue) {
//               //           setState(() {
//               //             dropdownValue = newValue!;
//               //           });
//               //         },
//               //         items: <String>['Hà Nội', 'Nam Định', 'tp HCM', 'Huế']
//               //             .map<DropdownMenuItem<String>>((String value) {
//               //           return DropdownMenuItem<String>(
//               //             value: value,
//               //             child: Text(value),
//               //           );
//               //         }).toList(),
//               //
//               //
//               //       ),
//               // ),
//
//               // InputDecorator(
//               //   decoration: InputDecoration(
//               //     border: OutlineInputBorder(
//               //         borderRadius: BorderRadius.circular(20.0)),
//               //     contentPadding: EdgeInsets.all(5),
//               //   ),
//               //   child: DropdownButton<String>(
//               //     isExpanded: true,
//               //     items: _states.map((String dropDownStringItem) {
//               //       return DropdownMenuItem<String>(
//               //         value: dropDownStringItem,
//               //
//               //         child: Text(dropDownStringItem,),
//               //       );
//               //     }).toList(),
//               //     onChanged: (value) => _onSelectedState(value!),
//               //     value: _selectedState,
//               //   ),
//               // ),
//               // SizedBox(width: 20, height: 10),
//               //
//               // InputDecorator(
//               //   decoration: InputDecoration(
//               //     border: OutlineInputBorder(
//               //         borderRadius: BorderRadius.circular(20.0)),
//               //     contentPadding: EdgeInsets.all(5),
//               //   ),
//               //   child: DropdownButton<String>(
//               //     isExpanded: true,
//               //     items: _districts.map((String dropDownStringItem) {
//               //       return DropdownMenuItem<String>(
//               //         value: dropDownStringItem,
//               //         child: Text(dropDownStringItem),
//               //       );
//               //     }).toList(),
//               //     underline: SizedBox(),
//               //     // onChanged: (value) => print(value),
//               //     onChanged: (value) => _onSelectedDistrict(value!),
//               //     value: _selectedDistrict,
//               //   ),
//               // ),
//
//
//
//
//               InputDecorator(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0)),
//                   contentPadding: EdgeInsets.all(5),
//                 ),
//                 child:  DropdownButton<City>(
//                   hint: const Text("Tỉnh/Tp",),
//                   underline: SizedBox(),
//                   value: selectTp,
//                   iconSize: 36,
//                   isExpanded: true,
//                   items: listTp.map((City item) {
//                     return DropdownMenuItem<City>(
//                       child: Text("TP " + item.name),
//                       value: item,
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     onChaneCity(value);
//                     selectDk = null;
//                   },
//                 ),
//               ),
//               SizedBox(width: 20, height: 10),
//
//               InputDecorator(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0)),
//                   contentPadding: EdgeInsets.all(5),
//                 ),
//                 child: DropdownButton<TramDk>(
//                   hint: const Text("Trạm đăng kiểm"),
//                   underline: SizedBox(),
//                   value: selectDk,
//                   iconSize: 36,
//                   isExpanded: true,
//                   items: listDk.map((TramDk item) {
//                     return DropdownMenuItem<TramDk>(
//                       child: Text("\n" + item.stationName,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       value: item,
//                     );
//                   }).toList(),
//                   onChanged: (valueDK) {
//                     setState(() {
//                       selectDk =valueDK!;
//                     });
//                   },
//                 ),
//               ),
// //                DropdownButton<String>(
// //                 items: items.map(buildMenuItem).toList(),
// //
// //               ),
// // DropdownMenuItem<String> buildMenuItem(String item)
// //               => DropdownMenuItem(value: item);
//               SizedBox(width: 20, height: 10),
//
//               FlatButton(
//                 child: Text('TIẾP TỤC '),
//                 padding: EdgeInsets.all(15.0),
//                 shape: StadiumBorder(),
//                 textColor: Colors.white,
//                 color: Colors.yellow[800],
//                 onPressed: ()
//     //             { if(
//     // nameEditingController.text.isEmpty ||
//     // sdtEditingController.text.isEmpty ||
//     // biensoxeEditingController.text.isEmpty||
//     //             selectDk == null ||
//     //             selectTp == null
//     // ){
//     // const snackBar = SnackBar(
//     // content: Text('Không được để trống', style: TextStyle(color: Colors.red),));
//     // ScaffoldMessenger.of(context)
//     //     .showSnackBar(snackBar);
//     // }else
//       {
//         checkValue();
//                   // print('đã bấm nút tiếp tục');
//                   // Navigator.of(context)
//                   //     .push(MaterialPageRoute(builder: (context) => Page12()));
//               // ; }
//               },
//               ),
//
//               // ClipRRect(
//               //   borderRadius: BorderRadius.circular(20),
//               //   child: Container(
//               //     width: 200,
//               //     height: 60,
//               //     color: Colors.orangeAccent,
//               //     child: TextButton(
//               //       child: const Text('TIẾP TỤC'),
//               //       style: TextButton.styleFrom(
//               //         primary: Colors.white,
//               //         backgroundColor: Colors.amber,
//               //         onSurface: Colors.grey,
//               //       ),
//               //       onPressed: () {
//               //         if (nameEditingController.text.isEmpty ||
//               //             sdtEditingController.text.isEmpty ||
//               //             biensoxeEditingController.text.isEmpty) {
//               //           const snackBar = SnackBar(
//               //               content: Text('Không được để trống'));
//               //           ScaffoldMessenger.of(context)
//               //               .showSnackBar(snackBar);
//               //         } else {
//               //           Navigator.of(context)
//               //               .push(MaterialPageRoute( builder: (context) =>  Page12()),
//               //           );
//               //         }
//               //       },
//               //     ),
//               //   ),
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _onSelectedState(String value) {
//     setState(() {
//       _selectedDistrict = "Trạm đăng kiểm";
//       _districts = ["Trạm đăng kiểm"];
//       _selectedState = value;
//       _districts = List.from(_districts)..addAll(repo.getLocalByState(value));
//     });
//   }
//
//   void _onSelectedDistrict(String value) {
//     setState(() => _selectedDistrict = value);
//   }
//
//
//   void checkValue() {
//     int idPTDK = selectDk!.stationId;
//     // String bienso=biensoxeEditingController.toString();
//     setState(() {
//       // if(
//       // nameEditingController.text.isEmpty ||
//       // sdtEditingController.text.isEmpty ||
//       // biensoxeEditingController.text.isEmpty||
//       //             selectDk == null ||
//       //             selectTp == null
//       // ){
//       // const snackBar = SnackBar(
//       // content: Text('Không được để trống', style: TextStyle(color: Colors.red),));
//       // ScaffoldMessenger.of(context)
//       //     .showSnackBar(snackBar);
//       // }else
//       {
//
//         print('đã bấm nút tiếp tục');
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) =>Page12(stationID: idPTDK,
//              )));
//         // ; }
//       };
//     }
//     );
//   }
//   // void setState(Null Function() param0) {}
// }
