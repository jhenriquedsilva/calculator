import 'package:calculator/calculator_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({super.key});

  final CalculatorPresenter presenter = CalculatorPresenter();

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            BlocBuilder<CalculatorPresenter, CalculatorState>(
                bloc: widget.presenter,
                builder: (final context, final state) {
                  return Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Text(state.result.toString(), style: TextStyle(fontSize: 24)),
                  );
                }),
            Container(
              height: MediaQuery.of(context).size.height * 0.65,
              color: Colors.red,
              child: Column(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(child: Container()),
                      Expanded(child: Container()),
                      Expanded(child: Container()),
                    ],
                  )),
                  Expanded(
                      child: Row(children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => widget.presenter.setOperand(1),
                        child: Container(
                          child: Text(
                            '1',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => widget.presenter.setOperand(2),
                        child: Container(
                          child: Text(
                            '2',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => widget.presenter.setOperand(3),
                        child: Container(
                          child: Text(
                            '3',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => widget.presenter.setOperation(Operation.mul),
                        child: Container(
                          child: Text(
                            'X',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ])),
                  Expanded(
                      child: Row(children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => widget.presenter.setOperand(4),
                        child: Container(
                          child: Text(
                            '4',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => widget.presenter.setOperand(5),
                        child: Container(
                          child: Text(
                            '5',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => widget.presenter.setOperand(6),
                        child: Container(
                          child: Text(
                            '6',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () => widget.presenter.setOperation(Operation.sum),
                        ),
                      ),
                    ),
                  ])),
                  Expanded(
                      child: Row(children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => widget.presenter.setOperand(7),
                        child: Container(
                          child: Text(
                            '7',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => widget.presenter.setOperand(8),
                        child: Container(
                          child: Text(
                            '8',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => widget.presenter.setOperand(9),
                        child: Container(
                          child: Text(
                            '9',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => widget.presenter.setOperation(Operation.sub),
                        child: Container(
                          child: Text(
                            '-',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ])),
                  Expanded(
                      child: Row(children: [
                    Expanded(
                      child: Container(
                        child: Text(
                          '',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          '0',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          '',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => widget.presenter.makeOperation(),
                        child: Container(
                          child: Text(
                            '=',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ])),
                ],
              ),
            )
          ],
        ));
  }
}
