import 'package:orelang_dart/engine.dart';

abstract class IExpression {
  Object eval(Engine engine);
}
