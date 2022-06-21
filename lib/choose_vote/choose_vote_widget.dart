import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:voting/index.dart';
import 'package:voting/switch_login.dart';

import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../profile/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseVoteWidget extends StatefulWidget {
  const ChooseVoteWidget({Key key}) : super(key: key);

  @override
  _ChooseVoteWidgetState createState() => _ChooseVoteWidgetState();
}

class _ChooseVoteWidgetState extends State<ChooseVoteWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'tabBarOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
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
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

  UserModel userModel = Get.put(UserModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Please choose vote',
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFFF0F7EE),
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Color(0xFF4E73DF),
      ),
      backgroundColor: Color(0xFFF0F7EE),
      drawer: drawerWidget(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Color(0xFF4E73DF),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // Padding(
                          //   padding:
                          //       EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     children: [
                          //       Text(
                          //         'Please choose vote',
                          //         style: FlutterFlowTheme.of(context)
                          //             .title1
                          //             .override(
                          //               fontFamily: 'Lexend Deca',
                          //               color: Color(0xFFF0F7EE),
                          //               fontSize: 28,
                          //               fontWeight: FontWeight.w500,
                          //             ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 4, 0),
                                      child: Icon(
                                        Icons.search_rounded,
                                        color: Color(0xFF003049),
                                        size: 24,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 0, 0),
                                        child: TextFormField(
                                          onChanged: (c) {
                                            userModel.search = c;
                                            userModel.update();
                                          },
                                          // controller:
                                          //     userModel.textSearchController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Search votes...',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF82878C),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF95A1AC),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x004B39EF),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x004B39EF),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF003049),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            labelColor: Color(0xFF4E73DF),
                            unselectedLabelColor: Color(0xFF999CB0),
                            labelStyle:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Lexend Deca',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                            indicatorColor: Color(0xFF4E73DF),
                            tabs: [
                              Tab(
                                text: 'Not Done',
                              ),
                              Tab(
                                text: 'Done',
                              ),
                            ],
                          ),
                          Expanded(
                            child: GetBuilder<UserModel>(
                              builder: (userModelController) => StreamBuilder(
                                  stream: FirebaseDatabase.instance
                                      .ref('taswit/votes')
                                      .orderByChild('companyID')
                                      .equalTo(userModelController
                                          .userModel['companyID'])
                                      .onValue,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      // DatabaseEvent dataValues =
                                      //     snapshot.data as DatabaseEvent;

                                      userModelController.setDataInMap(
                                          snapshot.data.snapshot.value);
                                      print(
                                          "item : ${userModelController.item}");
                                      if(userModel.userModel['listVotes']==null){
                                        print(' hi ');
                                        userModel.userModel['listVotes']=[''];
                                      }
                                      print("userModel.userModel['listVotes'] : ${userModel.userModel['listVotes']}");
                                      return userModelController.item == null
                                          ? const Center(
                                              child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.black),
                                            ))
                                          : TabBarView(
                                              children: [
                                                ListView.builder(
                                                    itemCount:
                                                        userModelController
                                                            .item.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return listWidget(
                                                          userModelController
                                                              .item,
                                                          index,
                                                          'not done');
                                                    }),
                                                ListView.builder(
                                                    itemCount:
                                                        userModelController
                                                            .item.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return listWidget(
                                                          userModelController
                                                              .item,
                                                          index,
                                                          'done');
                                                    }),
                                              ],
                                            );
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.black),
                                      ));
                                    }
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ).animated(
                        [animationsMap['tabBarOnActionTriggerAnimation']]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerWidget() {
    return Drawer(
      elevation: 16,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/images/group.png',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          itemDrawerWidget(
              onTap: () {
                Get.back();
                Get.to(() => ProfileWidget());
              },
              title: 'Profile',
              icon: Icons.person_sharp),
          // itemDrawerWidget(onTap:(){
          //   Get.back();
          //   Get.to(() => ChooseVoteWidget());
          // }, title:  'Choose Vote', icon:  Icons.how_to_vote),
          itemDrawerWidget(
              onTap: () {
                GetStorage().remove('idUser');
                GetStorage().remove('phoneNumber');
                Get.to(SwitchLogin());
              },
              title: 'Logout',
              icon: Icons.logout),
        ],
      ),
    );
  }

  itemDrawerWidget({onTap, title, icon}) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
      child: InkWell(
        onTap: () async {
          onTap();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                icon,
                color: Color(0xFF4E73DF),
                size: 30,
              ),
            ),
            title: Text(
              title,
              style: FlutterFlowTheme.of(context).title3.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF14213D),
                  ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF4E73DF),
                size: 20,
              ),
            ),
            tileColor: Color(0xFFE5E5E5),
            dense: false,
            contentPadding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  listWidget(item, index, type) {
    List listKeys = [];
    try {
      item.forEach((key, value) {
        listKeys.add(key);
      });
      userModel.update();
    } catch (e) {
      print(e);
    }

    // print(userModel.userModel['companyID']);
    // print(item);

    try {
      ///
      if (userModel.search.isNotEmpty || userModel.search != '') {
        bool isContains = item[listKeys[index]]['name']
            .toLowerCase()
            .contains(userModel.search);

        print(
            "userModel.userModel['listVotes'] 2 : ${userModel.userModel['listVotes']}");
        if (isContains) {
          return type == 'not done'
              ? !userModel.userModel['listVotes']
                      .contains(listKeys[index])
                  ? cardVotes(item: item[listKeys[index]], type: type,key:listKeys[index])
                  : const SizedBox()
              :
              //done
              userModel.userModel['listVotes']
                  .contains(listKeys[index])
                  ? cardVotes(item: item[listKeys[index]], type: type,key:listKeys[index])
                  : const SizedBox();
        } else {
          return const SizedBox();
        }
      } else {
        print(
            "userModel.userModel['listVotes'] 2 : ${userModel.userModel['listVotes']}");   print(
            "userModel.userModel['listVotes'] 2 : ${item[listKeys[index]]['companyID']}");
        return type == 'not done'
            ? !userModel.userModel['listVotes']
            .contains(listKeys[index])
                ? cardVotes(item: item[listKeys[index]], type: type,key:listKeys[index])
                : const SizedBox()
            :
            //done
            userModel.userModel['listVotes']
                .contains(listKeys[index])
                ? cardVotes(item: item[listKeys[index]], type: type,key:listKeys[index] )
                : const SizedBox();
      }
    } catch (e) {
      print(e);
      return const SizedBox();
    }
  }

  Widget cardVotes({item, type,key}) {
    // DateTime startDate = DateTime.fromMicrosecondsSinceEpoch('1655713080');
    DateTime startDate =
        DateTime.fromMillisecondsSinceEpoch(item['startDate'] * 1000);
    DateTime endDate =
        DateTime.fromMillisecondsSinceEpoch(item['endDate'] * 1000);
    DateTime now = DateTime.now();
    // print('now: $now');
    // print('startDate: $startDate');
    // print('endDate: $endDate');
    // print(startDate.isBefore(now));
    // print(endDate.isAfter(now));
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputStartDate = outputFormat.format(startDate);

    print('startDate: $outputStartDate');
    return InkWell(
      onTap: () {
        if (type == 'not done') {
          if (!startDate.isBefore(now)) {
            UserModel userModel = Get.put(UserModel());
            userModel.descriptionVote = item['description'];
            userModel.titleVote = item['name'];
            userModel.typeVote = item['type'];
            userModel.statusVote = item['status'];
            userModel.idKey =key;
            print(item);
            Get.to(VotingWidget());
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('You cannot vote at the moment')),
            );
          }
        } else {
          if (endDate.isAfter(now)) {
            Get.to(() => ResultWidget());
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('You cannot view the result at the moment')),
            );
          }
        }
      },
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 3, 10, 3),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          padding: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: Color(0xFFC0C4D3),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(0xFFFDF0D5),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          item['name'],
                          style:
                              FlutterFlowTheme.of(context).subtitle1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFFF0F7EE),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 4, 0),
                            child: Text(
                              !endDate.isAfter(now)
                                  ? 'Voting is over'
                                  : startDate.isBefore(now)
                                      ? 'Voting is now available!'
                                      : 'Voting starts in $outputStartDate',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFFF0F7EE),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chevron_right_rounded,
                      color: Color(0xFFFDF0D5),
                      size: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserModel extends GetxController {
  Map userModel = {};
  Map item = {};
  String search = '';

  String descriptionVote = '', titleVote = '', typeVote = '',idKey;
  int statusVote;

  @override
  onInit() {
    startFun();
    super.onInit();
  }

  void startFun() {
    userModel = {
      'name': "",
      'companyID': "",
      'gender': "",
      'phoneNumber': "",
      'avatar': '',
      'position': "",
      'deleted_at': "",
      'email': "",
      'status': "",
      'registerDate': "",
      'listVotes': [],
    };
    FirebaseDatabase.instance
        .ref("taswit/users/")
        .child(GetStorage().read('idUser'))
        .onValue
        .listen((e) {
      Map event = e.snapshot.value;
      // print(event);
      print("name : " + event['name']);
      userModel['name'] = event['name'];
      userModel['companyID'] = event['companyID'];
      userModel['gender'] = event['gender'];
      userModel['phoneNumber'] = event['phoneNumber'];
      userModel['avatar'] = event['avatar'];
      userModel['position'] = event['position'];
      userModel['deleted_at'] = event['deleted_at'];
      userModel['email'] = event['email'];
      userModel['status'] = event['status'];
      userModel['registerDate'] = event['registerDate'];
      userModel['listVotes'] = event['listVotes'];

      // print("model user : $userModel");
      update();
    });
  }

  void setDataInMap(value) {
    item = value;
  }
}
