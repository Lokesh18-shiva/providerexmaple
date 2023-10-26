import 'package:flutter/material.dart';

import 'appetizerspage.dart';
import 'chocolates2page.dart';
import 'dessertpage.dart';
import 'maincourse.dart';
import 'mealforonepage.dart';

void main() {
  runApp(const MaterialApp(home:  HomePages()));
  
}

class HomePages extends StatelessWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppetizersPage(),
              MainCoursePage(),
              MealForOnePage(),
              ChocolatesPage2(),
              Dessertpage(),
            ],
          ),
        ),
      ),
    );
  }
}
