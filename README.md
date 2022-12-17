# Orelang implementation using dart

## about

implemented [orelang](https://qiita.com/shuetsu@github/items/ac21e597265d6bb906dc) with dart language.

## usage

```
dart run 'some program here'
```

## example

```
$ dart run bin/orelang_dart.dart '["+", 40, 2]'
result: 42
```

## value types

- integer
- bool
- novalue
  - something like null or nil in other language.

## supported features

- `>`, `<`, `==`, `+`, `*`, `and`, `or`
  - `[op, expression1, expression2]`
  - operators.
- `while`
  - `["while", condition, expression]`
  - evaluates expression while condition is true.
  - returns result of evaluation on last expression.
    - novalue is not counted as "last expression".
    - if there's no valid expression evaluation in while loop, it will return novalue.
- `set`
  - `["set", "identifier", expression]`
  - variable named identifier will be initialized with value expression. overwrite is allowed.
  - returns evaluated value of expression
- `get`
  - `["get", "identifier"]`
  - retrieves value of variable with the identifier.
- `step`
  - `["step", expression, ...]`
  - evaluates all given expressions.
  - returns result of evaluation on last expression.
    - novalue is not counted as "last expression".
    - if there's no valid expression evaluation in steps, it will return novalue.
- `if`
  - `["if", cond, on_true, on_false]`
- `skip`
  - `["skip"]`
  - doees nothing.
  - returns novalue.
