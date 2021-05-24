
import 'package:instance_instance/instance_instance.dart';

import 'inject.dart';

class Instance {
  final _instances = <Type, Inject>{};

  /// Used for get instance
  B get<B>([B? type]) {
    if (B.toString() == "dynamic") {
      throw InjectException(message: "NOT ALLOW FOR DYNAMIC VALUES");
    }
    final _instance = _instances[B];
    if (_instance != null) {
      return _instance.value(this);
    } else {
      throw InjectException(message: "$B DONT FOUND");
    }
  }

  /// Used for get instance
  B call<B>() {
    return get<B>();
  }

  /// Used for add new Inject
  void set<T>(Inject<T> inject) {
    _instances.addAll({T: inject});
  }

  //Used for dispose specific instance
  void dispose<T>() {
    _instances.remove(T);
  }
}
