import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homework_buoi_4/model/meal.dart';
import 'package:homework_buoi_4/util/constant/constant.dart';

import '../widget/loading_screen.dart';

class DetailFoodScreen extends StatefulWidget {
  const DetailFoodScreen({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  State<DetailFoodScreen> createState() => _DetailFoodScreenState();
}

class _DetailFoodScreenState extends State<DetailFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImage(),
            buildTitle(context: context, title: StringConstant.ingredients),
            buildListIngredients(),
            buildTitle(context: context, title: StringConstant.steps),
            buildListSteps(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.star_border),
      ),
    );
  }

  Widget buildListIngredients() {
    return ListView.builder(
      itemCount: widget.meal.ingredients.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 5.0
        ),
        child: Text(" - ${widget.meal.ingredients[index]}"),
      ),
      shrinkWrap: true,
      primary: false, //disable scrolling
    );
  }

  Widget buildListSteps() {
    return ListView.builder(
      itemCount: widget.meal.steps.length,
      itemBuilder: (context, index) => ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.pink),
          child: Center(
              child: Text(
            "#${index + 1}",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.white),
          )),
        ),
        title: Text(widget.meal.steps[index]),
      ),
      shrinkWrap: true,
      primary: false, //disable scrolling
    );
  }

  Widget buildTitle({required BuildContext context, required String title}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget buildImage() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: CachedNetworkImage(
        imageUrl: widget.meal.imageUrl,
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider, fit: BoxFit.fitWidth)),
          );
        },
        placeholder: (context, url) => const LoadingScreen(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
