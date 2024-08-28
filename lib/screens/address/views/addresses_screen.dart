import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final List<Address> addresses = [
    Address(
      name: 'My home',
      address:
      'Sophi Nowakowska, Zabiniec 12/222, 31-215 Cracow, Poland',
      phone: '+79 123 456',
      isDefault: true,
    ),
    Address(
      name: 'Office',
      address:
      'Rio Nowakowska, Zabiniec 12/222, 31-215 Cracow, Poland',
      phone: '+79 123 456',
    ),
    Address(
      name: 'Grandmother\'s home',
      address:
      'Rio Nowakowska, Zabiniec 12/222, 31-215 Cracow, Poland',
      phone: '+79 123 456',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Find an address...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.local_post_office)
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Add new address'),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return AddressCard(address: addresses[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final Address address;

  const AddressCard({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  address.isDefault ? Icons.home_filled : Icons.home_outlined,
                  color: address.isDefault
                      ? Colors.blue
                      : Colors.grey.shade600,
                ),
                SizedBox(width: 16),
                Text(
                  address.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                if (address.isDefault)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Default',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8),
            Text(address.address),
            SizedBox(height: 8),
            Text(address.phone),
          ],
        ),
      ),
    );
  }
}

class Address {
  final String name;
  final String address;
  final String phone;
  final bool isDefault;

  Address({
    required this.name,
    required this.address,
    required this.phone,
    this.isDefault = false,
  });
}
