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
    return Scaffold(
      appBar: AppBar(
        title: Text(translate('setting.setting')),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          children: [
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
                          child: Text(translate('cancel')),
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
                                  builder: (_) => const EquipaPage(
                                    startSpalsh: false,
                                  ),
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
              title: Text(translate('language')),
              onTap: () {
                _onActionSheetPress(context);
                setState(() {});
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
      builder: (BuildContext context) => child).then((String? value) {
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
          child: Text(translate('Indoensia')),
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
