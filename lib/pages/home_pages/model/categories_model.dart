class CategoriesNewModel {
  final String categories;
  final String image;

  CategoriesNewModel({required this.image, required this.categories});
}

List<CategoriesNewModel> categoriesModel = [
  CategoriesNewModel(
      image:
          "https://www.nato.int/nato_static_fl2014/assets/pictures/images_mfu/2023/7/stock/230712-pc_rdax_775x440s.jpg",
      categories: "General"),
  CategoriesNewModel(
      image:
          "https://images.unsplash.com/photo-1603190287605-e6ade32fa852?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      categories: "Entertainment"),
  CategoriesNewModel(
      image:
          "https://st2.depositphotos.com/1907633/6292/i/600/depositphotos_62927779-stock-photo-smart-medical-doctor-hand-showing.jpg",
      categories: "Health"),
  CategoriesNewModel(
      image:
          "https://img.freepik.com/free-photo/sports-tools_53876-138077.jpg?w=2000&t=st=1710208775~exp=1710209375~hmac=3a2c816b63538eb4f2489681c710354598a3c0fdb3df46c3faddc8d4447db6c5",
      categories: "Sports"),
  CategoriesNewModel(
      image:
          "https://cloudinary.hbs.edu/hbsit/image/upload/s--O0PXWnT3--/f_auto,c_fill,h_375,w_750,/v20200101/BDD0688FF02068E5C427B0954F8A2297.jpg",
      categories: "Business"),
  CategoriesNewModel(
      image:
          "https://www.simplilearn.com/ice9/free_resources_article_thumb/Technology_Trends.jpg",
      categories: "Technology"),
];
