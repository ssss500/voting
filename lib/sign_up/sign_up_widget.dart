import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';

// import 'package:flutter_bcrypt/flutter_bcrypt.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:voting/switch_login.dart';

import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../verafication_code/verafication_code_widget.dart';
import 'dart:convert';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget>
    with TickerProviderStateMixin {
  String passwordHash;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      curve: Curves.linear,
      trigger: AnimationTrigger.onPageLoad,
      duration: 1070,
      delay: 300,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'buttonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    SignUpModel signUpModel = Get.put(SignUpModel());
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF334E97),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 52, 16, 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome To ',
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFFF1FAEE),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 35, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Taswit-logo_(2).png',
                        width: 110,
                        height: 120,
                        fit: BoxFit.contain,
                      ).animated([animationsMap['imageOnPageLoadAnimation']]),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: Text(
                          'aswit',
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFFF1FAEE),
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.75,
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFF0F7EE),
                    shape: BoxShape.rectangle,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(24, 24, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Login',
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF1D3557),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 4, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Enter your details to continue.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF1D3557),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller:
                                      signUpModel.loginEmailAddressController,
                                  // onChanged: ((_) => EasyDebounce.debounce(
                                  //     'loginEmailAddressController',
                                  //     Duration(milliseconds: 2000),
                                  //     () => setState(() {}))),
                                  // onChanged:( (_) => EasyDebounce.debounce(
                                  //   'loginEmailAddressController',
                                  //   Duration(milliseconds: 2000),
                                  //   () => setState(() {})),
                                  // ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Email Address',
                                    hintText: 'Enter your email here...',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF457B9D),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF457B9D),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: Color(0xFF4E73DF),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF1D3557),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller:
                                      signUpModel.loginPasswordController,
                                  obscureText:
                                      !signUpModel.loginPasswordVisibility,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    hintText: 'Enter your password\n here...',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF457B9D),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF457B9D),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    prefixIcon: Icon(
                                      Icons.vpn_key_outlined,
                                      color: Color(0xFF4E73DF),
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => signUpModel
                                                .loginPasswordVisibility =
                                            !signUpModel
                                                .loginPasswordVisibility,
                                      ),
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        signUpModel.loginPasswordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Color(0xFF4E73DF),
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF1D3557),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await signUpModel.loginFunction();
                            },
                            text: 'Login',
                            options: FFButtonOptions(
                              width: 230,
                              height: 50,
                              color: Color(0xFF334E97),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFFF1FAEE),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Color(0xFF1D3557),
                                width: 1,
                              ),
                              borderRadius: 8,
                            ),
                          ).animated([
                            animationsMap['buttonOnActionTriggerAnimation']
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Text(
                            'Forgot password? \nPlease connect your administrator.',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D3557),
                                      fontSize: 16,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpModel extends GetxController {
  bool loginPasswordVisibility;

  String idUser = '', phoneNumber = '';
  TextEditingController loginEmailAddressController;
  TextEditingController loginPasswordController;
  TextEditingController verificationCode = TextEditingController();
  String verificationID;

  @override
  void onInit() {
    super.onInit();

    loginEmailAddressController =
        TextEditingController(text: 'khaledalwled+22@gmail.com');
    loginPasswordController = TextEditingController(text: '123456');
    loginPasswordVisibility = false;
  }

  loginFunction() async {
    if (loginEmailAddressController.text.length > 1 &&
        loginPasswordController.text.length > 1) {
      print('hi');
      Map result = await checkEmailAdnPasswordApi() as Map;
      print(result.length);
      if (result.length > 1) {
        print('sucss');
        print(result['id']);
        idUser = result['id'];
        await FirebaseDatabase.instance
            .ref('/taswit/users')
            .child(idUser)
            .get()
            .then((value) async {
          Map v = value.value;
          print(v['phoneNumber']);
          phoneNumber = v['phoneNumber'];
          // Get.to(() => VeraficationCodeWidget());
          GetStorage().write("phoneNumber", phoneNumber);
          GetStorage().write("idUser", idUser);
          //
          Get.offAll(()=>SwitchLogin());
         // await verifyFunction();
        });
      } else {
        ScaffoldMessenger.of(Get.context).showSnackBar(SnackBar(
          content: Text('Your email or password is wrong!'),
        ));
      }
    } else {
      print('hi1');
      const snackBar = SnackBar(
        content: Text('Your email or password is wrong!'),
      );
      ScaffoldMessenger.of(Get.context).showSnackBar(snackBar);
    }
  }

  verifyFunction() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    //لتاكيد الفنكشن ان الكلام مكتوب بشكل مظبوط

    auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 120),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) async {
            print(auth.currentUser.uid);
            GetStorage().write("phoneNumber", phoneNumber);

            Get.offAll(SwitchLogin());

            print("You are logged in successfully");
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId, int resendToken) async {
          //after send sms
          verificationID = verificationId;
          Get.to(() => VeraficationCodeWidget());
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  Future<void> buttonVerifyFunction() async {
    print(verificationCode.text);
   await PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: verificationCode.text);
    update();
    print('done');
  }

  Future<void> checkEmailAdnPasswordApi() async {
    var dio = Dio();
    var response;

    response =
        await dio.post('https://taswit-uat.khaledibnalwalid.com/api/login',
            data: {
              "email": loginEmailAddressController.text,
              "password": loginPasswordController.text,
            },
            options: Options(validateStatus: (_) => true));
    print("checkEmailAdnPasswordApi : " + response.data.toString());
    return response.data;
  }
}
