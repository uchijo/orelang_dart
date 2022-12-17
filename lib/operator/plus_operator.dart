import 'package:orelang_dart/expression/expression.dart';
import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/operator/operator.dart';

class PlusOperator implements IOperator {
  @override
  int call(Engine engine, List<IExpression> args) {
    final evaluatedArgs = args.map((e) => e.eval(engine));
    return evaluatedArgs.reduce((value, element) => value + element);
  }
}
