import 'dart:convert';

class MemeModel {
  final String id;
  final String name;
  final String url;
  final int width;
  final int height;
  final int boxCount;

  MemeModel(
      this.id, this.name, this.url, this.width, this.height, this.boxCount);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'width': width,
      'height': height,
      'boxCount': boxCount,
    };
  }

  factory MemeModel.fromMap(Map<String, dynamic> map) {
    return MemeModel(
      map['id']?.toString() ?? "",
      map['name'] ?? '',
      map['url'] ?? '',
      map['width']?.toInt() ?? 0,
      map['height']?.toInt() ?? 0,
      map['boxCount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MemeModel.fromJson(String source) =>
      MemeModel.fromMap(json.decode(source));
}
