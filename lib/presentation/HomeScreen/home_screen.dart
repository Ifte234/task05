import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:task05/presentation/HomeScreen/widgets/customAlertDialog.dart';
import 'package:task05/presentation/business_logic/bloc/mypermission_bloc.dart';

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
      body: BlocBuilder<MypermissionBloc, MypermissionState>(
          builder: (context, state) {
        if (state is MypermissionState) {
          return Column(
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
                            text: 'Do you want to Call ${dialogUtils} ?',
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
                            text: 'Do you want to Add Location Permission?',
                            ontapYes: () async {
                              var status = await Permission.location.request();
                              if (status.isGranted ==
                                  PermissionStatus.granted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Permission Granted!')));
                              } else if (status.isDenied ==
                                  PermissionStatus.denied) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Permission not Granted!')));
                              } else if (status.isPermanentlyDenied ==
                                  PermissionStatus.permanentlyDenied) {
                                openAppSettings();
                              }
                            },
                            myCallBack: () {},
                          ),
                        );
                      },
                      child: Text('Location Button')),
                  OutlinedButton(
                      onPressed: () async {
                        context.read<MypermissionBloc>().add(CheckPermission());
                      },
                      child: Text('Storage Button')),
                ],
              ),
            ],
          );
        } else {
          return Text('dataq');
        }
      }),
    );
  }
}

requestStoragePermission() async {
  var status = await Permission.storage.request();
  if (status.isGranted) {
    // Do what you want with permission
  } else if (status.isDenied) {
    // Show with this permission how you can improve
  } else if (status.isPermanentlyDenied) {
    // Show dialog or open app setting for manual permission.
  }
}
