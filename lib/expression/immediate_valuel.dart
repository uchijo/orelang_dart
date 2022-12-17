import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/expression/expression.dart';

class ImmediateValue implements IExpression {
  final int value;

  ImmediateValue(this.value);

  @override
  int eval(Engine engine) => value;
}
