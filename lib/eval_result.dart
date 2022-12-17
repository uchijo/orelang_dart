class EvalResult {
  final int? intValue;
  final bool? boolValue;
  final EvalResultType resultType;

  EvalResult(this.intValue, this.boolValue, this.resultType);
  factory EvalResult.asInt(int value) {
    return EvalResult(value, null, EvalResultType.integer);
  }
  factory EvalResult.asBool(bool value) {
    return EvalResult(null, value, EvalResultType.boolean);
  }
  factory EvalResult.noValue() {
    return EvalResult(null, null, EvalResultType.novalue);
  }

  T when<T>({
    T Function(int)? whenInt,
    T Function(bool)? whenBool,
    T Function()? whenNoValue,
  }) {
    switch (resultType) {
      case EvalResultType.integer:
        return whenInt!.call(intValue!);
      case EvalResultType.boolean:
        return whenBool!.call(boolValue!);
      case EvalResultType.novalue:
        return whenNoValue!.call();
    }
  }
}

enum EvalResultType {
  integer,
  boolean,
  novalue,
}
