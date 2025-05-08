import 'dart:convert';

import 'package:practising_folder/my_home_page/category_card/category_model.dart';

class CategoryService {
  List<CategoryModel> getCategoryData() {
    return [
      CategoryModel(
        id: 'TOK04A',
        schoolName: "Vel's Vidhyalaya Senior Secondary School",
        iconColor: "red",
        descriptionJson: jsonEncode([
          {
            "insert":
                "Vel’s is a premium collection of curated content and tools designed to enhance your productivity and streamline your workflow. With user-friendly features and a sleek interface, Vel’s aims to deliver a seamless experience whether you're managing tasks, exploring ideas, or collaborating in real-time.\n",
            "attributes": {"bold": true},
          },
        ]),
        date: '20/Apr',
        phoneNumber: '920198-87801',
        idColor: "red",
        bgColor: "#f6a192",
        category: "Content",
        subCategory: "Login Issue",
        imageUrl: "https://avatar.iran.liara.run/public/boy"
      ),
      CategoryModel(
        id: 'TOK04B',
        schoolName: "ABCD School",
        iconColor: "pink",
        descriptionJson: jsonEncode([
          {
            "insert":
                "Vel’s is a premium collection of curated content and tools designed.\n",
            "attributes": {"italic": true},
          },
        ]),
        date: '20/Apr',
        phoneNumber: '920198-87801',
        idColor: "blue",
        bgColor: "amber",
        category: "Technology",
        subCategory: "Books Missing",
        imageUrl: "https://avatar.iran.liara.run/public/boy"
      ),
      CategoryModel(
        id: 'TOK04C',
        schoolName: "A B C D F G H I J K L M N O P Q R S T U V W X Y Z School",
        iconColor: "purple",
        descriptionJson: jsonEncode([
          {
            "insert":
                "Vel’s is a premium collection.\n",
            "attributes": {"color": "red"},
          },
        ]),
        date: '20/Apr',
        phoneNumber: '920198-87801',
        idColor: "yellow",
        bgColor: "amber",
        category: "Design",
        subCategory: "Tools Usage Report Data Issue"
      ),
      CategoryModel(
        id: 'TOK04D',
        schoolName: "Vel's Vidhyalaya Senior Secondary School",
        iconColor: "green",
        descriptionJson: jsonEncode([
          {
            "insert":
                "Vel’s is a premium collection of curated content and tools designed to enhance your productivity and streamline your workflow. With user-friendly features and a sleek interface, Vel’s aims to deliver a seamless experience whether you're managing tasks, exploring ideas, or collaborating in real-time.\n",
            "attributes": {"underline": true, "bold": true},
          },
        ]),
        date: '20/Apr',
        phoneNumber: '920198-87801',
        idColor: "brown",
        bgColor: "amber",
        category: "Office",
        subCategory: "Materials Not Opening",
        imageUrl: "https://avatar.iran.liara.run/public/boy"

      ),
      CategoryModel(
        id: 'TOK04B',
        schoolName: "ABCD School",
        iconColor: "pink",
        descriptionJson: jsonEncode([
          {
            "insert":
                "Vel’s is a premium collection of curated content and tools designed.\n",
            "attributes": {"italic": true},
          },
        ]),
        date: '20/Apr',
        phoneNumber: '920198-87801',
        idColor: "blue",
        bgColor: "amber",
        category: "Technology",
        subCategory: "Books Missing"

      ),
      CategoryModel(
        id: 'TOK04B',
        schoolName: "ABCD School",
        iconColor: "pink",
        descriptionJson: jsonEncode([
          {
            "insert":
                "Vel’s is a premium collection of curated content and tools designed.\n",
            "attributes": {"italic": true},
          },
        ]),
        date: '20/Apr',
        phoneNumber: '920198-87801',
        idColor: "blue",
        bgColor: "amber",
        category: "Technology",
        subCategory: "Books Missing",
        imageUrl: "https://avatar.iran.liara.run/public/boy"

      ),
      CategoryModel(
        id: 'TOK04B',
        schoolName: "ABCD School",
        iconColor: "pink",
        descriptionJson: jsonEncode([
          {
            "insert":
                "Vel’s is a premium collection of curated content and tools designed.\n",
            "attributes": {"italic": true},
          },
        ]),
        date: '20/Apr',
        phoneNumber: '920198-87801',
        idColor: "blue",
        bgColor: "amber",
        category: "Technology",
        subCategory: "Books Missing",
        imageUrl: "https://avatar.iran.liara.run/public/boy"

      ),
    ];
  }
}
