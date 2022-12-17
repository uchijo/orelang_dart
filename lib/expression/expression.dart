import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/eval_result.dart';

abstract class IExpression {
  EvalResult eval(Engine engine);
}
