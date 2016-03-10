import 'package:embla_trestle/model.dart';

class Post extends Model {
  @field String title;
  @field String body;

  void apply(Map<String, dynamic> map) {
    title = map['title'] ?? title;
    body = map['body'] ?? body;
  }
}
