import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/expression/expression.dart';

final operators = <String, IOperator>{};

abstract class IOperator {
  Object call(Engine engine, List<IExpression> args);
}
