import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../widgets/category_food_widgets/categorries_foodsitem_widget.dart';
import 'category_detail_view_model.dart';
class CategoryDetailView extends StatelessWidget {
  const CategoryDetailView({
    super.key,
    required this.viewModel,
  });

  final CategoryDetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) => Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.BackgroundColor,
          leading: Container(
            padding: EdgeInsets.all(12),
            child: SvgPicture.asset(
              "assets/svg/vector.svg",
              width: 30,
              height: 14,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Breakfast",
            style: TextStyle(
              color: AppColors.RedPinkMain,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            Row(
              children: [
                AppBarContainer(svg: "assets/svg/notification.svg"),
                SizedBox(
                  width: 5,
                ),
                AppBarContainer(svg: "assets/svg/search.svg"),
                SizedBox(width: 10),
              ],
            ), //Containerlar
          ],
          bottom: AppBarBottom(),
        ),
        backgroundColor: AppColors.BackgroundColor,
        body: GridView.builder(
            itemCount: viewModel.recipes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 159 / 226,
            ),
            itemBuilder: (context, index) {
              final recipe = viewModel.recipes[index];
              return CategoriesItem(
                image: recipe.image,
                title: recipe.title,
                desc: recipe.desc,
                time: recipe.time.toString(),
              );
            }),
        extendBody: true,
        bottomNavigationBar: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 281,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFFD5D69),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: SvgPicture.asset("assets/home.svg"),
                  onPressed: () {},
                ),
                SvgPicture.asset("assets/community.svg"),
                SvgPicture.asset("assets/categories.svg"),
                SvgPicture.asset("assets/profile.svg"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({super.key, required this.svg});

  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.Pink,
      ),
      child: Center(
        child: SvgPicture.asset(svg),
      ),
    );
  }
}

class AppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBottom({super.key});

  Size get preferredSize => Size(double.infinity, 39);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextItem(text: "Breakfast"),
          TextItem(text: "Lunch"),
          TextItem(text: "Dinner"),
          TextItem(text: "Vegan"),
        ],
      ),
    );
  }
}

class TextItem extends StatelessWidget {
  const TextItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.RedPinkMain,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    );
  }
}

class AppColors {
  static const Color BackgroundColor = Color(0xFF221D22);
  static const Color RedPinkMain = Color(0xFFFD5D69);
  static const Color Pink = Color(0xFFFFC6C9);
  static const Color TextsColor = Color(0xFF3E2823);
  static const Color RatingColor = Color(0xFFEC888D);
}
