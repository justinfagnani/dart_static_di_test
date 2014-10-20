import 'lib.dart';

void main() {
  var container = new MapContainer();

  var a = container.getA();

  print("got an A: $a ${a.foo()}");

  var stopwatch = new Stopwatch();
  stopwatch.start();
  for (var i = 0; i < 10000; i++) {
    var a = container.getA();
    a.foo();
  }
  stopwatch.stop();
  print(stopwatch.elapsed);
}

class MapContainer {

  A _getA() => new A();

  B _getB() => new B(_getA());

  C _getC() => new C(_getA());

  A getA() => _getA();
}
