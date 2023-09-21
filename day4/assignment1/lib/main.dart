// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  int _result = 0;

  showResultDialog(BuildContext context, var result) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 150,
            child: Center(
                child: Text(
              "$result",
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        );
      },
    );
  }

  void _calcultateSum() {
    int? num1 = int.tryParse(_controller1.text);
    int? num2 = int.tryParse(_controller2.text);
    int sum = num1! + num2!;
    setState(() {
      _result = sum;
    });
    showResultDialog(context, _result);
  }

  void _calcultateDiff() {
    int? num1 = int.tryParse(_controller1.text);
    int? num2 = int.tryParse(_controller2.text);
    int diff = num1! - num2!;
    setState(() {
      _result = diff;
    });
  }

  void _calcultatemMul() {
    int? num1 = int.tryParse(_controller1.text);
    int? num2 = int.tryParse(_controller2.text);
    int mul = num1! * num2!;
    setState(() {
      _result = mul;
    });
  }

  void _calcultateDiv() {
    int? num1 = int.tryParse(_controller1.text);
    int? num2 = int.tryParse(_controller2.text);
    int div = num1! ~/ num2!;
    setState(() {
      _result = div;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '사칙연산',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'X의 값은?',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(width: 32),
                SizedBox(
                  width: 200.0,
                  child: TextField(
                    controller: _controller1,
                    decoration: InputDecoration(hintText: 'x값을 입력하세요.'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Y의 값은?',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(width: 32),
                SizedBox(
                  width: 200.0,
                  child: TextField(
                    controller: _controller2,
                    decoration: InputDecoration(hintText: 'y값을 입력하세요.'),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _calcultateSum,
              child: Text('더하기의 결과값은?!'),
            ),
            ElevatedButton(
              onPressed: _calcultatemMul,
              child: Text('곱하기의 결과값은?!'),
            ),
            ElevatedButton(
              onPressed: _calcultateDiff,
              child: Text('빼기의 결과값은?!'),
            ),
            ElevatedButton(
              onPressed: _calcultateDiv,
              child: Text('나누기의 결과값은?!'),
            ),
          ],
        ),
      ),
    );
  }
}
