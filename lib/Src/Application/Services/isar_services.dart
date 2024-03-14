import 'package:exploring_localdbs/Src/Data/DataSource/Resources/dummy_data.dart';
import 'package:exploring_localdbs/Src/Domain/Models/photos_isar_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarServices {
  static final IsarServices _isarServices = IsarServices._internal();

  factory IsarServices() => _isarServices;

  IsarServices._internal();

  Isar? izarPhotos;

  Future izarInit() async {
    final dir = await getApplicationDocumentsDirectory();

    izarPhotos = await Isar.open(
      [PhotosIsarModelSchema],
      directory: dir.path,
    );
  }

  Future insertAllData() async {
    await izarPhotos!.writeTxn(() async {
      await izarPhotos!.photosIsarModels
          .putAll(dummyData.map((e) => PhotosIsarModel.fromJson(e)).toList());
    });
  }
}
