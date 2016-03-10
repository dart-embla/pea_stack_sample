import 'package:angular2/angular2.dart';
import 'package:pea_stack_sample/post.dart';
import '../posts_service.dart';

@Component(
  selector: 'pea-posts',
  templateUrl: 'posts.html',
  directives: const [NgFor]
)
class Posts {
  final PostsService service;
  final List<Post> posts = [];

  Posts(this.service) {
    service.all().then(posts.addAll);
  }
}
