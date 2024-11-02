import '/backend/backend.dart';
import '/components/empty_widget.dart';
import '/components/header/header_widget.dart';
import '/components/special_offer_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'special_offers_model.dart';
export 'special_offers_model.dart';

class SpecialOffersWidget extends StatefulWidget {
  const SpecialOffersWidget({super.key});

  @override
  State<SpecialOffersWidget> createState() => _SpecialOffersWidgetState();
}

class _SpecialOffersWidgetState extends State<SpecialOffersWidget>
    with TickerProviderStateMixin {
  late SpecialOffersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpecialOffersModel());

    animationsMap.addAll({
      'specialOfferCardOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 1080.0.ms,
            begin: Offset(41.0, 0.0),
            end: Offset(0.0, 0.0),
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                    'h7pm8ha0' /* Special Offers */,
                  ),
                  showBackButton: true,
                ),
              ),
              FutureBuilder<List<ProductRecord>>(
                future: FFAppState().productHasSpecialOffer(
                  requestFn: () => queryProductRecordOnce(
                    queryBuilder: (productRecord) => productRecord.where(
                      'special_offer',
                      isEqualTo: true,
                    ),
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 44.0,
                        height: 44.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<ProductRecord> listViewProductRecordList =
                      snapshot.data!;
                  if (listViewProductRecordList.isEmpty) {
                    return EmptyWidget(
                      title: 'No Special offers at the moment',
                      body: 'Come back later!!!',
                      customAction: () async {},
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      24.0,
                      0,
                      24.0,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewProductRecordList.length,
                    separatorBuilder: (_, __) => SizedBox(height: 16.0),
                    itemBuilder: (context, listViewIndex) {
                      final listViewProductRecord =
                          listViewProductRecordList[listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: FutureBuilder<SpecialOfferRecord>(
                          future: FFAppState().specialOfferSingleProductRef(
                            uniqueQueryKey: valueOrDefault<String>(
                              listViewProductRecord.reference.id,
                              'productID',
                            ),
                            requestFn: () => SpecialOfferRecord.getDocumentOnce(
                                listViewProductRecord.specialOfferRef!),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 44.0,
                                  height: 44.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }

                            final specialOfferCardSpecialOfferRecord =
                                snapshot.data!;

                            return SpecialOfferCardWidget(
                              key: Key(
                                  'Key9kq_${listViewIndex}_of_${listViewProductRecordList.length}'),
                              title: specialOfferCardSpecialOfferRecord.title,
                              description: specialOfferCardSpecialOfferRecord
                                  .description,
                              image: specialOfferCardSpecialOfferRecord.image,
                            ).animateOnPageLoad(animationsMap[
                                'specialOfferCardOnPageLoadAnimation']!);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
