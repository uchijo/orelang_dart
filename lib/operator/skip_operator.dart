import 'package:orelang_dart/expression/expression.dart';
import 'package:orelang_dart/eval_result.dart';
import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/operator/operator.dart';

class SkipOperator implements IOperator {
  @override
  EvalResult call(Engine engine, List<IExpression> args) {
    return EvalResult.noValue();
  }
}
