import 'package:orelang_dart/expression/expression.dart';
import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/operator/operator.dart';

class MultiplyOperator implements IOperator {
  @override
  int call(Engine engine, List<IExpression> args) {
    if (args.length != 2) {
      throw Exception('掛け算の項の数は2個までです。');
    }
    final evaluated = args.map((e) => e.eval(engine)).toList();
    return evaluated[0] * evaluated[1];
  }
}
