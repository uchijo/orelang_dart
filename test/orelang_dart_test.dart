import 'package:orelang_dart/engine.dart';
import 'package:test/test.dart';

void main() {
  test('単体の数字を正しく評価できる', () {
    final result = Engine().eval(1);
    expect(result, 1);
  });
  test('ネストなしの足し算ができる', () {
    final result = Engine().eval(['+', 40, 2]);
    expect(result, 42);
  });
  test('ネストありの足し算ができる', () {
    final result = Engine().eval(['+', ['+', 20, 20], 2]);
    expect(result, 42);
  });
}
