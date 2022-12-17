import 'package:orelang_dart/eval_result.dart';
import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/expression/expression.dart';

class Identifier implements IExpression {
  final String value;

  Identifier(this.value);

  @override
  EvalResult eval(Engine engine) {
    return EvalResult.noValue();
  }
}
