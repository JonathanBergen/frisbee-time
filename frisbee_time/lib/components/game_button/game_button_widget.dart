import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'game_button_model.dart';
export 'game_button_model.dart';

class GameButtonWidget extends StatefulWidget {
  const GameButtonWidget({
    Key? key,
    this.tomorrowTime,
  }) : super(key: key);

  final DateTime? tomorrowTime;

  @override
  _GameButtonWidgetState createState() => _GameButtonWidgetState();
}

class _GameButtonWidgetState extends State<GameButtonWidget> {
  late GameButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameButtonModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.tomorrowTime = functions.getTomorrowTime();
      });
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<GamesRecord>>(
      stream: queryGamesRecord(
        queryBuilder: (gamesRecord) => gamesRecord
            .where(
              'game_is_played',
              isEqualTo: true,
            )
            .where(
              'gametime_utc',
              isGreaterThanOrEqualTo: getCurrentTimestamp,
            )
            .where(
              'gametime_utc',
              isLessThanOrEqualTo: _model.tomorrowTime,
            ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xFF4ABDE4),
                ),
              ),
            ),
          );
        }
        List<GamesRecord> conditionalBuilderGamesRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final conditionalBuilderGamesRecord =
            conditionalBuilderGamesRecordList.isNotEmpty
                ? conditionalBuilderGamesRecordList.first
                : null;
        return Builder(
          builder: (context) {
            if ((conditionalBuilderGamesRecord != null) &&
                conditionalBuilderGamesRecord!.players
                    .contains(currentUserReference)) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    child: Text(
                      'You\'ve already agreed to participate in the game, we\'ll let you know when more people sign up.',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ],
              );
            } else if ((conditionalBuilderGamesRecord != null) &&
                conditionalBuilderGamesRecord!.gameIsPlayed &&
                conditionalBuilderGamesRecord!.notificationSent) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: RichText(
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'There\'s a confirmed game going on at ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          TextSpan(
                            text: dateTimeFormat(
                              'jm',
                              conditionalBuilderGamesRecord!.gametimeUtc!,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '. Get out  there!',
                            style: TextStyle(),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ),
                ],
              );
            } else if ((conditionalBuilderGamesRecord != null) &&
                conditionalBuilderGamesRecord!.gameIsPlayed) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: RichText(
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Looks like there\'s a game going on at ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          TextSpan(
                            text: dateTimeFormat(
                              'jm',
                              conditionalBuilderGamesRecord!.gametimeUtc!,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '. You coming?',
                            style: TextStyle(),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Not Today',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).alternate,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Lato',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(
                            queryBuilder: (usersRecord) => usersRecord.where(
                              'notifications',
                              isEqualTo: true,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xFF4ABDE4),
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<UsersRecord> buttonUsersRecordList =
                                snapshot.data!;
                            return FFButtonWidget(
                              onPressed: () async {
                                await conditionalBuilderGamesRecord!.reference
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'players': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                                if (conditionalBuilderGamesRecord!
                                        .players.length >=
                                    8) {
                                  triggerPushNotification(
                                    notificationTitle: 'Game On!',
                                    notificationText:
                                        'Game confirmed at ${dateTimeFormat(
                                      'jm',
                                      conditionalBuilderGamesRecord
                                          ?.gametimeUtc,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )}!',
                                    notificationSound: 'default',
                                    userRefs: buttonUsersRecordList
                                        .map((e) => e.reference)
                                        .toList(),
                                    initialPageName: 'Home',
                                    parameterData: {},
                                  );

                                  await conditionalBuilderGamesRecord!.reference
                                      .update(createGamesRecordData(
                                    notificationSent: true,
                                  ));
                                }
                              },
                              text: 'Game On!',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Looks like there aren\'t any games going on right now.',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }
}
