import 'package:flutter/material.dart';

class NotificationOptionsScreen extends StatefulWidget {
  @override
  _NotificationOptionsScreenState createState() => _NotificationOptionsScreenState();
}

class _NotificationOptionsScreenState extends State<NotificationOptionsScreen> {
  bool _notificationsEnabled = true;
  bool _soundEnabled = true;
  bool _vibrationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Options'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Sound'),
              value: _soundEnabled,
              onChanged: _notificationsEnabled
                  ? (bool value) {
                setState(() {
                  _soundEnabled = value;
                });
              }
                  : null, // Disable if notifications are disabled
            ),
            SwitchListTile(
              title: Text('Vibration'),
              value: _vibrationEnabled,
              onChanged: _notificationsEnabled
                  ? (bool value) {
                setState(() {
                  _vibrationEnabled = value;
                });
              }
                  : null, // Disable if notifications are disabled
            ),
            ListTile(
              title: Text('Notification Tone'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: _notificationsEnabled
                  ? () {
                // Navigate to a screen for selecting notification tones
              }
                  : null, // Disable if notifications are disabled
            ),
          ],
        ),
      ),
    );
  }
}
