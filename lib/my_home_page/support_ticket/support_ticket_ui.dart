import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:practising_folder/my_home_page/support_ticket/support_ticket_model.dart';
import 'package:practising_folder/my_home_page/support_ticket/support_ticket_service.dart';

class SupportTicketUi extends StatefulWidget {
  const SupportTicketUi({super.key});

  @override
  State<SupportTicketUi> createState() => _SupportTicketUiState();
}

class _SupportTicketUiState extends State<SupportTicketUi> {
  final SupportTicketService _service = SupportTicketService();
  List<SupportTicketModel> ticketsList = [];

  @override
  void initState() {
    super.initState();
    ticketsList = _service.getSupportTicketsData;
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

    return RichText(maxLines: 3, overflow: TextOverflow.ellipsis,textAlign: TextAlign.start, text: TextSpan(children: textSpans, style: TextStyle(fontSize: 20)));
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

  Color getBgColor(String colorName) {
    switch (colorName.toLowerCase()) {
      case "#f6a192":
        return Color(0xFFf6a192);
      case "amber":
        return Colors.amber.shade800;
      default:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: ticketsList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Column(
                children: [
                  Container(
                    width: 600,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), offset: Offset(0, 4), blurRadius: 3)],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 600,
                              decoration: BoxDecoration(color: getBgColor(ticketsList[index].bgColor), borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                                        child: Padding(padding: const EdgeInsets.all(8.0), child: Text(ticketsList[index].avatarChar, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Text(ticketsList[index].tokenId, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white)),
                                    Text(" - ", style: TextStyle(fontSize: 24, color: Colors.white)),
                                    Expanded(
                                      child: Text(
                                        ticketsList[index].schoolName,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 250,
                                height: 140,
                                decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Text(ticketsList[index].category, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                      SizedBox(height: 10),
                                      Text(
                                        ticketsList[index].subCategory,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis, 
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                      SizedBox(height: 10),
                                      Text(ticketsList[index].date, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                children: [
                                  Container(
                                    width: 320,
                                    height: 90,
                                    decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
                                    child: SingleChildScrollView(child: Padding(padding: const EdgeInsets.only(left: 10, top: 10), child: buildStyledDescription(ticketsList[index].descriptionJson))),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(padding: const EdgeInsets.only(right: 120), child: Text(ticketsList[index].tokenNumber, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
                                      Icon(Icons.flag_sharp, color: getIconColor(ticketsList[index].iconColor), size: 40),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
