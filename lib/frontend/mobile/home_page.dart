import 'package:fit_buddy_app/frontend/components/helpers.dart';
import 'package:fit_buddy_app/frontend/components/texts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 100.0),
              child: Center(child: Title1(text: 'welcome to fit buddy !')),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                HomePageItem(image: 'images/healthy-lifestyle-border.png', label: 'trainings'),
                HomePageItem(image: 'images/settings.png', label: 'settings'),
              ].padItems(const EdgeInsets.all(16)),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageItem extends StatelessWidget {
  final String image;
  final String label;

  const HomePageItem({Key? key, required this.image, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            width: 60,
          ),
          Title1(text: label)
        ].padItems(const EdgeInsets.symmetric(horizontal: 8)),
      ),
    );
  }
}
