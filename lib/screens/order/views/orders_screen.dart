import 'package:flutter/material.dart';
import 'package:shop/components/buy_full_ui_kit.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Text('Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find an order...',
                suffixIcon: Icon(Icons.filter_list),
              ),
            ),
            SizedBox(height: 20),
            Text('Orders history', style: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.w200)),
            SizedBox(height: 10),
            OrderHistoryItem(
              icon: Icons.payment,
              label: 'Awaiting Payment',
              count: 0,
            ),
            OrderHistoryItem(
              icon: Icons.delivery_dining,
              label: 'Processing',
              count: 1,
            ),
            OrderHistoryItem(
              icon: Icons.local_shipping_outlined,
              label: 'Delivered',
              count: 5,
            ),
            OrderHistoryItem(
              icon: Icons.shopping_cart_outlined,
              label: 'returned',
              count: 3,
            ),
            OrderHistoryItem(
              icon: Icons.cancel,
              label: 'Canceled',
              count: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class OrderHistoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;

  const OrderHistoryItem({required this.icon, required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: count == 0
                  ? Colors.yellow
                  : count == 2
                  ? Colors.red
                  : Colors.lightBlue,
            ),
            child: Text('$count', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(width: 10),
          Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,),
        ],
      ),
    );
  }
}

