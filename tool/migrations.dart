import 'dart:async';
import 'package:embla_trestle/gateway.dart';

final migrations = [
  CreatePostsTableMigration
].toSet();

class CreatePostsTableMigration extends Migration {
  @override
  Future run(Gateway gateway) async {
    await gateway.create('posts', (schema) {
      schema.id();
      schema.timestamps();
      schema.string('title');
      schema.string('body');
    });
  }

  @override
  Future rollback(Gateway gateway) async {
    await gateway.drop('posts');
  }
}
