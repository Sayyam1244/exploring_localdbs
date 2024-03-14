import 'package:exploring_localdbs/Src/Domain/Models/photos_hive_model.dart';
import 'package:isar/isar.dart';

part 'photos_isar_model.g.dart';

@collection
class PhotosIsarModel {
  Id id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotosIsarModel(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  factory PhotosIsarModel.fromJson(Map<String, dynamic> json) =>
      PhotosIsarModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  static PhotosHiveModel mapToHiveModel(PhotosIsarModel e) {
    return PhotosHiveModel(
      albumId: e.albumId,
      id: e.id,
      title: e.title,
      url: e.url,
      thumbnailUrl: e.thumbnailUrl,
    );
  }
}
