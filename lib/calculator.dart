import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String expression = '';
  num result = 0;

  @override
  Widget build(BuildContext context) {
    String keys = '789/456*123-0.=+';

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                expression,
                style: const TextStyle(
                  color: Color(0xFF004F98),
                  fontSize: 30,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                result.toString(),
                style: const TextStyle(
                  color: Color(0xFF004F98),
                  fontSize: 40,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                padding: const EdgeInsets.only(bottom: 10),
                children: keys.split('').map((e) {
                  return OutlinedButton(
                    onPressed: () {
                      if (e == '=') {
                        setState(() {
                          result = expression.interpret();
                          expression = '';
                        });
                      } else if (expression == '') {
                        if (e == '+' || e == '-' || e == '*' || e == '/') {
                          setState(() {
                            expression = '$result$e';
                          });
                        } else {
                          setState(() {
                            expression = e;
                          });
                        }
                      } else {
                        setState(() {
                          expression += e;
                        });
                      }
                    },
                    child: Text(e),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
