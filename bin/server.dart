import 'package:embla/http.dart';
import 'package:embla/http_basic_middleware.dart';
import 'package:embla_trestle/embla_trestle.dart';
import 'package:pea_stack_sample/resources.dart';
import 'package:trestle/gateway.dart';

export 'package:embla/bootstrap.dart';

final driver = new PostgresqlDriver(
  database: 'postgres',
  username: 'postgres',
  password: 'password' // Password is set in the Vagrantfile
);

get embla => [
  new DatabaseBootstrapper(
    driver: driver
  ),

  new HttpBootstrapper(
    // The localhost virtual host (127.0.0.1) is not accessible
    // outside the current machine, and since we want to access
    // the app from outside the Vagrant VM, we bind to 0.0.0.0 instead.
    host: '0.0.0.0',

    pipeline: pipe(
      basicMiddleware,

      resources,

      PubMiddleware
    )
  )
];
