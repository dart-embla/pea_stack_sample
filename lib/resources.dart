import 'package:embla/http.dart';
import 'post_resource.dart';

final resources = [
  Route.all('posts/*', PostsController)
];
