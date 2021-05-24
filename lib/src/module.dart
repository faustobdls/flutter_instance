import 'package:flutter/material.dart';
import 'package:instance_instance/instance_instance.dart';

abstract class Module extends StatelessWidget {
  final Instance _instance = Instance();

  List<Inject> get injects;

  Widget builder(Instance instance);

  Module() {
    for (var inject in injects) {
      _instance.set(inject);
    }
  }

  @override
  Widget build(BuildContext context) {
    return builder(_instance);
  }
}
