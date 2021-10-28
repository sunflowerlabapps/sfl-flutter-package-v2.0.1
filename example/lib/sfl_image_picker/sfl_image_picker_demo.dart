// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:sfl_flutter_package/sfl_flutter_package.dart';
//
// class SFLImagePickerDemo extends StatefulWidget {
//   static final String route = 'sfl-image-picker-demo';
//   @override
//   _SFLImagePickerDemoState createState() => _SFLImagePickerDemoState();
// }
//
// class _SFLImagePickerDemoState extends State<SFLImagePickerDemo> {
//   File _file;
//   List<Image> _assetList;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("SFL image Picker Demo"),
//       ),
//       body: Center(
//         child: Wrap(
//           children: [
//             Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 100,
//                       width: 100,
//                       child: SFLImagePicker(
//                         type: SFLImagePickerTypes.single,
//                         selectionTitile: "Please select your Source",
//                         cameraLableSubstitute: "Camera Substitude",
//                         galaryLableSubsititude: "Gallery Substitude",
//                         onImagePick: callBackFormImagePicker,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Text("Single Image Picker"),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 100,
//                       width: 100,
//                       child: SFLImagePicker(
//                         type: SFLImagePickerTypes.multiple,
//                         child: SFLImagePicker(
//                           type: SFLImagePickerTypes.multiple,
//                           // child: RaisedButton(
//                           //   onPressed: () {},
//                           //   child: Text("Select"),
//                           // ),
//                           onImagePick: callBackFormImagePicker,
//                         ),
//                         onImagePick: callBackFormImagePicker,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Text("Multi Image Picker"),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 100,
//                       width: 100,
//                       child: _file == null
//                           ? Text("Picked Image will be here")
//                           : Image.file(
//                               _file,
//                               fit: BoxFit.fill,
//                             ),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Text("Image Displyed with call back"),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                         height: 100,
//                         width: 100,
//                         child: _assetList == null
//                             ? Text("Picked Image will be here")
//                             : GridView.builder(
//                                 itemCount: _assetList.length,
//                                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 2,
//                                 ),
//                                 itemBuilder: (context, index) {
//                                   return Card(
//                                     child: _assetList[index],
//                                   );
//                                 },
//                               )),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Text("Images Displyed with call back function "),
//                   ],
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   void callBackFormImagePicker(File file, List<Image> images) {
//     setState(() {
//       _file = file;
//       _assetList = images;
//     });
//   }
// }
