import 'dart:convert';

import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/orelang_dart.dart' as orelang_dart;

void main(List<String> arguments) {
  if (arguments.length != 1) {
    print('give me 1 argument, instead of ${arguments.length}');
    return;
  }
  final value = jsonDecode(arguments[0]);
  final result = Engine().eval(value);
  result.when(
    whenBool: (p0) => print('result: $p0'),
    whenInt: (p0) => print('result: $p0'),
    whenNoValue: () => print('result: novalue'),
  );
}
