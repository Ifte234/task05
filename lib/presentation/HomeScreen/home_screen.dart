import 'package:flutter/material.dart';
import 'package:task05/presentation/HomeScreen/widgets/customAlertDialog.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';

import '../../utils/MyDialogUtils.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  DialogUtils dialogUtils = new DialogUtils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CallBacks and Dialogs'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                  onPressed: () {
                    print(dialogUtils);
                    showDialog(
                      context: context,
                      builder: (context) => MyAlertDialoge(
                        text:
                            'Do you want to Call ${dialogUtils} ?',
                        ontapYes: () {
                          dialogUtils.makeCall();
                        },
                        myCallBack: () {},
                      ),
                    );
                  },
                  child: const Text('     Call Button     ')),
              OutlinedButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) => MyAlertDialoge(
                        text:
                        'Do you want to Send Message ${dialogUtils} ?',
                        ontapYes: () {
                          dialogUtils.sendMessage();
                        },
                        myCallBack: () {},
                      ),
                    );
                  },
                  child: const Text('Message Button')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => MyAlertDialoge(
                        text: 'Do you want to Add Permission?',
                        ontapYes: () {},
                        myCallBack: () {},
                      ),
                    );
                  },
                  child: Text('Location Button')),
              OutlinedButton(onPressed: () {}, child: Text('Storage Button')),
            ],
          )
        ],
      ),
    );
  }
}
