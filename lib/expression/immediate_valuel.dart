import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/eval_result.dart';
import 'package:orelang_dart/expression/expression.dart';

class ImmediateValue implements IExpression {
  final int value;

  ImmediateValue(this.value);

  @override
  EvalResult eval(Engine engine) => EvalResult.asInt(value);
}
