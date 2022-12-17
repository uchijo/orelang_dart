import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/expression/expression.dart';
import 'package:orelang_dart/operator/operator.dart';

class CallOperator implements IExpression {
  final IOperator operator;
  final List<IExpression> args;

  CallOperator(this.operator, this.args);

  @override
  Object eval(Engine engine) => operator.call(engine, args);
}
