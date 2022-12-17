import 'package:orelang_dart/expression/expression.dart';
import 'package:orelang_dart/eval_result.dart';
import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/operator/operator.dart';

class LessOperator implements IOperator {
  @override
  EvalResult call(Engine engine, List<IExpression> args) {
    if (args.length != 2) {
      throw Exception('invalid args length in < operator');
    }

    final evaluated = args.map((e) => e.eval(engine)).toList();
    final result = evaluated[0].intValue! < evaluated[1].intValue!;
    return EvalResult.asBool(result);
  }
}
