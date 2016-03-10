import 'dart:html';

import 'package:angular2/angular2.dart';
import 'package:pea_stack_sample/post.dart';
import '../services/posts_service.dart';

@Component(
  selector: 'pea-posts',
  templateUrl: 'posts.html',
  directives: const [NgFor]
)
class Posts {
  final PostsService service;
  final List<Post> posts = [];

  String newPostTitle;
  String newPostBody;

  Posts(this.service) {
    service.all().then(posts.addAll);
  }

  savePost(MouseEvent event) {
    service.create(newPostTitle, newPostBody).then(posts.add);

    newPostTitle = '';
    newPostBody = '';
  }
}
