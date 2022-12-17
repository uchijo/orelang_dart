import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/orelang_dart.dart' as orelang_dart;

void main(List<String> arguments) {
  final value = Engine().eval(1);
  print(value.toString());
}
