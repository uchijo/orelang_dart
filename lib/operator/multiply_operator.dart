import 'package:orelang_dart/eval_result.dart';
import 'package:orelang_dart/expression/expression.dart';
import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/operator/operator.dart';

class MultiplyOperator implements IOperator {
  @override
  EvalResult call(Engine engine, List<IExpression> args) {
    if (args.length != 2) {
      throw Exception('掛け算の項の数は2個までです。');
    }
    final evaluated = args.map((e) => e.eval(engine)).toList();
    final operationResult = evaluated[0].intValue! * evaluated[1].intValue!;
    return EvalResult.asInt(operationResult);
  }
}
