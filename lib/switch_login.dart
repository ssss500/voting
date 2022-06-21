// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'choose_vote/choose_vote_widget.dart';
import 'sign_up/sign_up_widget.dart';

class SwitchLogin extends StatelessWidget {
//You need to choose a start page
  @override
  Widget build(BuildContext context) {
    return
      // GetStorage().read("phoneNumber") != null ||
      //       GetStorage().read("phoneNumber") != ''
        GetStorage().read("phoneNumber")==null|| GetStorage().read("phoneNumber")==''
        ? SignUpWidget()
        : ChooseVoteWidget();
  }
}
