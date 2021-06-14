import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:simple_calculator/logic/cubits/calculation/calculation_cubit.dart';
import 'package:simple_calculator/presentation/widgets/cal_button.dart';
import 'package:simple_calculator/utils/disable_focusnode.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  static TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() {
      print(controller.selection.base.offset);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: _size.width,
        height: _size.height,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0) +
            EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Calculator',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: _size.width,
              height: _size.height * 0.3,
              decoration: BoxDecoration(
                  //color: Colors.amber,
                  ),
              child: Neumorphic(
                style: NeumorphicStyle(
                  intensity: 1.0,
                  shadowLightColorEmboss: Colors.white,
                  depth: -5,
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(top: 25.0, right: 5.0, left: 5.0),
                      //height: 100,
                      child: BlocBuilder<CalculationCubit, CalculationState>(
                        builder: (context, state) {
                          // var hold = state.calcValues;
                          // controller.text = hold;
                          //state.controller.text = state.calcValues;
                          return TextField(
                            cursorColor: Colors.green,
                            cursorWidth: 2.0,
                            cursorRadius: Radius.circular(12),
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 30),
                            controller: state.controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            readOnly: true,
                            showCursor: true,
                            //focusNode: DisableFocusNode(),
                            onChanged: (value) {},
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //Spacer(),
            Expanded(
              child: Row(
                children: [
                  CalButton(
                    buttonText: 'C',
                  ),
                  CalButton(
                    buttonText: '%',
                  ),
                  CalButton(
                    buttonText: '⌫',
                  ),
                  CalButton(
                    buttonText: '+',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  CalButton(
                    buttonText: '7',
                  ),
                  CalButton(
                    buttonText: '8',
                  ),
                  CalButton(
                    buttonText: '9',
                  ),
                  CalButton(
                    buttonText: '-',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  CalButton(
                    buttonText: '4',
                  ),
                  CalButton(
                    buttonText: '5',
                  ),
                  CalButton(
                    buttonText: '6',
                  ),
                  CalButton(
                    buttonText: 'x',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  CalButton(
                    buttonText: '1',
                  ),
                  CalButton(
                    buttonText: '2',
                  ),
                  CalButton(
                    buttonText: '3',
                  ),
                  CalButton(
                    buttonText: '÷',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  CalButton(
                    buttonText: '.',
                  ),
                  CalButton(
                    buttonText: '0',
                  ),
                  Expanded(
                      child: CalButton(
                    buttonText: '=',
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
