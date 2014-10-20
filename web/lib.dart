import 'dart:html';
import 'dart:async';

class A {
  foo() => 'foo';
}

class B {
  StreamController _controller = new StreamController();

  B(A a);

  foo() => _controller.stream;
}

class C extends B {
  C(A a) : super(a);

  foo() => querySelectorAll('div');
}
