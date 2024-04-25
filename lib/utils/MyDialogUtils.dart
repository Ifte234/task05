import 'dart:math';

import 'package:url_launcher/url_launcher.dart';

class DialogUtils {
  static final _random = Random();

  // static int randomNumber1 = Random().nextInt(900000)+100000;
  // static int randomNumber2 = Random().nextInt(900)+100;
  // static int Number = randomNumber1+randomNumber2;
  static String getString() {
    String s = "";
    for (var i = 0; i < 9; i++) {
      s += _random.nextInt(10).toString();
    }
    return s;
  }

  void makeCall() async {
    final call = Uri.parse('tel:+92 3${getString().toString()}');

    if (await canLaunchUrl(call)) {
      launchUrl(call);
    } else {
      throw 'Could not launch $call';
    }
  }

  // void sendMessage() async {
  //   final call = Uri.parse('tel:+92 3${getString().toString()}');
  //
  //   if (await canLaunchUrl(call)) {
  //     launchUrl(call);
  //   } else {
  //     throw 'Could not launch $call';
  //   }

  void sendMessage() async {
    final sms = Uri.parse('sms: +92 3${getString()}');
    if (await canLaunchUrl(sms)) {
      launchUrl(sms);
    } else {
      throw 'Could not launch $sms';
    }
  }

}