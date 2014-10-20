import 'lib.dart';

void main() {
  var container = new MapContainer();

  var a = container.get(A);

  print("got an A: $a ${a.foo()}");

  var stopwatch = new Stopwatch();
  stopwatch.start();
  for (var i = 0; i < 10000; i++) {
    var a = container.get(A);
    a.foo();
  }
  stopwatch.stop();
  print(stopwatch.elapsed);
}

class MapContainer {

  var bindings = {
    A: new Binding(() => new A(), []),
    B: new Binding((a) => new B(a), [A]),
    C: new Binding((a) => new C(a), [A]),
  };

  dynamic get(Type t) {
    var binding = bindings[t];
    var arguments = binding.keys.map(get).toList();
    var instance = Function.apply(binding.factory, arguments);
    return instance;
  }
}

class Binding {
  final Function factory;
  final List<Type> keys;
  Binding(this.factory, this.keys);
}
