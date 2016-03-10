import 'dart:async';
import 'dart:html';
import 'dart:convert' show JSON;
import 'package:pea_stack_sample/post.dart';

class PostsService {
  Future<List<Post>> all() async {
    final List<Map> maps = await HttpRequest.getString('/posts').then(JSON.decode);
    return maps.map(_makePost);
  }

  Post _makePost(Map map) {
    return new Post()
      ..apply(map);
  }
}
