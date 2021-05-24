import 'package:flutter_test/flutter_test.dart';
import 'package:instance_instance/instance_instance.dart';

class Controller {
  num value = 0;
  Controller() {
    print("CALL CONSTRUCTOR");
  }
}

main() {
  final instance = Instance();
  group("Inject Test", () {
    test("Inject Controller", () {
      instance.set(Inject((i) => Controller()));
      Controller controller = instance.get();
      controller.value = 5;
      expect(controller, isInstanceOf<Controller>());
      expect(controller.value, 5);
      controller = instance.get();
      expect(controller.value, 5);
      controller = instance.get();
      controller.value = 10;
      expect(controller.value, 10);
    });

    test("Inject Controller and Dispose", () {
      instance.set(Inject((i) => Controller()));
      Controller controller = instance.get();
      expect(controller, isInstanceOf<Controller>());
      instance.dispose<Controller>();
      try {
        instance.get<Controller>();
      } on InjectException catch (e) {
        expect(e, isInstanceOf<InjectException>());
        expect(e.message, "${controller.runtimeType} DONT FOUND");
      }
    });

    test("Inject Controller - singleton false", () {
      instance.set(Inject((i) => Controller(), singleton: false));
      Controller controller = instance.get();
      controller.value = 5;
      expect(controller, isInstanceOf<Controller>());
      expect(controller.value, 5);
      controller = instance.get();
      expect(controller.value, 0);
    });
  });
}
