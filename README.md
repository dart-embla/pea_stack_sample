# The PEA Stack!

**P**ostgres, **E**mbla, **A**ngular

* [Install VirtualBox](https://www.virtualbox.org/)
* [Install Vagrant](https://docs.vagrantup.com/v2/)

```shell
# Start up the VM and sync
> vagrant up && vagrant rsync-auto

# Create a new tab and SSH into the VM
> vagrant ssh

# Inside the VM, navigate to shared directory
> cd /project

# First time, get dependencies and migrate the database
> pub get
> grind migrate

# For development
> ./run-dev

# For production
> ./run-prod

# Or you can manually configure/run the production server
> pub build
> dart bin/server.dart
```

### About this build
* Postgres
* Embla
* Angular

PostgreSQL is a popular SQL database. It is being accessed via the
[Trestle ORM](https://pub.dartlang.org/packages/trestle).

[Embla](https://embla.io) adds a RESTful API to access a `Post` resource in the DB.
Endpoints not associated with the API is forwarded to Pub in development mode.

Pub compiles [Angular](https://pub.dartlang.org/packages/angular2), the front end
framework, which uses the API exposed by Embla.

[Sass](http://sass-lang.com/) is also included in the build, compiled via a
[Pub transformer](https://pub.dartlang.org/packages/sass).

Since both Sass and Postgres needs to be installed on your machine to work in Dart,
the build also includes a [Vagrantfile](https://www.vagrantup.com/).
