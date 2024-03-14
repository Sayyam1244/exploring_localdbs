import 'package:exploring_localdbs/Src/Application/Services/isar_services.dart';
import 'package:exploring_localdbs/Src/Application/Services/sqflite_services.dart';
import 'package:flutter/material.dart';

import 'Src/Application/Services/hive_services.dart';
import 'Src/Presentation/Widgets/PhotosView/photos_view_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveServices().initHive();
  await SqliteServices().initSqlite();
  await IsarServices().izarInit();
  // await IsarServices().insertAllData();
  // await SqliteServices().insertAllData();

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
