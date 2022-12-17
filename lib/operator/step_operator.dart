import 'package:orelang_dart/expression/expression.dart';
import 'package:orelang_dart/eval_result.dart';
import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/operator/operator.dart';

class StepOperator implements IOperator {
  @override
  EvalResult call(Engine engine, List<IExpression> args) {
    if (args.isEmpty) {
      return EvalResult.noValue();
    }
    final result = args.map((e) => e.eval(engine)).toList();
    return result.last;
  }
}
