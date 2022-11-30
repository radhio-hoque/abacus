import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import '../utility/constant.dart';

class HomeAbacus extends StatefulWidget {
  const HomeAbacus({Key? key}) : super(key: key);

  @override
  State<HomeAbacus> createState() => _HomeAbacusState();
}

class _HomeAbacusState extends State<HomeAbacus> {
  bool darkMode = false;
  String equation = '0';
  String result = '0';
  String expression = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? darkTheme : lightTheme,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        darkMode = !darkMode;
                      });
                    },
                    child: _switchMode(),
                  ),
                  const SizedBox(
                    height: 80.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      result,
                      style: TextStyle(
                          color: darkMode ? Colors.white : Colors.redAccent,
                          fontSize: 55,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '=',
                        style: TextStyle(
                            fontSize: 35,
                            color: darkMode ? Colors.green : Colors.grey),
                      ),
                      Text(
                        equation,
                        style: TextStyle(
                            fontSize: 20,
                            color: darkMode ? Colors.green : Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonOval(title: 'sin'),
                      _buttonOval(title: 'cos'),
                      _buttonOval(title: 'tan'),
                      _buttonOval(title: '%'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(
                          title: 'C',
                          titleColor: darkMode ? Colors.green : Colors.red),
                      _buttonRounded(title: '('),
                      _buttonRounded(title: ')'),
                      _buttonRounded(
                          title: '/',
                          titleColor: darkMode ? Colors.green : Colors.red),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '7'),
                      _buttonRounded(title: '8'),
                      _buttonRounded(title: '9'),
                      _buttonRounded(
                          title: '*',
                          titleColor: darkMode ? Colors.green : Colors.red),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '4'),
                      _buttonRounded(title: '5'),
                      _buttonRounded(title: '6'),
                      _buttonRounded(
                          title: '-',
                          titleColor: darkMode ? Colors.green : Colors.red),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '1'),
                      _buttonRounded(title: '2'),
                      _buttonRounded(title: '3'),
                      _buttonRounded(
                          title: '+',
                          titleColor: darkMode ? Colors.green : Colors.red),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '0'),
                      _buttonRounded(title: ','),
                      _buttonRounded(
                          iconData: Icons.backspace_outlined,
                          iconColor: darkMode ? Colors.green : Colors.red),
                      _buttonRounded(
                          title: '=',
                          titleColor: darkMode ? Colors.green : Colors.red),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buttonRounded(
      {String? title,
      double padding = 15.0,
      double borderRadius = 40.0,
      IconData? iconData,
      Color? iconColor,
      Color? titleColor}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _buttonPressed(title, iconData);
          });
        },
        child: AbacusCenter(
          darkMood: darkMode,
          padding: EdgeInsets.all(padding),
          borderRadius: BorderRadius.circular(borderRadius),
          child: SizedBox(
            width: padding * 2,
            height: padding * 2,
            child: Center(
              child: title != null
                  ? Text(
                      title,
                      style: TextStyle(
                        color: titleColor ??
                            (darkMode ? Colors.white : Colors.black),
                        fontSize: 30.0,
                      ),
                    )
                  : Icon(
                      iconData,
                      color: iconColor,
                      size: 30,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  _buttonOval(
      {required String title,
      double padding = 17.0,
      double borderRadius = 50.0}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _buttonPressed(title, null);
          });
        },
        child: AbacusCenter(
          darkMood: darkMode,
          padding:
              EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
          borderRadius: BorderRadius.circular(borderRadius),
          child: SizedBox(
            width: padding * 2,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: darkMode ? Colors.white : Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _switchMode() {
    return AbacusCenter(
      darkMood: darkMode,
      borderRadius: BorderRadius.circular(40.0),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: SizedBox(
        width: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.sunny,
              color: darkMode ? Colors.grey : Colors.redAccent,
            ),
            Icon(
              Icons.nightlight_round,
              color: darkMode ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  void _buttonPressed(String? title, IconData? iconData) {
    setState(() {
      if (title != null) {
        if (title == 'C') {
          equation = '0';
          result = '0';
        } else if (title == '=') {
          expression = equation;
          try {
            Parser parser = Parser();
            Expression exp = parser.parse(expression);
            ContextModel cm = ContextModel();
            result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          } catch (ex) {
            result = 'Error';
          }
        } else {
          if (equation == '0') {
            equation = title;
          } else {
            equation = equation + title;
          }
        }
      } else if (iconData != null) {
        equation = equation.substring(0, equation.length - 1);
        if (equation.isEmpty) {
          equation = '0';
        }
      }
    });
  }
}

class AbacusCenter extends StatefulWidget {
  final bool darkMood;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  const AbacusCenter(
      {Key? key,
      required this.darkMood,
      required this.child,
      required this.borderRadius,
      required this.padding})
      : super(key: key);

  @override
  State<AbacusCenter> createState() => _AbacusCenterState();
}

class _AbacusCenterState extends State<AbacusCenter> {
  bool _isPressed = false;

  _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode = widget.darkMood;
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
          color: darkMode ? darkTheme : lightTheme,
          borderRadius: widget.borderRadius,
          boxShadow: _isPressed
              ? null
              : [
                  BoxShadow(
                    color: darkMode ? Colors.black54 : Colors.blueGrey.shade200,
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: darkMode ? Colors.blueGrey.shade700 : Colors.white,
                    offset: const Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                ],
        ),
        child: widget.child,
      ),
    );
  }
}
