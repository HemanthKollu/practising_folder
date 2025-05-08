import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:practising_folder/my_home_page/category_card/category_model.dart';
import 'package:practising_folder/my_home_page/category_card/category_service.dart';

class CategoryUi extends StatefulWidget {
  const CategoryUi({super.key});

  @override
  State<CategoryUi> createState() => _CategoryUiState();
}

class _CategoryUiState extends State<CategoryUi> {
  final CategoryService _service = CategoryService();
  List<CategoryModel> _categoryItems = [];

  @override
  void initState() {
    super.initState();
    _categoryItems = _service.getCategoryData();
  }

  Widget buildStyledDescription(String descriptionJson) {
    final doc = quill.Document.fromJson(jsonDecode(descriptionJson));
    final textSpans = <TextSpan>[];

    for (final leaf in doc.toDelta().toList()) {
      if (leaf.value is String) {
        final attrs = leaf.attributes ?? {};
        // print(leaf.attributes);
        TextStyle style = const TextStyle();

        if (attrs.containsKey('bold')) {
          style = style.merge(const TextStyle(fontWeight: FontWeight.bold));
        }
        if (attrs.containsKey('italic')) {
          style = style.merge(const TextStyle(fontStyle: FontStyle.italic));
        }
        if (attrs.containsKey('underline')) {
          style = style.merge(const TextStyle(decoration: TextDecoration.underline));
        }
        if (attrs.containsKey('color')) {
          style = style.merge(TextStyle(color: getColorFromString(attrs['color'])));
        }

        textSpans.add(TextSpan(text: leaf.value, style: style));
      }
    }

    return SizedBox(height: 43, child: RichText(maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.start, text: TextSpan(children: textSpans, style: TextStyle(fontSize: 18))));
  }

  Color getColorFromString(String color) {
    switch (color) {
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      default:
        return Colors.black;
    }
  }

  Color getIconColor(String colorName) {
    switch (colorName.toLowerCase()) {
      case "red":
        return Colors.red;
      case "green":
        return Colors.greenAccent;
      case "pink":
        return Colors.pink;
      case "purple":
        return Colors.purple;
      default:
        return Colors.black;
    }
  }

  Color getIdColor(String colorName) {
    switch (colorName.toLowerCase()) {
      case "red":
        return Colors.red;
      case "brown":
        return Colors.brown;
      case "yellow":
        return Colors.green;
      case "blue":
        return Colors.blueAccent;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color bgPrimaryColor = Color(0xFFFFFFFF);
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: _categoryItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: getIdColor(_categoryItems[index].idColor), width: 8)),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(27), bottomLeft: Radius.circular(25)),
                    ),
                    child: Container(
                      width: 400,
                      decoration: BoxDecoration(
                        color: bgPrimaryColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: Color.fromARGB(51, 0, 0, 0), offset: Offset(0, 4), blurRadius: 2)],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(color: Color(0xFFe8812b)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                          child:
                                              _categoryItems[index].imageUrl != null && _categoryItems[index].imageUrl!.isNotEmpty
                                                  ? ClipRRect(borderRadius: BorderRadius.circular(25), child: Image.network(_categoryItems[index].imageUrl!, fit: BoxFit.cover, width: 25, height: 25))
                                                  : Center(child: Text("HA", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black), textAlign: TextAlign.center)),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 15),
                                        child:
                                            _categoryItems[index].id != null && _categoryItems[index].id!.isNotEmpty
                                                ? Text(
                                                  _categoryItems[index].id!.length > 5
                                                  ? '${_categoryItems[index].id!.substring(0, 5)}...'
                                                  : _categoryItems[index].id!,
                                                  textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
                                                : Container(),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 305,
                                          height: 33,
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60))),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              SizedBox(width: 10),
                                              Text(_categoryItems[index].phoneNumber, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                              SizedBox(width: 16),
                                              Icon(Icons.flag_sharp, size: 25, color: getIconColor(_categoryItems[index].iconColor)),
                                              SizedBox(width: 15),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15, right: 15),
                                      child: Text(
                                        _categoryItems[index].schoolName,
                                        textAlign: TextAlign.left,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 3, left: 15, right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildStyledDescription(_categoryItems[index].descriptionJson),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(_categoryItems[index].category, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                                          Text(" - "),
                                          SizedBox(
                                            width: 150,
                                            child: Text(_categoryItems[index].subCategory, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
                                          ),
                                        ],
                                      ),
                                      Text(_categoryItems[index].date, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
