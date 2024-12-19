import 'package:flutter/material.dart';
import 'package:frontend_idemusistemsinergi/website/widget/featured_products.dart';
import 'package:frontend_idemusistemsinergi/website/widget/header_section.dart';
import 'package:frontend_idemusistemsinergi/website/widget/hero_section.dart';
import 'package:frontend_idemusistemsinergi/website/widget/nav_bar.dart';
import 'package:frontend_idemusistemsinergi/website/widget/top_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 42),
              child: Column(
                children: [
                  HeaderSection(),
                  NavBar(),
                ],
              ),
            ),
            HeroSection(),
            FeaturedProducts(),
          ],
        ),
      ),
    );
  }
}
