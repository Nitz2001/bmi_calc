import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class secondpage extends StatefulWidget {
  secondpage({ required this.bmi, required this.con});
  double bmi;
  String con;



  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height:70),
          Text('Your BMI is ${widget.bmi}',
            style:TextStyle(
              fontSize: 26,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height:40),

          Text('You are ${widget.con}',
            style:TextStyle(
              fontSize: 26,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height:120),

          Column(
            children: [
              Text('Rate your experience -',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.lightGreenAccent)),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.lightGreen,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),




            ],
          ),
          SizedBox(height:100),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[ ElevatedButton(
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
                Navigator.pop(context);
              },
              child: const Text('ReCalculate'
              ),
            ),
    ],

          ),
        ],
      ),
    );

  }
}

