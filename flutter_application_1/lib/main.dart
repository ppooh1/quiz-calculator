import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() {
    return _CalculatorState();
  }
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController firstNumberController = TextEditingController();
  final TextEditingController secondNumberController = TextEditingController();
  String output = '';
  void plusFunction() {
    double firstNumber = double.parse(firstNumberController.text);
    double secondNumber = double.parse(secondNumberController.text);
    double result = firstNumber + secondNumber;
    primeFunction(result);
    setState(() {
      output = result.toString() + ' ' + primeFunction(result) ;
    });
  }
  String primeFunction(x) {
    String prime = '';
    if (x <= 1){
      return prime = 'not prime';
    }
    for(int i =  2; i < x ; i++){
      if(x % i == 0){
        return prime = 'not prime';  
      }
    }
    return prime = 'prime';
  }
  void minusFunction() {
    double firstNumber = double.parse(firstNumberController.text);
    double secondNumber = double.parse(secondNumberController.text);
    double result = firstNumber - secondNumber;
    primeFunction(result);
    setState(() {
      output = result.toString() + ' ' + primeFunction(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: firstNumberController,
              decoration: InputDecoration(hintText: 'Enter first number'),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: secondNumberController,
              decoration: InputDecoration(hintText: 'Enter second number'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16), // Add 16px of vertical space
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: plusFunction,
                  child: Text('+'),
                ),
                SizedBox(width: 16), // Add 16px of horizontal space
                ElevatedButton(
                  onPressed: minusFunction,
                  child: Text('-'),
                ),
                
                
              ],
            ),
            SizedBox(height: 16), // Add 16px of vertical space
            Text(
              'Output: $output',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
