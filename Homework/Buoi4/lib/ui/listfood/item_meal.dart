import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homework_buoi_4/util/constant/constant.dart';

import '../../model/meal.dart';
import '../widget/loading_screen.dart';

class ItemMeal extends StatelessWidget {
  const ItemMeal({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        RouteConstant.detailFoodScreenPath,
        arguments: meal
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: CachedNetworkImage(
                          imageUrl: meal.imageUrl,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fitWidth)),
                            );
                          },
                          placeholder: (context, url) => const LoadingScreen(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 10,
                        child: Container(
                          width: constraints.maxWidth * 0.7,
                          height: 100,
                          decoration:
                              BoxDecoration(color: Colors.black.withOpacity(0.6)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              meal.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoMealItem(
                        text: "${meal.duration} min", icon: Icons.access_alarm),
                    InfoMealItem(text: meal.complexity.name, icon: Icons.badge),
                    InfoMealItem(
                        text: meal.affordability.name, icon: Icons.attach_money)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InfoMealItem extends StatelessWidget {
  const InfoMealItem({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Icon(icon),
        ),
        Text(text)
      ],
    );
  }
}
