import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_spark/screens/category/category_screen.dart';
import 'package:xlo_spark/stores/category_store.dart';
import 'package:xlo_spark/stores/page_store.dart';
import 'package:xlo_spark/stores/user_manager_store.dart';

import 'models/category.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(CategoryStore());
}

Future<void> initializeParse() async {
  await Parse().initialize('YHjKJgs0kP9DtALCCJ5WuzVeJrWPcsaXigJ00FwS',
      'https://parseapi.back4app.com/',
      clientKey: 'jDl6576t5v38PwcPdZhcV0cdM6SMVKWoHfFX4pnK',
      autoSendSessionId: true,
      debug: true,
      coreStore: await CoreStoreSharedPrefsImp.getInstance());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'XLO Spark',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.purple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: Colors.purple,
            appBarTheme: const AppBarTheme(elevation: 0, color: Colors.purple),
            textSelectionTheme:
                const TextSelectionThemeData(cursorColor: Colors.orange)),
        home: CategoryScreen(
            selected: Category(id: '*', description: 'Todas'), showAll: true));
  }
}
