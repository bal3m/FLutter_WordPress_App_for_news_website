import 'package:html/parser.dart';
class WakalaModel {
  String title;
  String img;

  WakalaModel.fromJson(obj) {
    this.title =parse(obj['title']['rendered'].toString()).documentElement.text;
    this.img = obj['jetpack_featured_media_url'];
  }

  static List<WakalaModel> fromJsonList(jsonList) {
    return jsonList.map<WakalaModel>((obj) => WakalaModel.fromJson(obj)).toList();
  }
}