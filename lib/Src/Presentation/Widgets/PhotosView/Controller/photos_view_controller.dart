import 'package:exploring_localdbs/Src/Application/Services/hive_services.dart';
import 'package:exploring_localdbs/Src/Application/Services/isar_services.dart';
import 'package:exploring_localdbs/Src/Application/Services/sqflite_services.dart';
import 'package:exploring_localdbs/Src/Domain/Models/photos_hive_model.dart';
import 'package:exploring_localdbs/Src/Domain/Models/photos_isar_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';

class PhotosViewController {
  ValueNotifier<List<PhotosHiveModel>> photosData = ValueNotifier([]);

  getData({required String fromWhere}) async {
    switch (fromWhere) {
      case 'hive':
        {
          Stopwatch stopwatch = Stopwatch()..start();
          print('hive');
          photosData.value = HiveServices().photosBox?.values.toList()
              as List<PhotosHiveModel>;
          photosData.notifyListeners();
          print('Execution took: ${stopwatch.elapsed.inMilliseconds}ms');
        }

      case 'sqlite':
        {
          Stopwatch stopwatch = Stopwatch()..start();
          print('sqlite');
          SqliteServices().getAllData().then(
            (value) {
              photosData.value =
                  value.map((e) => PhotosHiveModel.fromJson(e)).toList();
              photosData.notifyListeners();
            },
          );
          print('Execution took: ${stopwatch.elapsed.inMilliseconds}ms');
        }
      case 'isar':
        {
          Stopwatch stopwatch = Stopwatch()..start();

          print('isar');
          List<PhotosIsarModel> ls = await IsarServices()
              .izarPhotos!
              .photosIsarModels
              .where()
              .findAll();
          photosData.value =
              ls.map((e) => PhotosIsarModel.mapToHiveModel(e)).toList();
          photosData.notifyListeners();
          print('Execution took: ${stopwatch.elapsed.inMilliseconds}ms');
        }
    }
  }

  void clearPreviousData() {
    photosData.value.clear();
    photosData.notifyListeners();
  }
}
