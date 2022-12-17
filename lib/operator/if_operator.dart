import 'package:orelang_dart/expression/expression.dart';
import 'package:orelang_dart/eval_result.dart';
import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/operator/operator.dart';

class IfOperator implements IOperator {
  @override
  EvalResult call(Engine engine, List<IExpression> args) {
    if (args.length != 3) {
      throw Exception(
        'invalid number of arguments in if operation. 3 expected.',
      );
    }

    final evaluated = args.map((e) => e.eval(engine)).toList();
    if (evaluated[0].boolValue == true) {
      return evaluated[1];
    } else {
      return evaluated[2];
    }
  }
}
