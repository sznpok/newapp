import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/constant/constant.dart';
import 'package:newsapp/pages/home_pages/screen/news_screen.dart';

import '../../../constant/images.dart';
import '../../../utils/size.dart';
import '../model/categories_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discover',
          style: Theme.of(context).textTheme.displaySmall!,
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: categoriesModel.length,
        padding: EdgeInsets.all(SizeConfig.padding! * 0.03),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          childAspectRatio: 6 / 7,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsScreen(
                    categories: categoriesModel[index].categories,
                  ),
                ),
              );
            },
            child: Card(
              color: bgColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                SizeConfig.screenWidth! * 0.05,
              )),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(SizeConfig.screenWidth! * 0.05),
                        topRight:
                            Radius.circular(SizeConfig.screenWidth! * 0.05)),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: categoriesModel[index].image,
                      height: SizeConfig.screenHeight! * 0.15,
                      errorWidget: (context, string, _) {
                        return Image.asset(splashImage);
                      },
                      placeholder: (context, string) {
                        return Icon(
                          Icons.image,
                          size: SizeConfig.screenWidth! * 0.1,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.02,
                  ),
                  Text(
                    categoriesModel[index].categories,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: secondaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
