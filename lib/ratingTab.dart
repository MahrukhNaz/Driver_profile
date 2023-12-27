import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingTabPage extends StatefulWidget {
  const RatingTabPage({Key? key}) : super(key: key);

  @override
  State<RatingTabPage> createState() => _RatingTabPageState();
}

class _RatingTabPageState extends State<RatingTabPage> {
  double _userRating = 0.0;

  // Example data for positive and negative reviews
  int totalReviews = 100;
  int positiveReviews = 75;
  int negativeReviews = 25;

  // Example data for individual feedback
  List<String> names = ['John Doe', 'Jane Smith', 'Bob Johnson'];
  List<String> feedback = [
    'Great service! Very satisfied.',
    'Could be better. Room for improvement.',
    'Excellent communication and professionalism.',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(

        title: Text(
          'Ratings',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      'Your Ratings',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    RatingBar.builder(
                      initialRating: _userRating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(
                          horizontal: screenWidth < 600 ? 2.0 : 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          _userRating = rating;
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Your average rating is ${_userRating.toStringAsFixed(1)}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Positive Reviews',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${(positiveReviews / totalReviews * 100).toStringAsFixed(2)}%',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Negative Reviews',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${(negativeReviews / totalReviews * 100).toStringAsFixed(2)}%',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Recent Feedback',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              for (int i = 0; i < names.length; i++)
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            names[i],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Set text color to black
                            ),
                          ),
                          RatingBar.builder(
                            itemSize: 20,
                            initialRating: 5, // You can change this based on the actual rating
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(
                                horizontal: screenWidth < 600 ? 2.0 : 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        feedback[i],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black, // Set text color to black
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
