import 'package:exploring_localdbs/Src/Application/Services/hive_services.dart';
import 'package:flutter/material.dart';

import 'Src/Presentation/Widgets/PhotosView/photos_view_screen.dart';

void main() async {
  await HiveServices().initHive();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PhotosViewScreen());
  }
}
