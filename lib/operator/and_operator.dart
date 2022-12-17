import 'package:orelang_dart/expression/expression.dart';
import 'package:orelang_dart/eval_result.dart';
import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/operator/operator.dart';

class AndOperator implements IOperator {
  @override
  EvalResult call(Engine engine, List<IExpression> args) {
    if (args.length != 2) {
      throw Exception('invalid args number in and operation.');
    }

    final evaluated = args.map((e) => e.eval(engine)).toList();
    final result = evaluated[0].boolValue! && evaluated[1].boolValue!;
    return EvalResult.asBool(result);
  }
}
