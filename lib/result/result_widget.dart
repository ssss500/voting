import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../choose_vote/choose_vote_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math';

class ResultWidget extends StatefulWidget {
  const ResultWidget({Key key}) : super(key: key);

  @override
  _ResultWidgetState createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int totalVote = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Color(0xFF2E59D9),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFFFDF0D5),
            size: 24,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.leftToRight,
                duration: Duration(milliseconds: 200),
                reverseDuration: Duration(milliseconds: 200),
                child: ChooseVoteWidget(),
              ),
            );
          },
        ),
        title: Text(
          'Result',
          style: FlutterFlowTheme.of(context).subtitle1.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFFF0F7EE),
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 10,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<UserModel>(
          builder: (userModel) => StreamBuilder(
              stream: FirebaseDatabase.instance
                  .ref('taswit/candidates')
                  .orderByChild('voteID')
                  .equalTo(userModel.userModel['companyID'])
                  .onValue,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  userModel.setDataInMap(snapshot.data.snapshot.value);
                  // print("item map ${userModel.item}");
                  return userModel.item == null
                      ? const Center(
                          child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.black),
                        ))
                      : SingleChildScrollView(
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height /
                                        3.4,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFF2E59D9),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      color: Color(0x39000000),
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional
                                            .fromSTEB(12, 16, 12, 24),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceAround,
                                          children: [
                                            Column(
                                              mainAxisSize:
                                                  MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                              children: [
                                                Image.asset(
                                                  'assets/images/polling_(1).png',
                                                  width: MediaQuery.of(
                                                              context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                  fit: BoxFit.cover,
                                                ),
                                                Text(
                                                  totalVote.toString(),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .title1
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Color(
                                                                0xFFF0F7EE),
                                                            fontSize: 28,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                          ),
                                                ),
                                                Text(
                                                  '# of votes',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Color(
                                                                0xFF91A8A4),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height / 2.48),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 8.0),
                                  child: ListView.builder(
                                    itemCount: userModel.item.length,

                                    // physics: const ClampingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      List listKeys = [];
                                      List listMaxNum = [];
                                      int maxNum, indexNum;
                                      totalVote = 0;
                                      userModel.item.forEach((key, value) {
                                        listKeys.add(key);
                                      });
                                      userModel.item.forEach((key, value) {
                                        totalVote =
                                            totalVote + value['votes'];
                                      });
                                      userModel.item.forEach((key, value) {
                                        listMaxNum.add(value['votes']);
                                      });
                                      maxNum = listMaxNum.reduce(
                                          (curr, next) =>
                                              curr > next ? curr : next);
                                      indexNum = listMaxNum.indexOf(maxNum);
                                      print(maxNum);
                                      print(indexNum);
                                      print("totalVote : $totalVote");
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 10, top: 6),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.96,
                                              decoration: BoxDecoration(
                                                color: index == indexNum
                                                    ? Color(0xFFB1B4C3)
                                                    : Color(0xFFB3001B),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4,
                                                    color:
                                                        Color(0x33000000),
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 6, top: 5),
                                                child:
                                                    SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      index == indexNum
                                                          ? Text(
                                                              'Winner',
                                                              style: FlutterFlowTheme.of(
                                                                      context)
                                                                  .title3
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: index ==
                                                                            indexNum
                                                                        ? Color(0xFF005F73)
                                                                        : Colors.grey,
                                                                    fontSize:
                                                                        18,
                                                                    fontStyle:
                                                                        FontStyle.italic,
                                                                  ),
                                                            )
                                                          : SizedBox(),
                                                      Text(
                                                        userModel.item[
                                                                listKeys[
                                                                    index]]
                                                                ['name']
                                                            .toString(),
                                                        textAlign: TextAlign
                                                            .center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .title2
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: index ==
                                                                      indexNum
                                                                  ? Color(
                                                                      0xFF003049)
                                                                  : Color(
                                                                      0xFFFDF0D5),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16,
                                                                    4,
                                                                    16,
                                                                    12),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                'number of votes : ${listMaxNum[index]}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: index == indexNum
                                                                          ? Color(0xFF003049)
                                                                          : Color(0xFFFDF0D5),
                                                                      fontSize:
                                                                          19,
                                                                      fontWeight:
                                                                          FontWeight.normal,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      // Padding(
                                                      //   padding:
                                                      //       EdgeInsetsDirectional
                                                      //           .fromSTEB(16, 0,
                                                      //               16, 0),
                                                      //   child: Row(
                                                      //     mainAxisSize:
                                                      //         MainAxisSize.max,
                                                      //     mainAxisAlignment:
                                                      //         MainAxisAlignment
                                                      //             .spaceBetween,
                                                      //     crossAxisAlignment:
                                                      //         CrossAxisAlignment
                                                      //             .center,
                                                      //     children: [
                                                      //       LinearPercentIndicator(
                                                      //         percent: 0.5,
                                                      //         width: 200,
                                                      //         lineHeight: 30,
                                                      //         animation: true,
                                                      //         progressColor:
                                                      //             Color(
                                                      //                 0xFF003049),
                                                      //         backgroundColor:
                                                      //             Color(
                                                      //                 0xFF457B9D),
                                                      //         center: Text(
                                                      //           '70%',
                                                      //           textAlign:
                                                      //               TextAlign
                                                      //                   .center,
                                                      //           style: FlutterFlowTheme.of(
                                                      //                   context)
                                                      //               .subtitle2
                                                      //               .override(
                                                      //                 fontFamily:
                                                      //                     'Poppins',
                                                      //                 color: Color(
                                                      //                     0xFFFDF0D5),
                                                      //               ),
                                                      //         ),
                                                      //         barRadius: Radius
                                                      //             .circular(8),
                                                      //         padding:
                                                      //             EdgeInsets
                                                      //                 .zero,
                                                      //       ),
                                                      //       // Card(
                                                      //       //   clipBehavior: Clip
                                                      //       //       .antiAliasWithSaveLayer,
                                                      //       //   color: Color(
                                                      //       //       0xFF005F73),
                                                      //       //   shape:
                                                      //       //       RoundedRectangleBorder(
                                                      //       //     borderRadius:
                                                      //       //         BorderRadius
                                                      //       //             .circular(
                                                      //       //                 40),
                                                      //       //   ),
                                                      //       //   child: Padding(
                                                      //       //     padding:
                                                      //       //         EdgeInsetsDirectional
                                                      //       //             .fromSTEB(
                                                      //       //                 2,
                                                      //       //                 2,
                                                      //       //                 2,
                                                      //       //                 2),
                                                      //       //     child:
                                                      //       //         Container(
                                                      //       //       width: 50,
                                                      //       //       height: 50,
                                                      //       //       clipBehavior:
                                                      //       //           Clip.antiAlias,
                                                      //       //       decoration:
                                                      //       //           BoxDecoration(
                                                      //       //         shape: BoxShape
                                                      //       //             .circle,
                                                      //       //       ),
                                                      //       //       child: Image
                                                      //       //           .asset(
                                                      //       //         'assets/images/userAvatar.png',
                                                      //       //       ),
                                                      //       //     ),
                                                      //       //   ),
                                                      //       // ),
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16,
                                                                    4,
                                                                    16,
                                                                    12),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                'option details',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: index == indexNum
                                                                          ? Color(0xFF003049)
                                                                          : Color(0xFFFDF0D5),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight.normal,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                      );
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.black),
                  ));
                }
              }),
        ),
      ),
    );
  }
}
