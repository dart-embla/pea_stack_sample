import 'package:grinder/grinder.dart';
import 'package:embla_trestle/gateway.dart';
import '../bin/server.dart';
import 'migrations.dart';

main(args) => grind(args);

final gateway = new Gateway(driver);

@DefaultTask()
migrate() async {
  await gateway.connect();
  await gateway.migrate(migrations);
  await gateway.disconnect();
}

@Task()
rollback() async {
  await gateway.connect();
  await gateway.rollback(migrations);
  await gateway.disconnect();
}
