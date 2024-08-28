import 'package:flutter/material.dart';

import 'components/review_product_card.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  int _rating = 0;
  String _title = '';
  String _review = '';
  String _likeDislike = '';
  String _shoppersKnow = '';
  bool _recommend = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Add Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              // Product Image
              Center(
                child: Image.asset('assets/images/login_dark.png'),
              ),
              const SizedBox(height: 16.0),
              // Product Name
              Text(
                'LIPSY LONDON',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                'Sleeveless Ruffle',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w200),
              ),
              const SizedBox(height: 16.0),
              // Rating
              Center(
                  child: const Text(
                'Your overall rating of this product',
                style: TextStyle(fontSize: 18),
              )),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => IconButton(
                    onPressed: () {
                      setState(() {
                        _rating = index + 1;
                      });
                    },
                    icon: Icon(
                      _rating > index ? Icons.star : Icons.star,
                      color: _rating > index ? Colors.amber : Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              // Review Title
              Text('Set a Title for your review'),
              SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _title = value;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Summarize review',
                ),
              ),
              SizedBox(height: 16.0),
              // Review Text
              Text('What did you like or dislike?'),
              SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _review = value;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'What did you like or dislike?',
                ),
                maxLines: null,
              ),
              const SizedBox(height: 16.0),
              // What Shoppers Should Know
              const Text('What should shoppers know before?'),
              const SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _shoppersKnow = value;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'What should shoppers know before?',
                ),
                maxLines: null,
              ),
              const SizedBox(height: 16.0),
              // Recommend
              Row(
                children: [
                  const Text('Would you recommend this product?'),
                  const SizedBox(width: 16.0),
                  Switch(
                    value: _recommend,
                    onChanged: (value) {
                      setState(() {
                        _recommend = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              // Submit Button
              ElevatedButton(
                onPressed: () {
                  // Submit the review to your backend here
                  print('Title: $_title');
                  print('Review: $_review');
                  print('Like/Dislike: $_likeDislike');
                  print('Shoppers Know: $_shoppersKnow');
                  print('Recommend: $_recommend');
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF7B61FF),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 48.0, vertical: 16.0),
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Submit Review'),
              ),
              SizedBox(height: 20),
              Center(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductReviewsScreen()));
                      },
                      child: Text(
                        "View All Review",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
