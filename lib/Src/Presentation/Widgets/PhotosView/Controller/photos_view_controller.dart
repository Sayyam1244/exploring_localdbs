import 'package:exploring_localdbs/Src/Application/Services/hive_services.dart';
import 'package:exploring_localdbs/Src/Domain/HiveModels/photos_hive_model.dart';
import 'package:flutter/cupertino.dart';

class PhotosViewController {
  ValueNotifier<List<PhotosHiveModel>> hivePhotosData = ValueNotifier([]);

  getData() async {
    hivePhotosData.value =
        HiveServices().photosBox?.values.toList() as List<PhotosHiveModel>;
    hivePhotosData.notifyListeners();
  }
}
