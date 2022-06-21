import '../choose_vote/choose_vote_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class VoteConfermationWidget extends StatefulWidget {
  const VoteConfermationWidget({Key key}) : super(key: key);

  @override
  _VoteConfermationWidgetState createState() => _VoteConfermationWidgetState();
}

class _VoteConfermationWidgetState extends State<VoteConfermationWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF090F13),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 54, 0, 0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFF4E73DF),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                  child: Icon(
                    Icons.check_rounded,
                    color: Color(0xFFFDF0D5),
                    size: 60,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 0),
              child: Text(
                'Your Vote is Done',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF4E73DF),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 0),
              child: Text(
                'The Option He Choose',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Overpass',
                  color: Color(0xFFFDF0D5),
                  fontWeight: FontWeight.w100,
                  fontSize: 36,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
              child: Text(
                'Option details',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFFA99B8F),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 200),
                            reverseDuration: Duration(milliseconds: 200),
                            child: ChooseVoteWidget(),
                          ),
                        );
                      },
                      text: 'Go Home',
                      options: FFButtonOptions(
                        width: 230,
                        height: 50,
                        color: Color(0xFF4E73DF),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFFFDF0D5),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                        elevation: 0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
