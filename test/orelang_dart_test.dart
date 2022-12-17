import 'dart:math';

import 'package:orelang_dart/engine.dart';
import 'package:test/test.dart';

void main() {
  test('単体の数字を正しく評価できる', () {
    final result = Engine().eval(1);
    expect(result.intValue!, 1);
  });
  test('ネストなしの足し算ができる', () {
    final result = Engine().eval(['+', 40, 2]);
    expect(result.intValue!, 42);
  });
  test('ネストありの足し算ができる', () {
    final result = Engine().eval([
      '+',
      ['+', 20, 20],
      2
    ]);
    expect(result.intValue!, 42);
  });
  test('足し算の項の数が誤ってたら例外を投げる', () {
    expect(() => Engine().eval(['+', 2]), throwsA(TypeMatcher<Exception>()));
  });

  test('掛け算の項の数が誤ってたら例外を投げる', () {
    expect(() => Engine().eval(['*', 2]), throwsA(TypeMatcher<Exception>()));
  });
  test('ネストなしの掛け算ができる', () {
    final result = Engine().eval(['*', 21, 2]);
    expect(result.intValue!, 42);
  });
  test('ネストありの掛け算ができる', () {
    final result = Engine().eval([
      '*',
      2,
      ['*', 3, 7]
    ]);
    expect(result.intValue!, 42);
  });

  test('数字どうしの比較ができる', () {
    final result = Engine().eval(['==', 42, 42]);
    expect(result.boolValue!, true);
  });
  test('ネストされた数字どうしの比較ができる', () {
    final result = Engine().eval(['==', ['*', 21, 2], 42]);
    expect(result.boolValue!, true);
  });
}
