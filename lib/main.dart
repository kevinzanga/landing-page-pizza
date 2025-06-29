import 'package:flutter/material.dart';
import 'package:landing_page_pizza/pages/home_page.dart';
import 'core/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Necesario para operaciones async en main()
  await Hive.initFlutter(); // Inicializa Hive (compatible con Flutter Web)
  await Hive.openBox('contactos'); // Crea o abre la box (base de datos)

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PizzArt',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
