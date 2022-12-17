import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/operator/set_operator.dart';
import 'package:test/test.dart';

void main() {
  // 一応動かす前と動かした後に変数のプールをリセットする
  setUp(() {
    variables.clear();
  });
  tearDown(() {
    variables.clear();
  });

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
    final result = Engine().eval([
      '==',
      ['*', 21, 2],
      42
    ]);
    expect(result.boolValue!, true);
  });

  test('複数の計算を行える', () {
    final result = Engine().eval([
      'step',
      ['+', 1, 2],
      ['+', 1, 2],
      ['+', 1, 2],
      ['+', 9, 10],
    ]);
    expect(result.intValue, 19);
  });
  test('変数の代入、取り出しが可能', () {
    final result = Engine().eval([
      'step',
      ['set', 'hoge', 100],
      ['get', 'hoge'],
    ]);
    expect(result.intValue, 100);
  });
}
