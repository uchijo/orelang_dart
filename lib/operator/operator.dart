import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/expression/expression.dart';
import 'package:orelang_dart/operator/multiply_operator.dart';
import 'package:orelang_dart/operator/plus_operator.dart';

final operators = <String, IOperator>{
  '+': PlusOperator(),
  '*': MultiplyOperator(),
};

abstract class IOperator {
  int call(Engine engine, List<IExpression> args);
}
