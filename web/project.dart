import 'package:polymer/polymer.dart' show initPolymer;
import 'package:angular/angular.dart' show ngBootstrap;
import 'package:angular_node_bind/angular_node_bind.dart' show NodeBindModule;

void main() {
  initPolymer().run(() {
    ngBootstrap(module: new NodeBindModule());
  });
}