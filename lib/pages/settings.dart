import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tapadacommunity/pages/equipa.dart';
import 'package:tapadacommunity/services/auth_service.dart';
import 'package:flutter_translate/flutter_translate.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  Icon(
                    Icons.account_circle,
                    size: 62.sp,
                    color: Colors.black,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Username',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
            ListTile(
              title: Text(translate('language')),
              onTap: () {
                _onActionSheetPress(context);
                setState(() {});
              },
            ),
            const Divider(),
            ListTile(
              title: Text(translate('setting.resetPassword')),
              onTap: () {
                // Add your code for password reset here
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(translate('setting.resetPassword')),
                      content: Text(translate('setting.resetPasswordDesc')),
                      actions: [
                        TextButton(
                          child: Text(translate('cancel')),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text(translate('reset')),
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
            const Divider(),
            ListTile(
              title: Text(translate('setting.signOut')),
              onTap: () {
                // Add your code for password reset here
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(translate('setting.signOut')),
                      content: Text(translate('setting.signOutDesc')),
                      actions: [
                        TextButton(
                          child: Text(translate('no')),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text(translate('yes')),
                          onPressed: () async {
                            await AuthService().signOut().then((value) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const EquipaPage(),
                                ),
                              );
                            });
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const Divider(),
            ListTile(
              title: Text(translate('setting.deleteAccount')),
              onTap: () {
                // Add your code for account deletion here
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(translate('setting.deleteAccount')),
                      content: Text(translate('setting.deleteAccountDesc')),
                      actions: [
                        TextButton(
                          child: Text(translate('cancel')),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text(translate('delete')),
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
          ],
        ),
      ),
    );
  }
}

void showDemoActionSheet({
  required BuildContext context,
  required Widget child,
}) {
  showCupertinoModalPopup<String>(
    context: context,
    builder: (BuildContext context) => child,
  ).then((String? value) {
    if (value != null) changeLocale(context, value);
  });
}

void _onActionSheetPress(BuildContext context) {
  showDemoActionSheet(
    context: context,
    child: CupertinoActionSheet(
      title: Text(translate('Select language')),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text(translate('English')),
          onPressed: () => Navigator.pop(context, 'en_US'),
        ),
        CupertinoActionSheetAction(
          child: Text(translate('Spanish')),
          onPressed: () => Navigator.pop(context, 'es'),
        ),
        CupertinoActionSheetAction(
          child: Text(translate('Russia')),
          onPressed: () => Navigator.pop(context, 'ru'),
        ),
        CupertinoActionSheetAction(
          child: Text(translate('Indonesia')),
          onPressed: () => Navigator.pop(context, 'id'),
        ),
        CupertinoActionSheetAction(
          child: Text(translate('Portuguese')),
          onPressed: () => Navigator.pop(context, 'pt'),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text(translate('cancel')),
        isDefaultAction: true,
        onPressed: () => Navigator.pop(context, null),
      ),
    ),
  );
}