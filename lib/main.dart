import 'package:beer_card_project/data/datasource/app_dependencies.dart';
import 'package:beer_card_project/presentation/app_color.dart';
import 'package:beer_card_project/presentation/app_text.dart';
import 'package:beer_card_project/presentation/widgets/cards_widget.dart';
import 'package:beer_card_project/presentation/widgets/main_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  AppDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: AppColor.mainColor),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedLabelStyle: textStyle(16, AppColor.textColor),
              unselectedLabelStyle: textStyle(14, Colors.black),
              backgroundColor: AppColor.mainColor,
              selectedItemColor: AppColor.textColor,
              unselectedItemColor: Colors.black)),
      routes: {
        '/main_page_widget': (context) => const MainPageWidget(),
        '/cards_widget': (context) => const CardsWidget(),
      },
      initialRoute: '/main_page_widget',
    );
  }
}
