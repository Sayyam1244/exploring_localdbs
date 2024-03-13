import 'package:exploring_localdbs/Src/Data/DataSource/Resources/dummy_data.dart';
import 'package:exploring_localdbs/Src/Domain/HiveModels/photos_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveServices {
  static final HiveServices _hiveServices = HiveServices._internal();

  factory HiveServices() => _hiveServices;

  HiveServices._internal();

  Box? photosBox;

  initHive() async {
    await Hive.initFlutter();
    //For deleting the box >
    // await Hive.deleteBoxFromDisk('photos');

    //
    Hive.registerAdapter(PhotosHiveModelAdapter());
    photosBox = await Hive.openBox<PhotosHiveModel>('photos');
    print("Is Hive Box opened: ${photosBox!.isOpen}");
    // await insertDummyData();
  }

  insertDummyData() async {
    for (final item in dummyData) {
      await photosBox!.put(item['id'], PhotosHiveModel.fromJson(item));
    }
    print("Finished Adding");
  }
}
