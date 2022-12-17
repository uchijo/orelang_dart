import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/eval_result.dart';
import 'package:orelang_dart/expression/expression.dart';
import 'package:orelang_dart/operator/equal_operator.dart';
import 'package:orelang_dart/operator/get_operator.dart';
import 'package:orelang_dart/operator/multiply_operator.dart';
import 'package:orelang_dart/operator/plus_operator.dart';
import 'package:orelang_dart/operator/set_operator.dart';
import 'package:orelang_dart/operator/step_operator.dart';

final operators = <String, IOperator>{
  '+': PlusOperator(),
  '*': MultiplyOperator(),
  '==': EqualOperator(),
  'set': SetOperator(),
  'get': GetOperator(),
  'step': StepOperator(),
};

abstract class IOperator {
  EvalResult call(Engine engine, List<IExpression> args);
}
