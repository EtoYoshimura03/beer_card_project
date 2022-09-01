import 'package:beer_card_project/presentation/app_color.dart';
import 'package:beer_card_project/presentation/images.dart';
import 'package:beer_card_project/presentation/app_text.dart';
import 'package:beer_card_project/presentation/widgets/cards_widget.dart';
import 'package:beer_card_project/presentation/widgets/favorite_beer_widget.dart';
import 'package:flutter/material.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({Key? key}) : super(key: key);

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  int _currentIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    _MainPageImage(),
    CardsWidget(),
    FavoriteBeerWidget()
  ];

  void _onSelectTab(int index) {
    if (_currentIndex == index) return;
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: TextForBeer(
            text: 'Пивные карты',
            fontSize: 24,
            color: AppColor.textColor,
            maxLines: 1),
      )),
      body: _widgetOptions[_currentIndex],
      backgroundColor: AppColor.mainColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 25), label: 'Домой'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.sports_bar_outlined,
                size: 25,
              ),
              label: 'Налить пивка'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline_sharp,
                size: 25,
              ),
              label: 'Избранное')
        ],
        onTap: _onSelectTab,
      ),
    );
  }
}

class _MainPageImage extends StatelessWidget {
  const _MainPageImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      height: double.infinity,
      image: BeerImages.beerCult,
      fit: BoxFit.fill,
    );
  }
}
