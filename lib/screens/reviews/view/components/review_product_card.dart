import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatefulWidget {
  @override
  _ProductReviewsScreenState createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState extends State<ProductReviewsScreen> {
  final List<Map<String, dynamic>> reviews = [
    {
      'author': 'John Doe',
      'rating': 4,
      'comment': 'Great product! Highly recommend.',
      'date': '2024-08-25',
    },
    {
      'author': 'Jane Smith',
      'rating': 5,
      'comment': 'Exceeded my expectations. Will buy again.',
      'date': '2024-08-20',
    },
    {
      'author': 'Alice Johnson',
      'rating': 3,
      'comment': 'It’s okay, not as good as I expected.',
      'date': '2024-08-18',
    },
  ];

  final _ratingController = TextEditingController();
  final _commentController = TextEditingController();
  double _currentRating = 0.0;

  @override
  void dispose() {
    _ratingController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _addReview() {
    setState(() {
      reviews.add({
        'author': 'You', // In a real app, this would be the current user's name
        'rating': _currentRating,
        'comment': _commentController.text,
        'date': DateTime.now().toIso8601String().split('T')[0],
      });
      _commentController.clear();
      _currentRating = 0.0;
    });
    Navigator.of(context).pop();
  }

  void _showAddReviewDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add a Review'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Rating'),
              Slider(
                value: _currentRating,
                min: 0,
                max: 5,
                divisions: 5,
                label: _currentRating.toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentRating = value;
                  });
                },
              ),
              TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  labelText: 'Comment',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Submit'),
              onPressed: _addReview,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Reviews'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showAddReviewDialog,
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Row(
                children: [
                  Text(review['author'] ?? ''),
                  Spacer(),
                  _buildRatingStars(review['rating']),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(review['comment'] ?? ''),
                  SizedBox(height: 4),
                  Text(
                    review['date'] ?? '',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRatingStars(int? rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < (rating ?? 0) ? Icons.star : Icons.star_border,
          color: Colors.amber,
        );
      }),
    );
  }
}
