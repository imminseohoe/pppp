import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String a = '3.';
  String showA = '3.';
  String pi = '3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678925903600113305305488204665213841469519415116094330572703657595919530921861173819326117931051185480744623799627495673518857527248912279381830119491298336733624406566430860213949463952247371907021798609437027705392171762931767523846748184676694051320005681271452635608277857713427577896091736371787214684409012249534301465495853710507922796892589235420199561121290219608640344181598136297747713099605187072113499999983729780499510597317328160963185950244594553469083026425223082533446850352619311881710100031378387528865875332083814206171776691473035982534904287554687311595628638823537875937519577818577805321712268066130019278766111959092164201989';
  Color textColor = Colors.black;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('π외우기'),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('digit:$count', style: TextStyle(fontSize: 20, color: textColor,))
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(showA, style: TextStyle(fontSize: 40, color: textColor))
                  ],
                ),
                const SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton('1', context),
                    buildButton('2', context),
                    buildButton('3', context),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton('4', context),
                    buildButton('5', context),
                    buildButton('6', context),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton('7', context),
                    buildButton('8', context),
                    buildButton('9', context),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton('res', context),
                    buildButton('0', context),
                    buildButton('⌦', context),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:BottomAppBar( height: 40, child: Text('v3.1.0',style: TextStyle(fontSize: 10))),
      ),
    );
  }
    Widget buildButton(String label, BuildContext context) {
    if (label.isEmpty) {
      return SizedBox(
        width: 80.0,
        height: 80.0,
      );
    }

    return ElevatedButton(

      onPressed: () {
        setState(() {

          if (label != '⌦' && label != 'res') {
            count += 1;
            if (label != pi[a.length]) {
              a  += label;
              showA += label;
              textColor = Colors.red;
              if (a.length >= 10){showA = a.substring((a.length -10),a.length);}
            }
            else{
              a += label;
              showA += label;
              if (a.length >= 10){showA = a.substring((a.length -10),a.length);}
            }

          } else if (label == '⌦' && a.length >= 3)  {
            count -= 1;
            a = a.substring(0, a.length - 1);

            if (a.length <= 10){
              showA = a.substring(0,a.length);
            }
            else{
              showA = a.substring((a.length -10),a.length);
            }
            if (a == a.substring(0,a.length)){
              textColor = Colors.black;
            }

          } else {
            a = '3.';
            showA = '3.';
            textColor = Colors.black;
            count = 0;
          }
        });
      },
      child: Text(
        label,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

