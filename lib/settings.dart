import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Delete Account'),
              onTap: () {
                // Add your code for account deletion here
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Delete Account'),
                      content: Text('Are you sure you want to delete your account?'),
                      actions: [
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Delete'),
                          onPressed: () {
                            // Add logic to delete the account here
                            Navigator.of(context).pop();
                            // You may want to navigate to a login screen after deletion
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text('Reset Password'),
              onTap: () {
                // Add your code for password reset here
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Reset Password'),
                      content: Text('Send a password reset link to your email address?'),
                      actions: [
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Send'),
                          onPressed: () {
                            // Add logic to send password reset link
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
