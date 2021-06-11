import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'calculation_state.dart';

class CalculationCubit extends Cubit<CalculationState> {
  final TextEditingController controller;
  CalculationCubit({this.controller})
      : super(CalculationState(calcValues: '', controller: controller));

  void displayTexts(String buttonText) {
    // var hold = state.calcValues = buttonText;
    // controller.text = hold;
    if (this.controller.selection.base.offset == -1) {
      state.calcValues = state.calcValues + buttonText;
    } else if (this.controller.selection.base.offset == 0) {
      state.calcValues = buttonText + state.calcValues;
    } else if (this.controller.selection.base.offset > 0) {
      state.calcValues = state.calcValues
              .substring(0, this.controller.selection.base.offset) +
          buttonText +
          state.calcValues.substring(
              this.controller.selection.base.offset, state.calcValues.length);
    }
    controller.text = state.copyWith(calcValues: buttonText).calcValues;
    // if(controller.selection.base.offset == -1){
    //   controller.text = state.copyWith(calcValues: buttonText).calcValues;
    // } else {

    // }

    emit(state.copyWith(calcValues: buttonText, controller: controller));
  }

  void removeText() {
    //if for checking insex of -1
    if (controller.selection.base.offset == -1) {
      state.calcValues =
          state.calcValues.substring(0, state.calcValues.length - 1);
      controller.text = state.calcValues;
    } else if (controller.selection.base.offset != 0) {
      state.calcValues =
          state.calcValues.substring(0, controller.selection.base.offset - 1) +
              state.calcValues.substring(
                  controller.selection.base.offset, state.calcValues.length);
      controller.text = state.calcValues;
    }

    emit(
        CalculationState(calcValues: state.calcValues, controller: controller));
  }
}
