import 'package:flutter_test/flutter_test.dart';
import 'package:instance_instance/instance_instance.dart';

class Repository {}

class Service {}

class Controller {
  late Repository repository;
  late Service service;
  Controller({required this.repository, required this.service});
}

main() {
  final instance = Instance();
  group("Inject Test", () {
    test("Inject Controller", () {
      instance.set(Inject((i) => Repository()));
      instance.set(Inject((i) => Service()));
      instance.set(Inject((i) => Controller(repository: i(), service: i())));
      expect(instance.get<Controller>().repository, isInstanceOf<Repository>());
    });
  });
}
