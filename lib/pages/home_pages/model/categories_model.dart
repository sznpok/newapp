class CategoriesNewModel {
  final String categories;
  final String image;

  CategoriesNewModel({required this.image, required this.categories});
}

List<CategoriesNewModel> categoriesModel = [
  CategoriesNewModel(image: "", categories: "General"),
  CategoriesNewModel(image: "", categories: "Entertainment"),
  CategoriesNewModel(image: "", categories: "Health"),
  CategoriesNewModel(image: "", categories: "Sports"),
  CategoriesNewModel(image: "", categories: "Business"),
  CategoriesNewModel(image: "", categories: "Technology"),
];
