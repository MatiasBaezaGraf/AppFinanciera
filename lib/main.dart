import 'package:api_test/providers/enterprise_provider.dart';
import 'package:api_test/providers/variation_provider.dart';
import 'package:api_test/screens/ipc_screen.dart';
import 'package:api_test/screens/data_screen.dart';
import 'package:api_test/screens/variation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black12, // transparent status bar
  ));
  runApp(AppState());
}

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => EnterpriseProvider(),),
        ChangeNotifierProvider(create: ( _ ) => VariationProvider(),),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Ipc Argentina',
      initialRoute: 'chart',
      routes: {
        //'variation' : (_) => VariationChartScreen(),
        'chart' : (_) => ChartScreen(),
        'data' : (_) => DataScreen(),
        'variation' : (_) => VariationScreen(),
      }
    );
  }
}