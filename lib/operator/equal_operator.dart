import 'package:orelang_dart/expression/expression.dart';
import 'package:orelang_dart/eval_result.dart';
import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/operator/operator.dart';

class EqualOperator implements IOperator {
  @override
  EvalResult call(Engine engine, List<IExpression> args) {
    if (args.length != 2) {
      throw Exception('比較の演算子の引数は2個にしてください');
    }
    final evaluated = args.map((e) => e.eval(engine)).toList();
    return evaluated[0].when(
      whenInt: (p0) {
        final compResult = p0 == evaluated[1].intValue;
        return EvalResult.asBool(compResult);
      },
      whenBool: (p0) {
        final compResult = p0 == evaluated[1].boolValue;
        return EvalResult.asBool(compResult);
      },
    );
  }
}
