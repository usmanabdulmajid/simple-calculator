import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculation_state.dart';

class CalculationCubit extends Cubit<CalculationState> {
  CalculationCubit() : super(CalculationState(calcValues: ''));

  void displayTexts(String buttonText) {
    emit(state.copyWith(calcValues: buttonText));
  }
}
