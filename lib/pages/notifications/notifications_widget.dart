import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_widget.dart';
import '/components/header/header_widget.dart';
import '/components/notification_item/notification_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget>
    with TickerProviderStateMixin {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());

    animationsMap.addAll({
      'listViewOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1040.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'listViewOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1040.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NotificationsRecord>>(
      stream: queryNotificationsRecord(
        queryBuilder: (notificationsRecord) => notificationsRecord.where(
          'user_ref',
          isEqualTo: currentUserReference,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 44.0,
                height: 44.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<NotificationsRecord> notificationsNotificationsRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  wrapWithModel(
                    model: _model.headerModel,
                    updateCallback: () => safeSetState(() {}),
                    child: HeaderWidget(
                      title: FFLocalizations.of(context).getText(
                        '03vq7asq' /* Notifications */,
                      ),
                      showBackButton: true,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'gnsmzrop' /* New */,
                                            ),
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Urbanist',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final notSeen =
                                            notificationsNotificationsRecordList
                                                .where((e) => !e.seen)
                                                .toList();
                                        if (notSeen.isEmpty) {
                                          return EmptyWidget(
                                            body: 'No new notification.',
                                            animation:
                                                'https://lottie.host/cc1d8cc4-8b18-4660-adfc-d3f7073ead6e/Rh1msvX3L4.json',
                                            customAction: () async {},
                                          );
                                        }

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: notSeen.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 8.0),
                                          itemBuilder: (context, notSeenIndex) {
                                            final notSeenItem =
                                                notSeen[notSeenIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await notSeenItem.reference.update(
                                                    createNotificationsRecordData(
                                                  seen: true,
                                                ));
                                              },
                                              child: NotificationItemWidget(
                                                key: Key(
                                                    'Keydxj_${notSeenIndex}_of_${notSeen.length}'),
                                                subject: notSeenItem.subject,
                                                message: notSeenItem.message,
                                                seen: false,
                                              ),
                                            );
                                          },
                                        ).animateOnPageLoad(animationsMap[
                                            'listViewOnPageLoadAnimation1']!);
                                      },
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'z5cmvjlf' /* Seen */,
                                            ),
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Urbanist',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final seen =
                                            notificationsNotificationsRecordList
                                                .where((e) => e.seen)
                                                .toList();
                                        if (seen.isEmpty) {
                                          return EmptyWidget(
                                            body: 'No seen notifications.',
                                            animation:
                                                'https://lottie.host/90310905-6201-460b-8241-152e4a4c8443/4Fu9tEXMRm.json',
                                            customAction: () async {},
                                          );
                                        }

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: seen.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 8.0),
                                          itemBuilder: (context, seenIndex) {
                                            final seenItem = seen[seenIndex];
                                            return NotificationItemWidget(
                                              key: Key(
                                                  'Keylql_${seenIndex}_of_${seen.length}'),
                                              subject: seenItem.subject,
                                              message: seenItem.message,
                                              seen: true,
                                            );
                                          },
                                        ).animateOnPageLoad(animationsMap[
                                            'listViewOnPageLoadAnimation2']!);
                                      },
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ].divide(SizedBox(height: 36.0)),
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(height: 24.0))
                            .addToEnd(SizedBox(height: 24.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
