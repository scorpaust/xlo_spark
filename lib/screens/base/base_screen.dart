import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_spark/screens/create/create_screen.dart';

import '../../stores/page_store.dart';
import '../home/home_screen.dart';

class BaseScreen extends StatefulWidget {
  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    super.initState();

    reaction<int>(
        (_) => pageStore.page, (page) => pageController.jumpToPage(page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        HomeScreen(),
        CreateScreen(),
        Container(color: Colors.green),
        Container(color: Colors.yellow),
        Container(color: Colors.purple),
        Container(color: Colors.brown),
      ],
    ));
  }
}
