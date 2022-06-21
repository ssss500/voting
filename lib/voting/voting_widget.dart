import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../choose_vote/choose_vote_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../profile/profile_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../vote_confermation/vote_confermation_widget.dart';

class VotingWidget extends StatefulWidget {
  const VotingWidget({Key key}) : super(key: key);

  @override
  _VotingWidgetState createState() => _VotingWidgetState();
}

class _VotingWidgetState extends State<VotingWidget> {
  bool checkboxListTileValue;

  String idCandidates = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    UserModel userModel = Get.put(UserModel());
    return Scaffold(
      // key: scaffoldKey,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Color(0xFF4E73DF),
      ),
      backgroundColor: Color(0xFF4E73DF),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
            child: Stack(
          children: [
            Column(
              // mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
                  child: Text('please choose Option',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF0F7EE),
                        fontFamily: 'Lexend Deca',
                      )),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25, 10, 0, 10),
                  child: AutoSizeText(
                    "${userModel.descriptionVote}",
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFFF0F7EE),
                          fontSize: 18,
                        ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 120,
              bottom: 0,
              left: 1,
              right: 1,
              child: GetBuilder<UserModel>(
                builder: (userModel) => Container(
                  // height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: StreamBuilder(
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
                              : ListView.builder(
                                  itemCount: userModel.item.length,
                                  physics: const ClampingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    List listKeys = [];
                                    userModel.item.forEach((key, value) {
                                      listKeys.add(key);
                                    });
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6, 6, 6, 6),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFC0C4D3),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 1, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0),
                                                            child: Theme(
                                                              data: ThemeData(
                                                                checkboxTheme:
                                                                    CheckboxThemeData(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25),
                                                                  ),
                                                                ),
                                                                unselectedWidgetColor:
                                                                    Color(
                                                                        0xFF91A8A4),
                                                              ),
                                                              child:
                                                                  CheckboxListTile(
                                                                value: idCandidates ==
                                                                        listKeys[
                                                                            index]
                                                                    ? true
                                                                    : false,
                                                                onChanged:
                                                                    (newValue) {
                                                                  setState(() =>
                                                                      checkboxListTileValue =
                                                                          newValue);
                                                                  if (idCandidates ==
                                                                      listKeys[
                                                                          index]) {
                                                                    idCandidates =
                                                                        '';
                                                                  } else {
                                                                    idCandidates =
                                                                        listKeys[
                                                                            index];
                                                                  }

                                                                  print(userModel
                                                                          .item[
                                                                      listKeys[
                                                                          index]]);
                                                                },
                                                                title: Text(
                                                                  '${userModel.item[listKeys[index]]['name']}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .title3
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Color(
                                                                            0xFF374C49),
                                                                      ),
                                                                ),
                                                                tileColor: Color(
                                                                    0xFF91A8A4),
                                                                activeColor: Color(
                                                                    0xFF003049),
                                                                checkColor: Color(
                                                                    0xFFFDF0D5),
                                                                dense: true,
                                                                controlAffinity:
                                                                    ListTileControlAffinity
                                                                        .trailing,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
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
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: SizedBox(
                height: 80,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () {
                      functionSubmit();
                      print('Button pressed ...');
                    },
                    text: 'submit',
                    options: FFButtonOptions(
                      width: 180,
                      height: 50,
                      color: Color(0xFF4E73DF),
                      textStyle: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFFFDF0D5),
                            fontWeight: FontWeight.w600,
                          ),
                      borderSide: BorderSide(
                        color: Color(0xFF003049),
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
            // GestureDetector(
            //   onTap: () => FocusScope.of(context).unfocus(),
            //   child:
            // ),
            ),
      ),
    );
  }

  functionSubmit() async {
    await FirebaseDatabase.instance
        .ref('taswit/candidates')
        .child('$idCandidates')
        .get()
        .then((value) async {
      Map mapVote = value.value;
      int totalVotes = mapVote['votes'] + 1;
      await FirebaseDatabase.instance
          .ref('taswit/candidates')
          .child('$idCandidates')
          .update({"votes": totalVotes}).then((value) async {
        UserModel userModel = Get.put(UserModel());
        await FirebaseDatabase.instance
            .ref('taswit/users')
            .child(GetStorage().read('idUser'))
            .get()
            .then((value) async {
          Map m = value.value;
          List l=[];
            l.addAll(m['listVotes']);
          print('value.value : ${value.value}');
          print("l : $l");
          print("l : ${m['listVotes']}");
          l.add(userModel.idKey);
          print("l : $l");
          await FirebaseDatabase.instance
              .ref('taswit/users')
              .child(GetStorage().read('idUser'))
              .update({'listVotes': l});
        }).catchError((onError) async {
          List l = [];
          l.add(userModel.idKey);
          await FirebaseDatabase.instance
              .ref('taswit/users')
              .child(GetStorage().read('idUser'))
              .update({
            'listVotes': l,
            'name': userModel.userModel['name'],
            'companyID': userModel.userModel['companyID'],
            'gender': userModel.userModel['gender'],
            'phoneNumber': userModel.userModel['phoneNumber'],
            'avatar': userModel.userModel['avatar'],
            'position':userModel.userModel['position'],
            'deleted_at': userModel.userModel['deleted_at'],
            'email': userModel.userModel['email'],
            'status': userModel.userModel['status'],
            'registerDate': userModel.userModel['registerDate'],
              });
        });
        Get.offAll(()=>VoteConfermationWidget());
      });
    });
  }
}
