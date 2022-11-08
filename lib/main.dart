

import 'package:flutter/material.dart';
import 'package:bmi_calculator/secondpage.dart';

void main() => runApp(MaterialApp(
  home: bmi(),
));

class bmi extends StatefulWidget {
  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  double height = 100;
  double bmi = 0;
  int value = 30;
  String con='____________';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('BMI Calculator'),
          centerTitle: true, //centres title
          backgroundColor: Colors.grey[850],
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [


            SizedBox(height: 30),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Height is ${height.round()} cm",
                    style: TextStyle(
                      fontSize: 24,

                      color: Colors.lightGreenAccent,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slider(
                    value: height,
                    min: 50,
                    max: 500,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    })
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Weight is $value kg',
                    style: TextStyle(
                        color: Colors.lightGreenAccent,
                        fontSize: 24,

                        letterSpacing: 2))
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      value += 1;
                    });
                  },
                  child: Text('+',
                    style: TextStyle(
                      fontSize: 20,
                    ),),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(28),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      value -= 1;
                    });

                  },
                  child: Text('-',
                    style: TextStyle(
                      fontSize: 25,
                    ),),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(28),
                  ),
                )
              ],
            ),
            SizedBox(height: 70),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.black,
                primary: Colors.blue,
                minimumSize: const Size(300,60),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  bmi = (value) / ((height / 100) * (height / 100));
                  if(bmi <18.5) {
                    con='underweight';}
                  if(bmi >18.5 && bmi< 25) {
                    con='healthy weight';}
                  if( bmi>25) {
                    con='overweight';}
                });
                Navigator.push(context, MaterialPageRoute(builder: (context)=>secondpage(bmi: bmi,con: con,)));

              },
              child: const Text('Calculate'
              ),
            ),
            SizedBox(height: 20,),


          ],
        ));
  }
}

