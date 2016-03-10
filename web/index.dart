import 'package:angular2/bootstrap.dart';
import 'package:angular2/angular2.dart' show provide;
import 'components/app.dart';
import 'services/posts_service.dart';

main() {
  bootstrap(App, [
    provide(PostsService, useValue: new PostsService())
  ]);
}
