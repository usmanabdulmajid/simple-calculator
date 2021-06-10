import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calculator/logic/cubits/calculation/calculation_cubit.dart';
import 'package:simple_calculator/presentation/screens/calculator_screen.dart';
import 'package:simple_calculator/presentation/widgets/cal_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CalculationCubit>(create: (context) => CalculationCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CalculatorScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('test'),
        ),
        body: Center(
            child: TextField(
          cursorColor: Colors.green,
          textAlign: TextAlign.end,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          autofocus: true,
          //focusNode: DisableFocusNode(),
        )));
  }
}
