
import 'package:instance_instance/instance_instance.dart';

import 'bind.dart';

class Inject<T> {
  T? _value;
  late Type type;
  late Bind<T> _bind;
  late bool singleton;

  T value(Instance i) {
    if (_value == null || singleton == false) {
      _init(i);
    }
    return _value!;
  }

  Inject(Bind<T> i, {this.singleton = true}) {
    _bind = i;
    type = T;
  }

  void _init(Instance i) {
    _value = _bind(i);
  }
}
