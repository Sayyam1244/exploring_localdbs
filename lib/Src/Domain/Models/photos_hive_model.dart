import 'package:hive/hive.dart';

part 'photos_hive_model.g.dart';

@HiveType(typeId: 1)
class PhotosHiveModel {
  @HiveField(1)
  final int? albumId;
  @HiveField(2)
  final int? id;
  @HiveField(3)
  final String? title;
  @HiveField(4)
  final String? url;
  @HiveField(5)
  final String? thumbnailUrl;

  PhotosHiveModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory PhotosHiveModel.fromJson(Map<String, dynamic> json) =>
      PhotosHiveModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
