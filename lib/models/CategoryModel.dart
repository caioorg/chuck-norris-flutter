class CategoryModel {
  final List<String> categories;

  CategoryModel({this.categories});

  factory CategoryModel.fromJson(List<dynamic> json) {
    return CategoryModel(
      categories: json != null ? new List<String>.from(json) : null,
    );
  }

  List<dynamic> toJson() {
    List<dynamic> data = new List<String>();
    if(this.categories != null) {
      data = this.categories;
    }
    return data;
  }
}