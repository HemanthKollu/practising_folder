
class CategoryModel {
  final String? id;
  final String schoolName;
  final String descriptionJson;
  final String date;
  final String phoneNumber;
  final String iconColor;
  final String idColor;
  final String bgColor;
  final String category;
  final String subCategory;
  final String? imageUrl;

  CategoryModel({
    this.id,
    required this.schoolName,
    required this.descriptionJson,
    required this.date,
    required this.phoneNumber,
    required this.iconColor,
    required this.idColor,
    required this.bgColor,
    required this.category,
    required this.subCategory,
    this.imageUrl,
  });
}