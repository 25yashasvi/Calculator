import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CALCULATOR',
      theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CALCULATOR',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String $value = "0";

  Widget Buttons(var options, Color fcolor,Color bcolor) {
    return Container(
        child: FloatingActionButton(
          onPressed: () {
            Calculation(options);
          },
          child: Text(options,
              style: TextStyle(
                  color: fcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              )),
          backgroundColor: bcolor,


        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        centerTitle: true,
        title: Text(widget.title,

        style:TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30
        ),
        ),

      ),
      body:
      Column(

          children: <Widget>[


            Row(

              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text('$text',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      //   )


                    )
                ),
              ],
            ),
            SizedBox(
                height: 50
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Buttons("C", Colors.red,Colors.white54),
                Buttons("+/-", Colors.purpleAccent,Colors.white54),
                Buttons("%", Colors.purpleAccent,Colors.white54),
                Buttons("/", Colors.purpleAccent,Colors.white54),
              ],
            ),
            SizedBox(
                height: 20
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Buttons("7", Colors.black,Colors.white54),
                Buttons("8", Colors.black,Colors.white54),
                Buttons("9", Colors.black,Colors.white54),
                Buttons("X", Colors.purpleAccent,Colors.white54),
              ],
            ),
            SizedBox(
                height: 20
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Buttons("4", Colors.black,Colors.white54),
                Buttons("5", Colors.black,Colors.white54),
                Buttons("6", Colors.black,Colors.white54),
                Buttons("-", Colors.purpleAccent,Colors.white54),
              ],
            ),
            SizedBox(
                height: 20
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Buttons("1", Colors.black,Colors.white54),
                Buttons("2", Colors.black,Colors.white54),
                Buttons("3", Colors.black,Colors.white54),
                Buttons("+", Colors.purpleAccent,Colors.white54),
              ],
            ),
            SizedBox(
                height: 20
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Buttons("", Colors.black,Colors.white54),
                Buttons("0", Colors.black,Colors.white54),
                Buttons(".", Colors.black,Colors.white54),
                Buttons("=", Colors.white,Colors.purpleAccent),
              ],
            ),


          ]

      ),

    );
  }



  dynamic text = '0';
  double firstnum = 0;
  double secnum = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic operation = '';
  dynamic prev_opr = '';

  String add() {
    result = (firstnum + secnum).toString();
    firstnum = double.parse(result);
    return result;
  }

  String sub() {
    result = (firstnum - secnum).toString();
    firstnum = double.parse(result);
    return result;
  }

  String mul() {
    result = (firstnum * secnum).toString();
    firstnum = double.parse(result);
    return result;
  }

  String div() {
    result = (firstnum / secnum).toString();
    firstnum = double.parse(result);
    return result;
  }

  void Calculation(options) {

    if (options == "C") {
      text = '0';
      firstnum = 0;
      secnum = 0;
      result = '';
      finalResult = '0';
      operation  = '';
      prev_opr = '';
    }
    else if (operation  == "=" && options == "=") {
      switch (prev_opr) {
        case '+' :
          {
            finalResult = add();
          }
        case '-' :
          {
            finalResult = sub();
          }
        case 'X' :
          {
            finalResult = mul();
          }
        case '/' :
          {
            finalResult = div();
          }
      }
    }

      else if (options == "+" || options == "-" || options == "X" || options == "/" || options=="=") {
        if (firstnum == 0) {
          firstnum = double.parse(result);
        }
        else {
          secnum = double.parse(result);
        }
        switch (operation) {
          case "+":
            finalResult = add();
          case "-":
            finalResult = sub();
          case "X":
            finalResult = mul();
          case "/":
            finalResult = div();
        }
        prev_opr = operation ;
        operation  = options;
        result = '';
      }
    else if(options == '%') {
      finalResult = firstnum / 100;

    } else if(options == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }

    else if(options == '+/-') {
      result.toString().startsWith('-') ?
      result = result.toString().substring(1) :
      result = '-' + result.toString();
      finalResult = result;
    }

    else  {
        result = result + options;
        finalResult = result;
      }

    setState(() {
      text = finalResult;
      print(text);
    });
  }
}




