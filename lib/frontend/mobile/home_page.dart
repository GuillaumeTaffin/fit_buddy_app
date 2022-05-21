import 'package:fit_buddy_app/frontend/components/helpers.dart';
import 'package:fit_buddy_app/frontend/components/pages.dart';
import 'package:fit_buddy_app/frontend/components/texts.dart';
import 'package:fit_buddy_app/frontend/mobile/settings_page.dart';
import 'package:fit_buddy_app/frontend/mobile/workouts_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Home',
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: Center(child: Title1(text: 'welcome to fit buddy !')),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomePageItem(
                image: 'images/healthy-lifestyle-border.png',
                label: 'workouts',
                goTo: () => goTo(context, const WorkoutsPage()),
              ),
              HomePageItem(
                image: 'images/settings.png',
                label: 'settings',
                goTo: () => goTo(context, const SettingsPage()),
              ),
            ].padItems(const EdgeInsets.all(16)),
          ),
        ],
      ),
    );
  }

  void goTo(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}

class HomePageItem extends StatelessWidget {
  final String image;
  final String label;
  final void Function()? goTo;

  const HomePageItem({Key? key, required this.image, required this.label, this.goTo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: goTo,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
