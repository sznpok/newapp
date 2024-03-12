import 'package:flutter/material.dart';

import '../../../utils/size.dart';
import '../../../widgets/news_tile.dart';
import '../model/categories_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: categoriesModel.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 4,
          childAspectRatio: 6 / 9,
          crossAxisCount: 4,
          crossAxisSpacing: 0,
          mainAxisSpacing: 1.3 * SizeConfig.screenHeight!,
        ),
        itemBuilder: (context, index) {
          return NewsTile();
        },
      ),
    );
  }
}
