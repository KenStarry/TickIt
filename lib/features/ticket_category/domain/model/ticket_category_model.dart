class TicketCategoryModel {
  final String categoryId;
  final String categoryTitle;
  final String categoryCoverUrl;
  final String categoryAsset;
  final int categoryAmount;

  const TicketCategoryModel({
    required this.categoryId,
    required this.categoryTitle,
    required this.categoryCoverUrl,
    required this.categoryAsset,
    required this.categoryAmount,
  });

  TicketCategoryModel copyWith({
    String? categoryId,
    String? categoryTitle,
    String? categoryCoverUrl,
    String? categoryAsset,
    int? categoryAmount,
  }) {
    return TicketCategoryModel(
      categoryId: categoryId ?? this.categoryId,
      categoryTitle: categoryTitle ?? this.categoryTitle,
      categoryCoverUrl: categoryCoverUrl ?? this.categoryCoverUrl,
      categoryAsset: categoryAsset ?? this.categoryAsset,
      categoryAmount: categoryAmount ?? this.categoryAmount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'categoryTitle': categoryTitle,
      'categoryCoverUrl': categoryCoverUrl,
      'categoryAsset': categoryAsset,
      'categoryAmount': categoryAmount,
    };
  }

  factory TicketCategoryModel.fromJson(Map<String, dynamic> json) {
    return TicketCategoryModel(
      categoryId: json['categoryId'] as String? ?? '',
      categoryTitle: json['categoryTitle'] as String? ?? 'Untitled category',
      categoryCoverUrl: json['categoryCoverUrl'] as String? ?? '',
      categoryAsset: json['categoryAsset'] as String? ?? '',
      categoryAmount: json['categoryAmount'] as int? ?? 0,
    );
  }

  @override
  String toString() {
    return 'categoryModel(categoryId: $categoryId, categoryTitle: $categoryTitle, categoryCoverUrl: $categoryCoverUrl, categoryAmount: $categoryAmount)';
  }
}
