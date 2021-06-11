part of 'calculation_cubit.dart';

class CalculationState {
  String calcValues;
  TextEditingController controller;

  CalculationState({this.calcValues, this.controller});

  CalculationState copyWith({
    String calcValues,
    TextEditingController controller,
  }) {
    // if (this.controller.selection.base.offset == -1) {
    //   this.calcValues = this.calcValues + calcValues;
    // } else if (this.controller.selection.base.offset == 0) {
    //   this.calcValues = calcValues + this.calcValues;
    // } else if (this.controller.selection.base.offset > 0) {
    //   this.calcValues = this
    //           .calcValues
    //           .substring(0, this.controller.selection.base.offset) +
    //       calcValues +
    //       this.calcValues.substring(
    //           this.controller.selection.base.offset, this.calcValues.length);
    // }
    return CalculationState(
      calcValues: this.calcValues,
      controller: this.controller,
    );
  }
}
