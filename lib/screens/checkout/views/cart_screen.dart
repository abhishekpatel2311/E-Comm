import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Review your order',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(height: 16),
              // Order Items
              OrderItem(
                title: 'Sleeveless Tiered Dobby...',
                price: '\$299,43',
                originalPrice: '\$534,33',
                imageUrl:
                    'https://www.nextdirect.com/nxtcms/resource/blob/5821518/d114a8023263017f86b11c206949508e/shackets-data.jpg',
              ),
              SizedBox(height: 10),
              OrderItem(
                imageUrl:
                    'https://www.nextdirect.com/nxtcms/resource/blob/5821504/ee0fc6a294be647924fa5f5e7e3df8e9/hoodies-data.jpg',
                title: 'Printed Sleeveless Tiered...',
                price: '\$299,43',
                originalPrice: '\$534,33',
              ),
              SizedBox(height: 16),
              // Coupon Code
              Text(
                'Your Coupon code',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.local_offer_outlined),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type coupon code',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Order Summary
              Text(
                'Order Summary',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              OrderSummaryItem(
                title: 'Subtotal',
                price: '\$24',
              ),
              OrderSummaryItem(
                title: 'Shipping Fee',
                price: 'Free',
              ),
              OrderSummaryItem(
                title: 'Total (Include of VAT)',
                price: '\$25',
              ),
              OrderSummaryItem(
                title: 'Estimated VAT',
                price: '\$1',
              ),
              SizedBox(height: 32),
              // Checkout Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF7B61FF),
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Order Item Widget
class OrderItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String originalPrice;

  OrderItem({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Image.network(
            imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                // Price
                Row(
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      originalPrice,
                      style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Order Summary Item Widget
class OrderSummaryItem extends StatelessWidget {
  final String title;
  final String price;

  OrderSummaryItem({
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
