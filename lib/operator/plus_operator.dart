import 'package:orelang_dart/eval_result.dart';
import 'package:orelang_dart/expression/expression.dart';
import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/operator/operator.dart';

class PlusOperator implements IOperator {
  @override
  EvalResult call(Engine engine, List<IExpression> args) {
    if (args.length != 2) {
      throw Exception('足し算の項数は2個しかサポートしてないよ');
    }
    final evaluatedArgs = args.map((e) => e.eval(engine)).toList();
    final operationResult =
        evaluatedArgs[0].intValue! + evaluatedArgs[1].intValue!;
    return EvalResult.asInt(operationResult);
  }
}
