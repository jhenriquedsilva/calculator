import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorPresenter extends Cubit<CalculatorState> {
  CalculatorPresenter() : super(CalculatorState(0));

  Future<void> setOperand(final int operand) async {
    if (state.left == null) {
      state.left = operand;
      return;
    }

    state.right = operand;
  }

  Future<void> setOperation(final Operation operation) async {
    state.operation = operation;
  }

  Future<void> makeOperation() async {
    if (state.left == null || state.right == null) {
      return;
    }

    if (state.operation == Operation.sum) {
      _add();
    } else if (state.operation == Operation.sub) {
      _subtract();
    } else if (state.operation == Operation.mul) {
      _multiply();
    }
  }

  Future<void> _add() async {
    final result = state.left! + state.right!;
    final newState = CalculatorState(result);
    _reset(newState);
    emit(newState);
  }

  Future<void> _subtract() async {
    final result = state.left! - state.right!;
    final newState = CalculatorState(result);
    _reset(newState);
    emit(newState);
  }

  Future<void> _multiply() async {
    final result = state.left! * state.right!;
    final newState = CalculatorState(result);
    _reset(newState);
    emit(newState);
  }

  Future<void> _reset(final CalculatorState state) async {
    state.left = state.result;
    state.right = null;
    state.operation = null;
  }
}

class CalculatorState {
  CalculatorState(this.result);

  Operation? operation;
  int result;
  int? left;
  int? right;

  @override
  bool operator ==(Object other) {
    return other is CalculatorState &&
        other.operation == operation &&
        other.result == result &&
        other.left == left &&
        other.right == right;
  }

  @override
  int get hashCode => super.hashCode;

}

enum Operation {
  sum,
  sub,
  mul;
}
