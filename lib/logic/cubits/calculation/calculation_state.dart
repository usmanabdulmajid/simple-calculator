part of 'calculation_cubit.dart';

class CalculationState {
  String calcValues;
  CalculationState({this.calcValues});

  CalculationState copyWith({
    String calcValues,
  }) {
    return CalculationState(
      calcValues: this.calcValues + calcValues ?? this.calcValues,
    );
  }
}
