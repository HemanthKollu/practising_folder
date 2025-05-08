import 'dart:convert';

import 'package:practising_folder/my_home_page/support_ticket/support_ticket_model.dart';

class SupportTicketService {
  List<SupportTicketModel>get getSupportTicketsData{
    return [
      SupportTicketModel(
        avatarChar: "VA", 
        category: "Content", 
        date: "20/Apr", 
        descriptionJson: jsonEncode([
          {
            "insert":
                "Vel’s is a premium collection of curated content and tools designed to enhance your productivity and streamline your workflow. With user-friendly features and a sleek interface, Vel’s aims to deliver a seamless experience whether you're managing tasks, exploring ideas, or collaborating in real-time.\n",
            "attributes": {"bold": true},
          },
        ]), 
        iconColor: "red", 
        schoolName: "Vel's Vidhyalaya Senior Secondary School", 
        subCategory: "Login Issue", 
        tokenId: 'TOK04A', 
        tokenNumber: '920198-87801',
        bgColor: "#f6a192"),
      SupportTicketModel(
        avatarChar: "TB", 
        category: "Technology", 
        date: "20/Apr", 
        descriptionJson: jsonEncode([
          {
            "insert":
                "Vel’s is a premium collection of curated content and tools designed.\n",
            "attributes": {"italic": true},
          },
        ]), 
        iconColor: "pink", 
        schoolName: "ABCD School",
        subCategory: "Books Missing", 
        tokenId: 'TOK04B', 
        tokenNumber: '920198-87801',
        bgColor: "amber"
        ),
      SupportTicketModel(
        avatarChar: "AB", 
        category: "Design",
        date: "20/Apr", 
        descriptionJson: jsonEncode([
          {
            "insert":
                "Vel’s is a premium collection.\n",
            "attributes": {"color": "red"},
          },
        ]),
        iconColor: "purple", 
        schoolName: "A B C D F G H I J K L M N O P Q R S T U V W X Y Z School", 
        subCategory: "Tools Usage Report Data Issue", 
        tokenId: 'TOK04C', 
        tokenNumber: '920198-87801',
        bgColor: "amber"),
      SupportTicketModel(
        avatarChar: "DC", 
        category: "Office", 
        date: "20/Apr", 
        descriptionJson: jsonEncode([
          {
            "insert":
                "Vel’s is a premium collection of curated content and tools designed to enhance your productivity and streamline your workflow. With user-friendly features and a sleek interface, Vel’s aims to deliver a seamless experience whether you're managing tasks, exploring ideas, or collaborating in real-time.\n",
            "attributes": {"underline": true,},
          },
        ]), 
        iconColor: "green", 
        schoolName: "Vel's Vidhyalaya Senior Secondary School", 
        subCategory: "Materials Not Opening", 
        tokenId: 'TOK04D', 
        tokenNumber: '920198-87801',
        bgColor: "amber"
        )

    ];
  }
}