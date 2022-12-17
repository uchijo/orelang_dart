import 'package:orelang_dart/expression/call_operator.dart';
import 'package:orelang_dart/expression/expression.dart';
import 'package:orelang_dart/expression/immediate_valuel.dart';
import 'package:orelang_dart/operator/operator.dart';

class Engine {
  int eval(Object script) {
    return getExpression(script).eval(this);
  }

  IExpression getExpression(Object script) {
    if (script is int) {
      return ImmediateValue(script);
    }
    if (script is List) {
      final operatorName = script[0] as String;
      final operator = operators[operatorName]!;
      final args = (script as List<IExpression>).sublist(1);
      return CallOperator(
        operator,
        args,
      );
    }
    throw Exception('parse error occurred.');
  }
}
