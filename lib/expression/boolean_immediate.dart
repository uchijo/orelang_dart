import 'package:orelang_dart/eval_result.dart';
import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/expression/expression.dart';

class BooleanImmediate implements IExpression {
  final bool value;

  BooleanImmediate(this.value);

  @override
  EvalResult eval(Engine engine) {
    return EvalResult.asBool(value);
  }
}
