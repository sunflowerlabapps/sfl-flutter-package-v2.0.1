// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:multi_image_picker/multi_image_picker.dart';
// import 'package:sfl_flutter_package/sfl_flutter_package.dart';
//
// class SFLImagePicker extends StatefulWidget {
//   SFLImagePicker({
//     required this.type,
//     this.width,
//     this.height,
//     this.crossAxisCount,
//     this.maxImages,
//     this.imageIndex,
//     this.activeBarTitle,
//     this.child,
//     this.onImagePick,
//     this.selectionTitile,
//     this.cameraLableSubstitute,
//     this.galaryLableSubsititude,
//   });
//
//   /// [type] value [SFLImagePickerTypes.single] return a [Single Image Picker] Widget
//   /// [type] value [SFLImagePickerTypes.multiple] return a [Multi Image Picker] Widget
//   final SFLImagePickerTypes type;
//
//   ///[width] is required to set width of [Image] widget that will show picked image.
//   final int width;
//
//   ///[height] is required to set height of [Image] widget that will show picked image.
//   final int height;
//
//   ///[crossAxisCount] is required to set number of column of [GridView]  that will show picked images in [SFLImagePickerTypes.multiple].
//   final int crossAxisCount;
//
//   ///[maxImages] is required to set number of images that will show picked images in [SFLImagePickerTypes.multiple].
//   final int maxImages;
//
//   ///[imageIndex] will be used to select a singlee image from selected multiple images.
//   final int imageIndex;
//
//   ///[activeBarTitle] will set the title of image selection screen.
//   final String activeBarTitle;
//
//   ///[child] will be set as child, which will be displyed when no imaage/images have been selected.
//   final Widget child;
//
//   ///[onImagePick] call back function that will set file path of [SFLImagePickerTypes.single] and array of [Images] for [SFLImagePickerTypes.multiple].
//   ///This functionn can be used to use image in other functionality.
//   final Function onImagePick;
//
//   ///[selectionTitile] is option to select a titile when selection dialogbox pops
//   final String selectionTitile;
//
//   ///[cameraLableSubstitute] is an option to give a diffrent name to button which allows user to pick immage from cemera.
//   final String cameraLableSubstitute;
//
//   ///[galaryLableSubsititude] is an option to give a diffrent name to button which allows user to pick immage from gallary.
//   final String galaryLableSubsititude;
//
//   @override
//   _SFLImagePickerState createState() => _SFLImagePickerState();
// }
//
// class _SFLImagePickerState extends State<SFLImagePicker> {
//   File file;
//
//   List<Asset> assets = <Asset>[];
//   List<Image> images = [];
//
//   List<Asset> resultList = <Asset>[];
//   Image image;
//
//   @override
//   Widget build(BuildContext context) {
//     switch (widget.type) {
//       case SFLImagePickerTypes.single:
//         return _buildSingleImagePicker();
//         break;
//
//       case SFLImagePickerTypes.multiple:
//         return _buildMultiImagePicker();
//         break;
//       default:
//     }
//     return Container();
//   }
//
//   Widget _buildSingleImagePicker() {
//     return Center(
//       child: file == null
//           ? InkWell(
//               onTap: () {
//                 _showAlertDialog(context);
//               },
//               child: widget.child == null
//                   ? Icon(
//                       Icons.camera,
//                       color: Colors.deepOrange,
//                     )
//                   : widget.child,
//             )
//           : Container(
//               height: double.infinity,
//               width: double.infinity,
//               child: InkWell(
//                 onTap: () {
//                   _showAlertDialog(context);
//                 },
//                 child: Image.file(
//                   file,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//     );
//   }
//
//   _showAlertDialog(BuildContext context) {
//     AlertDialog alert = AlertDialog(
//       title: Text(widget.selectionTitile ?? "Select Source of the Image"),
//       content: Wrap(
//         crossAxisAlignment: WrapCrossAlignment.center,
//         children: [_imagePickerOption()],
//       ),
//     );
//
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
//
//   Widget _imagePickerOption() {
//     return Center(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             child: Text(widget.cameraLableSubstitute ?? "Camera"),
//             onPressed: () {
//               _getSingleImage(true);
//               Navigator.pop(context);
//             },
//           ),
//           ElevatedButton(
//             child: Text(widget.galaryLableSubsititude ?? "Gallary"),
//             onPressed: () {
//               _getSingleImage(false);
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future _getSingleImage(bool fromCamera) async {
//     final picker = ImagePicker();
//     final pickedFile = fromCamera
//         ? await picker.getImage(source: ImageSource.camera)
//         : await picker.getImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         file = File(pickedFile.path);
//         widget.onImagePick(file, null);
//         print(file);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   Widget _buildMultiImagePicker() {
//     return Container(
//       child: Center(
//         child: InkWell(
//           child: widget.child == null
//               ? assets.length == 0
//                   ? Icon(
//                       Icons.camera,
//                       color: Colors.deepOrange,
//                     )
//                   : Container(
//                       child: buildGridView(),
//                     )
//               : widget.child,
//           onTap: _loadAssets,
//         ),
//       ),
//     );
//   }
//
//   Widget buildGridView() {
//     return GridView.count(
//       crossAxisCount: widget.crossAxisCount ?? 3,
//       children: List.generate(assets.length, (index) {
//         Asset asset = assets[index];
//         return AssetThumb(
//           asset: asset,
//           width: widget.width ?? 50,
//           height: widget.height ?? 50,
//         );
//       }),
//     );
//   }
//
//   Future<void> _loadAssets() async {
//     try {
//       resultList = await MultiImagePicker.pickImages(
//         maxImages: widget.maxImages ?? 300,
//         enableCamera: true,
//         selectedAssets: assets,
//         materialOptions: MaterialOptions(
//           actionBarTitle: widget.activeBarTitle ?? "SFL Image Picker",
//           allViewTitle: "All Photos",
//           useDetailsView: false,
//           selectCircleStrokeColor: "#000000",
//         ),
//       );
//     } on Exception catch (e) {
//       print("${e.toString()}");
//     }
//
//     if (!mounted) return;
//     setState(() {
//       assets = resultList;
//       if (resultList != null) {
//         assetsToImages();
//       }
//     });
//   }
//
//   void assetsToImages() async {
//     List<Image> _images = [];
//     for (var i = 0; i < assets.length; i++) {
//       final ByteData byteData = await assets[i].getByteData();
//
//       _images.insert(i, Image.memory(byteData.buffer.asUint8List()));
//     }
//     widget.onImagePick(null, _images);
//   }
// }
