import 'dart:async';

import 'package:embla/http.dart';
import 'package:embla/http_annotations.dart' as http;
import 'package:embla/http_basic_middleware.dart';
import 'package:embla_trestle/embla_trestle.dart';
import 'post.dart';

class PostsController extends Controller {
  final Repository<Post> posts;

  PostsController(this.posts);

  @http.Get() index() {
    return posts.all();
  }

  @http.Get(':id') show({int id}) {
    return _findById(id);
  }

  @http.Post('') store(Input input) async {
    final post = new Post()
      ..apply(input.body);

    await posts.save(post);

    return post;
  }

  @http.Put(':id') update(Input input, {int id}) async {
    final post = (await _findById(id))
      ..apply(input.body);

    await posts.save(post);

    return post;
  }

  @http.Delete(':id') delete({int id}) async {
    final post = await _findById(id);

    await posts.delete(post);

    return { 'message': 'OK' };
  }

  Future<Post> _findById(int id) async {
    if (id == null) {
      abortBadRequest({ 'message': 'The id must be numeric' });
    }

    try {
      return await posts.find(id);
    } on StateError {
      abortNotFound({ 'message': 'No post has an id of $id' });
    }
  }
}
