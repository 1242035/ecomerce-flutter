import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shop/tools/app_data.dart';
import 'package:shop/tools/app_tools.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_translate/flutter_translate.dart';

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  List<DropdownMenuItem<String>> dropDownColors;
  String selectedColor;
  List<String> colorList = new List();

  List<DropdownMenuItem<String>> dropDownSizes;
  String selectedSize;
  List<String> sizeList = new List();

  List<DropdownMenuItem<String>> dropDownCategories;
  String selectedCategory;
  List<String> categoryList = new List();

  Map<int, File> imagesMap = new Map();

  TextEditingController prodcutTitle = new TextEditingController();
  TextEditingController prodcutPrice = new TextEditingController();
  TextEditingController prodcutDesc = new TextEditingController();

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    colorList = new List.from(localColors);
    sizeList = new List.from(localSizes);
    categoryList = new List.from(localCatgeories);
    dropDownColors = buildAndGetDropDownItems(colorList);
    dropDownSizes = buildAndGetDropDownItems(sizeList);
    dropDownCategories = buildAndGetDropDownItems(categoryList);
    selectedColor = dropDownColors[0].value;
    selectedSize = dropDownSizes[0].value;
    selectedCategory = dropDownCategories[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: new AppBar(
        title: new Text( translate("Add Products") ),
        centerTitle: false,
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new RaisedButton.icon(
                color: Colors.green,
                shape: new RoundedRectangleBorder(
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(15.0))),
                onPressed: () => pickImage(),
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: new Text(
                  translate("Add Images"),
                  style: new TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
      body: new SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new SizedBox(
              height: 10.0,
            ),
            MultiImagePickerList(
                imageList: imageList,
                removeNewImage: (index) {
                  return removeImage(index);
                }),
            new SizedBox(
              height: 10.0,
            ),
            productTextField(
                textTitle: translate("Product Title"),
                textHint: translate("Enter Product Title"),
                controller: prodcutTitle),
            new SizedBox(
              height: 10.0,
            ),
            productTextField(
                textTitle: translate("Product Price"),
                textHint: translate("Enter Product Price"),
                textType: TextInputType.number,
                controller: prodcutPrice),
            new SizedBox(
              height: 10.0,
            ),
            productTextField(
                textTitle: translate("Product Description"),
                textHint: translate("Enter Description"),
                controller: prodcutDesc,
                height: 180.0),
            new SizedBox(
              height: 10.0,
            ),
            productDropDown(
                textTitle: translate("Product Category"),
                selectedItem: selectedCategory,
                dropDownItems: dropDownCategories,
                changedDropDownItems: changedDropDownCategory),
            new SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                productDropDown(
                    textTitle: translate("Color"),
                    selectedItem: selectedColor,
                    dropDownItems: dropDownColors,
                    changedDropDownItems: changedDropDownColor),
                productDropDown(
                    textTitle: translate("Size"),
                    selectedItem: selectedSize,
                    dropDownItems: dropDownSizes,
                    changedDropDownItems: changedDropDownSize),
              ],
            ),
            new SizedBox(
              height: 20.0,
            ),
            appButton(
                btnTxt: translate("Add Product"),
                onBtnclicked: addNewProducts,
                btnPadding: 20.0,
                btnColor: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }

  void changedDropDownColor(String selectedSize) {
    setState(() {
      selectedColor = selectedSize;
    });
  }

  void changedDropDownCategory(String selectedSize) {
    setState(() {
      selectedCategory = selectedSize;
    });
  }

  void changedDropDownSize(String selected) {
    setState(() {
      selectedSize = selected;
    });
  }

  List<File> imageList;

  pickImage() async {
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      //imagesMap[imagesMap.length] = file;
      List<File> imageFile = new List();
      imageFile.add(file);
      //imageList = new List.from(imageFile);
      if (imageList == null) {
        imageList = new List.from(imageFile, growable: true);
      } else {
        for (int s = 0; s < imageFile.length; s++) {
          imageList.add(file);
        }
      }
      setState(() {});
    }
  }

  removeImage(int index) async {
    //imagesMap.remove(index);
    imageList.removeAt(index);
    setState(() {});
  }

  addNewProducts() {
    if (imageList == null || imageList.isEmpty) {
      showSnackBar( translate('FieldCanNotEmpty', args:{ 'field': translate('Product Images')}), scaffoldKey);
      return;
    }

    if (prodcutTitle.text == "") {
      showSnackBar(translate('FieldCanNotEmpty', args:{ 'field': translate('Product Title')}), scaffoldKey);
      return;
    }

    if (prodcutPrice.text == "") {
      showSnackBar(translate('FieldCanNotEmpty', args:{ 'field': translate('Product Price')}), scaffoldKey);
      return;
    }

    if (prodcutDesc.text == "") {
      showSnackBar(translate('FieldCanNotEmpty', args:{ 'field': translate('Product Description')}), scaffoldKey);
      return;
    }

    if (selectedCategory == translate("Select Product category") ){
      showSnackBar( translate("Please select a category"), scaffoldKey);
      return;
    }

    if (selectedColor == translate("Select a color") ) {
      showSnackBar( translate("Please select a color"), scaffoldKey);
      return;
    }

    if (selectedSize == translate("Select a size") ){
      showSnackBar( translate("Please select a size"), scaffoldKey);
      return;
    }
  }
}
