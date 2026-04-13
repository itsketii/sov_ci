import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/page_09_view_model.dart';
import 'view_models/page_10_view_model.dart';
import 'view_models/page_11_view_model.dart';
import 'view_models/page_12_view_model.dart';
import 'views/page_01/page_01_view.dart';
// Note: Les imports de ta collègue sont conservés si besoin
// import 'views/page_09/page_09_view.dart';
// import 'views/page_10/page_10_view.dart';
// import 'views/page_11/page_11_view.dart';
// import 'views/page_12/page_12_view.dart';
// import 'screens/acceuil.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Page09ViewModel()),
        ChangeNotifierProvider(create: (_) => Page10ViewModel()),
        ChangeNotifierProvider(create: (_) => Page11ViewModel()),
        ChangeNotifierProvider(create: (_) => Page12ViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOV.CI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF6B2B)),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      // Le point d'entrée reste ton Splash Screen
      home: const Page01View(),
    );
  }
}
