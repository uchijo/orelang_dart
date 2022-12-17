import 'package:orelang_dart/eval_result.dart';
import 'package:orelang_dart/engine.dart';
import 'package:orelang_dart/expression/expression.dart';
import 'package:orelang_dart/expression/identifier.dart';
import 'package:orelang_dart/operator/operator.dart';

class SetOperator implements IOperator {
  @override
  EvalResult call(Engine engine, List<IExpression> args) {
    if (args.length != 2) {
      throw Exception(
        'invalid args length. 2 expected, but got ${args.length}',
      );
    }
    if (args[0] is! Identifier) {
      throw Exception('invalid identifier type detected.');
    }

    final evaluated = args[1].eval(engine);
    variables[(args[0] as Identifier).value] = evaluated;
    return evaluated;
  }
}

final variables = <String, EvalResult>{};
