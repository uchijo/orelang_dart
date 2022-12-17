import 'package:orelang_dart/expression/expression.dart';
import 'package:orelang_dart/eval_result.dart';
import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/expression/identifier.dart';
import 'package:orelang_dart/operator/operator.dart';
import 'package:orelang_dart/operator/set_operator.dart';

class GetOperator implements IOperator {
  @override
  EvalResult call(Engine engine, List<IExpression> args) {
    if (args.length != 1) {
      throw Exception('invalid args number');
    }
    if (args[0] is! Identifier) {
      throw Exception('invalid identifier type');
    }

    try {
      final data = variables[(args[0] as Identifier).value];
      return data!;
    } on Exception catch (_) {
      throw Exception('there is no variable named ${args[0]}');
    }
  }
}
