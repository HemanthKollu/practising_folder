class SupportTicketModel {
  final String avatarChar;
  final String tokenId;
  final String schoolName;
  final String category;
  final String subCategory;
  final String date;
  final String descriptionJson;
  final String tokenNumber;
  final String iconColor;
  final String bgColor;

  SupportTicketModel({
    required this.avatarChar,
    required this.category,
    required this.date,
    required this.descriptionJson,
    required this.iconColor,
    required this.schoolName,
    required this.subCategory,
    required this.tokenId,
    required this.tokenNumber,
    required this.bgColor
  });
}