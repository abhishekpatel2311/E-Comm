import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'New Message',
      'body': 'You have a new message from John Doe',
      'time': '5 mins ago',
    },
    {
      'title': 'Update Available',
      'body': 'A new update is available for your app.',
      'time': '1 hour ago',
    },
    {
      'title': 'Reminder',
      'body': 'Don\'t forget your meeting at 3 PM today.',
      'time': '2 hours ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(notification['title'] ?? ''),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification['body'] ?? ''),
                  SizedBox(height: 4),
                  Text(
                    notification['time'] ?? '',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              onTap: () {
                // Handle notification tap, e.g., navigate to a detail screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationDetailScreen(notification: notification),
                  ),
                );
              },
              trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  // Handle notification dismissal
                  // You may want to show a dialog to confirm dismissal or directly remove it
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class NotificationDetailScreen extends StatelessWidget {
  final Map<String, String> notification;

  NotificationDetailScreen({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(notification['title'] ?? 'Notification Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification['title'] ?? '',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(notification['body'] ?? ''),
            SizedBox(height: 16),
            Text(
              notification['time'] ?? '',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
