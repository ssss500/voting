import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../sign_up/sign_up_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class VeraficationCodeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignUpModel signUpModel = Get.put(SignUpModel());

    return Scaffold(
      // key: scaffoldKey,
      backgroundColor: Color(0xFF4E73DF),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Align(
          alignment: AlignmentDirectional(0, 1),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                        child: Image.asset(
                          'assets/images/id_(1).png',
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 270,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFAFDEDC),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color(0xFFDBE2E7),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          duration: Duration(milliseconds: 500),
                                          reverseDuration:
                                              Duration(milliseconds: 500),
                                          child: SignUpWidget(),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.arrow_back_rounded,
                                      color: Color(0xFF003049),
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Verify Code',
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF003049),
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                  controller: signUpModel.verificationCode,
                                  // onChanged: (_) => EasyDebounce.debounce(
                                  //   'phoneNumberController',
                                  //   Duration(milliseconds: 2000),
                                  //   () => setState(() {}),
                                  // ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Enter 6 digit code here...',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF95A1AC),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintText: '000000',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF95A1AC),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF669BBC),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF669BBC),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    filled: true,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16, 24, 0, 24),
                                    prefixIcon: Icon(
                                      Icons.message_outlined,
                                      color: Color(0xFF91A8A4),
                                      size: 30,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF2B343A),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    print('Button pressed ...');
                                    await signUpModel.buttonVerifyFunction();
                                  },
                                  text: 'Verify',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 50,
                                    color: Color(0xFF4E73DF),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    elevation: 3,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Didn`t receive the code ? Resend ',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF003049),
                                    fontSize: 15,
                                    lineHeight: 3,
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

// class _VeraficationCodeWidgetState extends State<VeraficationCodeWidget> {
//   // final scaffoldKey = GlobalKey<ScaffoldState>();
//
//
//   @override
//   Widget build(BuildContext context) {
//     SignUpModel signUpModel=Get.put(SignUpModel());
//
//     return Scaffold(
//       // key: scaffoldKey,
//       backgroundColor: Color(0xFF4E73DF),
//       body: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Align(
//           alignment: AlignmentDirectional(0, 1),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Align(
//                   alignment: AlignmentDirectional(0, 0),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
//                         child: Image.asset(
//                           'assets/images/id_(1).png',
//                           width: 300,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 270,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(0),
//                       bottomRight: Radius.circular(0),
//                       topLeft: Radius.circular(16),
//                       topRight: Radius.circular(16),
//                     ),
//                   ),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Padding(
//                                 padding:
//                                     EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
//                                 child: Container(
//                                   width: 40,
//                                   height: 40,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xFFAFDEDC),
//                                     shape: BoxShape.circle,
//                                     border: Border.all(
//                                       color: Color(0xFFDBE2E7),
//                                     ),
//                                   ),
//                                   child: InkWell(
//                                     onTap: () async {
//                                       await Navigator.push(
//                                         context,
//                                         PageTransition(
//                                           type: PageTransitionType.rightToLeft,
//                                           duration: Duration(milliseconds: 500),
//                                           reverseDuration:
//                                               Duration(milliseconds: 500),
//                                           child: SignUpWidget(),
//                                         ),
//                                       );
//                                     },
//                                     child: Icon(
//                                       Icons.arrow_back_rounded,
//                                       color: Color(0xFF003049),
//                                       size: 24,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Text(
//                                   'Verify Code',
//                                   style:
//                                       FlutterFlowTheme.of(context).title1.override(
//                                             fontFamily: 'Lexend Deca',
//                                             color: Color(0xFF003049),
//                                             fontSize: 24,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Expanded(
//                                 child: TextFormField(
//                                   controller:signUpModel. verificationCode,
//                                   // onChanged: (_) => EasyDebounce.debounce(
//                                   //   'phoneNumberController',
//                                   //   Duration(milliseconds: 2000),
//                                   //   () => setState(() {}),
//                                   // ),
//                                   obscureText: false,
//                                   decoration: InputDecoration(
//                                     labelText: 'Enter 6 digit code here...',
//                                     labelStyle: FlutterFlowTheme.of(context)
//                                         .bodyText1
//                                         .override(
//                                           fontFamily: 'Lexend Deca',
//                                           color: Color(0xFF95A1AC),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.normal,
//                                         ),
//                                     hintText: '000000',
//                                     hintStyle: FlutterFlowTheme.of(context)
//                                         .bodyText1
//                                         .override(
//                                           fontFamily: 'Lexend Deca',
//                                           color: Color(0xFF95A1AC),
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.normal,
//                                         ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Color(0xFF669BBC),
//                                         width: 2,
//                                       ),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Color(0xFF669BBC),
//                                         width: 2,
//                                       ),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     filled: true,
//                                     contentPadding: EdgeInsetsDirectional.fromSTEB(
//                                         16, 24, 0, 24),
//                                     prefixIcon: Icon(
//                                       Icons.message_outlined,
//                                       color: Color(0xFF91A8A4),
//                                       size: 30,
//                                     ),
//                                   ),
//                                   style: FlutterFlowTheme.of(context)
//                                       .bodyText1
//                                       .override(
//                                         fontFamily: 'Lexend Deca',
//                                         color: Color(0xFF2B343A),
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.normal,
//                                       ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Padding(
//                                 padding:
//                                     EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
//                                 child: FFButtonWidget(
//                                   onPressed: () async {
//                                     print('Button pressed ...');
//                                   await  signUpModel.buttonVerifyFunction();
//                                   },
//                                   text: 'Verify',
//                                   options: FFButtonOptions(
//                                     width: 130,
//                                     height: 50,
//                                     color: Color(0xFF4E73DF),
//                                     textStyle: FlutterFlowTheme.of(context)
//                                         .subtitle2
//                                         .override(
//                                           fontFamily: 'Lexend Deca',
//                                           color: Colors.white,
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                     elevation: 3,
//                                     borderSide: BorderSide(
//                                       color: Colors.transparent,
//                                       width: 1,
//                                     ),
//                                     borderRadius: 8,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Text(
//                           'Didn`t receive the code ? Resend ',
//                           style: FlutterFlowTheme.of(context).bodyText1.override(
//                                 fontFamily: 'Poppins',
//                                 color: Color(0xFF003049),
//                                 fontSize: 15,
//                                 lineHeight: 3,
//                               ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
// }
