import 'dart:math';

import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/eval_result.dart';
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

  test('単体のboolを正しく評価できる', () {
    final result1 = Engine().eval(true);
    expect(result1.boolValue, true);
    final result2 = Engine().eval(false);
    expect(result2.boolValue, false);
  });

  test('whileに渡された評価式がfalseだった場合は何もしない', () {
    // 実行されたら終わらない。仮に終わっても .novalue は返らない
    final result = Engine().eval([
      'while',
      false,
      1,
    ]);
    expect(result.resultType, EvalResultType.novalue);
  });
  test('whileのテスト', () {
    final result = Engine().eval([
      'step',
      ['set', 'iter', 0],
      [
        'while',
        [
          '==',
          0,
          ['get', 'iter'],
        ],
        [
          'set',
          'iter',
          [
            '+',
            1,
            ['get', 'iter']
          ]
        ],
      ],
    ]);
    expect(result.intValue, 1);
  });

  test('lessが正しく評価されるか', () {
    final result = Engine().eval(['<', 10, 100]);
    expect(result.boolValue, true);
  });
  test('moreが正しく評価されるか', () {
    final result = Engine().eval(['>', 100, 10]);
    expect(result.boolValue, true);
  });

  test('andが正しく評価されるか', () {
    expect(Engine().eval(['and', true, true]).boolValue, true);
    expect(Engine().eval(['and', false, true]).boolValue, false);
    expect(Engine().eval(['and', true, false]).boolValue, false);
    expect(Engine().eval(['and', false, false]).boolValue, false);
  });
  test('orが正しく評価されるか', () {
    expect(Engine().eval(['or', true, true]).boolValue, true);
    expect(Engine().eval(['or', false, true]).boolValue, true);
    expect(Engine().eval(['or', true, false]).boolValue, true);
    expect(Engine().eval(['or', false, false]).boolValue, false);
  });

  test('ifの動作確認', () {
    expect(Engine().eval(['if', true, 1, 2]).intValue, 1);
    expect(Engine().eval(['if', false, 1, 2]).intValue, 2);
  });
}
