import 'package:orelang_dart/expression/expression.dart';
import 'package:orelang_dart/eval_result.dart';
import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/operator/operator.dart';

class WhileOperator implements IOperator {
  @override
  EvalResult call(Engine engine, List<IExpression> args) {
    var retval = EvalResult.noValue();
    while (args[0].eval(engine).boolValue!) {
      retval = args[1].eval(engine);
    }
    return retval;
  }
}
