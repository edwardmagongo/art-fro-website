import '/backend/backend.dart';
import '/components/empty_widget.dart';
import '/components/product_item/product_item_widget.dart';
import '/components/side_nav_content_widget.dart';
import '/components/side_nav_widget.dart';
import '/components/special_offer_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.userCheckup(context);
      safeSetState(() {});
      FFAppState().HomePagePath =
          'artfroscentricstudios://artfroscentricstudios.store${GoRouterState.of(context).uri.toString()}';
      FFAppState().update(() {});
    });

    _model.searchTextController ??= TextEditingController();
    _model.searchFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 720.0.ms,
            begin: Offset(0.0, -27.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 1230.0.ms,
            begin: Offset(-45.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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
      'rowOnPageLoadAnimation2': AnimationInfo(
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
      'rowOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 1230.0.ms,
            begin: Offset(-45.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'choiceChipsOnPageLoadAnimation1': AnimationInfo(
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
      'gridViewOnPageLoadAnimation1': AnimationInfo(
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
      'gridViewOnPageLoadAnimation2': AnimationInfo(
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
      'gridViewOnPageLoadAnimation3': AnimationInfo(
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
      'rowOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 1230.0.ms,
            begin: Offset(-45.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'choiceChipsOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1040.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'gridViewOnPageLoadAnimation4': AnimationInfo(
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
      'gridViewOnPageLoadAnimation5': AnimationInfo(
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
      'gridViewOnPageLoadAnimation6': AnimationInfo(
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
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 100.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 1.0),
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.sideNavContentModel,
            updateCallback: () => safeSetState(() {}),
            child: SideNavContentWidget(),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Stack(
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Container(
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    wrapWithModel(
                                                      model:
                                                          _model.sideNavModel,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: SideNavWidget(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 5.0, 20.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'Search',
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .topToBottom,
                                                        duration: Duration(
                                                            milliseconds: 200),
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 48.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tfBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                FFIcons
                                                                    .ksearchDefault,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 20.0,
                                                              ),
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'p27evm8c' /* Search */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Icon(
                                                          FFIcons
                                                              .kfilterDefault,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation']!),
                                            ),
                                            StickyHeader(
                                              overlapHeaders: false,
                                              header: Container(
                                                width: double.infinity,
                                                height: 44.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'lbdslgd2' /* Special Offers */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                              'SpecialOffers');
                                                        },
                                                        child: Container(
                                                          height: 44.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '01ug56a5' /* See All */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ).animateOnPageLoad(animationsMap[
                                                      'rowOnPageLoadAnimation1']!),
                                                ),
                                              ),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 180.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .pageViewDots,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      9.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: FutureBuilder<
                                                              List<
                                                                  SpecialOfferRecord>>(
                                                            future: FFAppState()
                                                                .specialOffersAll(
                                                              requestFn: () =>
                                                                  querySpecialOfferRecordOnce(),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 44.0,
                                                                    height:
                                                                        44.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<SpecialOfferRecord>
                                                                  pageViewSpecialOfferRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                child: Stack(
                                                                  children: [
                                                                    PageView
                                                                        .builder(
                                                                      controller: _model
                                                                              .pageViewController ??=
                                                                          PageController(
                                                                              initialPage: max(0, min(0, pageViewSpecialOfferRecordList.length - 1))),
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      itemCount:
                                                                          pageViewSpecialOfferRecordList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              pageViewIndex) {
                                                                        final pageViewSpecialOfferRecord =
                                                                            pageViewSpecialOfferRecordList[pageViewIndex];
                                                                        return InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              'Products',
                                                                              queryParameters: {
                                                                                'pageTitle': serializeParam(
                                                                                  'Special Offer',
                                                                                  ParamType.String,
                                                                                ),
                                                                                'specialOffer': serializeParam(
                                                                                  pageViewSpecialOfferRecord,
                                                                                  ParamType.Document,
                                                                                ),
                                                                                'showSpecialOffer': serializeParam(
                                                                                  true,
                                                                                  ParamType.bool,
                                                                                ),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                'specialOffer': pageViewSpecialOfferRecord,
                                                                              },
                                                                            );
                                                                          },
                                                                          child:
                                                                              SpecialOfferCardWidget(
                                                                            key:
                                                                                Key('Keya1e_${pageViewIndex}_of_${pageViewSpecialOfferRecordList.length}'),
                                                                            title:
                                                                                pageViewSpecialOfferRecord.title,
                                                                            description:
                                                                                pageViewSpecialOfferRecord.description,
                                                                            image:
                                                                                pageViewSpecialOfferRecord.image,
                                                                          ),
                                                                        ).animateOnPageLoad(
                                                                            animationsMap['specialOfferCardOnPageLoadAnimation']!);
                                                                      },
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child: smooth_page_indicator
                                                                            .SmoothPageIndicator(
                                                                          controller: _model.pageViewController ??=
                                                                              PageController(initialPage: max(0, min(0, pageViewSpecialOfferRecordList.length - 1))),
                                                                          count:
                                                                              pageViewSpecialOfferRecordList.length,
                                                                          axisDirection:
                                                                              Axis.horizontal,
                                                                          onDotClicked:
                                                                              (i) async {
                                                                            await _model.pageViewController!.animateToPage(
                                                                              i,
                                                                              duration: Duration(milliseconds: 500),
                                                                              curve: Curves.ease,
                                                                            );
                                                                            safeSetState(() {});
                                                                          },
                                                                          effect:
                                                                              smooth_page_indicator.ExpandingDotsEffect(
                                                                            expansionFactor:
                                                                                3.0,
                                                                            spacing:
                                                                                8.0,
                                                                            radius:
                                                                                16.0,
                                                                            dotWidth:
                                                                                8.0,
                                                                            dotHeight:
                                                                                4.0,
                                                                            dotColor:
                                                                                FlutterFlowTheme.of(context).grayTextMiddle,
                                                                            activeDotColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            paintStyle:
                                                                                PaintingStyle.fill,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'Products',
                                                                      queryParameters:
                                                                          {
                                                                        'pageTitle':
                                                                            serializeParam(
                                                                          'All Products',
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              60.0,
                                                                          height:
                                                                              60.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).pageViewDots,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            FFIcons.kscanDash,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              12.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '3sij1y1o' /* See All */,
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Inter',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'Products',
                                                                      queryParameters:
                                                                          {
                                                                        'pageTitle':
                                                                            serializeParam(
                                                                          FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                            enText:
                                                                                'Paintings',
                                                                            esText:
                                                                                'Productos de maiz',
                                                                            frText:
                                                                                'Produits à base de maïs',
                                                                            arText:
                                                                                'منتجات الذرة',
                                                                            swText:
                                                                                'Bidhaa za mahindi',
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'showActiveCategory':
                                                                            serializeParam(
                                                                          'Painting',
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              60.0,
                                                                          height:
                                                                              60.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).pageViewDots,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.paintBrush,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              12.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'o4957ied' /* Paintings */,
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Inter',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'Products',
                                                                      queryParameters:
                                                                          {
                                                                        'pageTitle':
                                                                            serializeParam(
                                                                          FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                            enText:
                                                                                'Digital Art',
                                                                            esText:
                                                                                'Productos de arroz',
                                                                            frText:
                                                                                ' Produits à base de riz',
                                                                            arText:
                                                                                'منتجات الأرز',
                                                                            swText:
                                                                                ' Bidhaa za Mchele',
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'showActiveCategory':
                                                                            serializeParam(
                                                                          'Digital Art',
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              60.0,
                                                                          height:
                                                                              60.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).pageViewDots,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            FFIcons.kphoto,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              12.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '9go13jj7' /* Digital Art */,
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Inter',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 16.0)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ).animateOnPageLoad(
                                                            animationsMap[
                                                                'rowOnPageLoadAnimation2']!),
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 24.0))
                                                    .addToStart(
                                                        SizedBox(height: 24.0))
                                                    .addToEnd(
                                                        SizedBox(height: 24.0)),
                                              ),
                                            ),
                                            StickyHeader(
                                              overlapHeaders: false,
                                              header: Container(
                                                width: double.infinity,
                                                height: 44.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'aszp23yf' /* Most Popular */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'Products',
                                                            queryParameters: {
                                                              'pageTitle':
                                                                  serializeParam(
                                                                'Most Popular',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'showMostPopular':
                                                                  serializeParam(
                                                                true,
                                                                ParamType.bool,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          height: 44.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'ipp5knbn' /* See All */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ).animateOnPageLoad(animationsMap[
                                                      'rowOnPageLoadAnimation3']!),
                                                ),
                                              ),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowChoiceChips(
                                                                  options: FFAppState()
                                                                      .Categories
                                                                      .map((label) =>
                                                                          ChipData(
                                                                              label))
                                                                      .toList(),
                                                                  onChanged:
                                                                      (val) async {
                                                                    safeSetState(() =>
                                                                        _model.choiceChipsValue1 =
                                                                            val?.firstOrNull);
                                                                    _model.categori =
                                                                        _model
                                                                            .choiceChipsValue1!;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  selectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    iconSize:
                                                                        18.0,
                                                                    elevation:
                                                                        0.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    borderWidth:
                                                                        2.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            55.0),
                                                                  ),
                                                                  unselectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    iconSize:
                                                                        18.0,
                                                                    elevation:
                                                                        0.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    borderWidth:
                                                                        2.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            55.0),
                                                                  ),
                                                                  chipSpacing:
                                                                      12.0,
                                                                  rowSpacing:
                                                                      12.0,
                                                                  multiselect:
                                                                      false,
                                                                  initialized:
                                                                      _model.choiceChipsValue1 !=
                                                                          null,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  controller: _model
                                                                          .choiceChipsValueController1 ??=
                                                                      FormFieldController<
                                                                          List<
                                                                              String>>(
                                                                    [
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'uruostoc' /* All */,
                                                                      )
                                                                    ],
                                                                  ),
                                                                  wrapped:
                                                                      false,
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'choiceChipsOnPageLoadAnimation1']!),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    FutureBuilder<
                                                        List<ProductRecord>>(
                                                      future:
                                                          queryProductRecordOnce(
                                                        queryBuilder:
                                                            (productRecord) =>
                                                                productRecord
                                                                    .where(
                                                          'popular',
                                                          isEqualTo: true,
                                                        ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 44.0,
                                                              height: 44.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<ProductRecord>
                                                            containerProductRecordList =
                                                            snapshot.data!;

                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final product = containerProductRecordList
                                                                    .where((e) =>
                                                                        (_model.categori ==
                                                                            'All') ||
                                                                        (e.category ==
                                                                            _model.categori))
                                                                    .toList();
                                                                if (product
                                                                    .isEmpty) {
                                                                  return EmptyWidget(
                                                                    body:
                                                                        'No item in the categry',
                                                                    animation:
                                                                        'https://lottie.host/fc043dd1-5f46-45d5-860f-d5eff262bc9c/pILPeWn1HL.json',
                                                                    customAction:
                                                                        () async {},
                                                                  );
                                                                }

                                                                return GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        2,
                                                                    crossAxisSpacing:
                                                                        10.0,
                                                                    mainAxisSpacing:
                                                                        10.0,
                                                                    childAspectRatio:
                                                                        0.58,
                                                                  ),
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      product
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          productIndex) {
                                                                    final productItem =
                                                                        product[
                                                                            productIndex];
                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'Detail',
                                                                          queryParameters:
                                                                              {
                                                                            'product':
                                                                                serializeParam(
                                                                              productItem,
                                                                              ParamType.Document,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            'product':
                                                                                productItem,
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          ProductItemWidget(
                                                                        key: Key(
                                                                            'Keyll5_${productIndex}_of_${product.length}'),
                                                                        price: productItem
                                                                            .productInformation
                                                                            .price,
                                                                        rate: productItem
                                                                            .productInformation
                                                                            .rate,
                                                                        totalSold: productItem
                                                                            .productInformation
                                                                            .sold,
                                                                        image: productItem
                                                                            .productInformation
                                                                            .productCover,
                                                                        itemName: productItem
                                                                            .productInformation
                                                                            .name,
                                                                      ),
                                                                    );
                                                                  },
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'gridViewOnPageLoadAnimation1']!);
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    desktop: false,
                                                  ))
                                                    FutureBuilder<
                                                        List<ProductRecord>>(
                                                      future:
                                                          queryProductRecordOnce(
                                                        queryBuilder:
                                                            (productRecord) =>
                                                                productRecord
                                                                    .where(
                                                          'popular',
                                                          isEqualTo: true,
                                                        ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 44.0,
                                                              height: 44.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<ProductRecord>
                                                            containerProductRecordList =
                                                            snapshot.data!;

                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final product = containerProductRecordList
                                                                    .where((e) =>
                                                                        (_model.categori ==
                                                                            'All') ||
                                                                        (e.category ==
                                                                            _model.categori))
                                                                    .toList();
                                                                if (product
                                                                    .isEmpty) {
                                                                  return EmptyWidget(
                                                                    body:
                                                                        'No item in the categry',
                                                                    customAction:
                                                                        () async {},
                                                                  );
                                                                }

                                                                return GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        3,
                                                                    crossAxisSpacing:
                                                                        10.0,
                                                                    mainAxisSpacing:
                                                                        10.0,
                                                                    childAspectRatio:
                                                                        0.85,
                                                                  ),
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      product
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          productIndex) {
                                                                    final productItem =
                                                                        product[
                                                                            productIndex];
                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'Detail',
                                                                          queryParameters:
                                                                              {
                                                                            'product':
                                                                                serializeParam(
                                                                              productItem,
                                                                              ParamType.Document,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            'product':
                                                                                productItem,
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          ProductItemWidget(
                                                                        key: Key(
                                                                            'Keyu2s_${productIndex}_of_${product.length}'),
                                                                        price: productItem
                                                                            .productInformation
                                                                            .price,
                                                                        rate: productItem
                                                                            .productInformation
                                                                            .rate,
                                                                        totalSold: productItem
                                                                            .productInformation
                                                                            .sold,
                                                                        image: productItem
                                                                            .productInformation
                                                                            .productCover,
                                                                        itemName: productItem
                                                                            .productInformation
                                                                            .name,
                                                                      ),
                                                                    );
                                                                  },
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'gridViewOnPageLoadAnimation2']!);
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                  ))
                                                    FutureBuilder<
                                                        List<ProductRecord>>(
                                                      future:
                                                          queryProductRecordOnce(
                                                        queryBuilder:
                                                            (productRecord) =>
                                                                productRecord
                                                                    .where(
                                                          'popular',
                                                          isEqualTo: true,
                                                        ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 44.0,
                                                              height: 44.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<ProductRecord>
                                                            containerProductRecordList =
                                                            snapshot.data!;

                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final product = containerProductRecordList
                                                                    .where((e) =>
                                                                        (_model.categori ==
                                                                            'All') ||
                                                                        (e.category ==
                                                                            _model.categori))
                                                                    .toList();
                                                                if (product
                                                                    .isEmpty) {
                                                                  return EmptyWidget(
                                                                    body:
                                                                        'No item in the categry',
                                                                    customAction:
                                                                        () async {},
                                                                  );
                                                                }

                                                                return GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        5,
                                                                    crossAxisSpacing:
                                                                        10.0,
                                                                    mainAxisSpacing:
                                                                        10.0,
                                                                    childAspectRatio:
                                                                        0.7,
                                                                  ),
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      product
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          productIndex) {
                                                                    final productItem =
                                                                        product[
                                                                            productIndex];
                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'Detail',
                                                                          queryParameters:
                                                                              {
                                                                            'product':
                                                                                serializeParam(
                                                                              productItem,
                                                                              ParamType.Document,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            'product':
                                                                                productItem,
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          ProductItemWidget(
                                                                        key: Key(
                                                                            'Keywa2_${productIndex}_of_${product.length}'),
                                                                        price: productItem
                                                                            .productInformation
                                                                            .price,
                                                                        rate: productItem
                                                                            .productInformation
                                                                            .rate,
                                                                        totalSold: productItem
                                                                            .productInformation
                                                                            .sold,
                                                                        image: productItem
                                                                            .productInformation
                                                                            .productCover,
                                                                        itemName: productItem
                                                                            .productInformation
                                                                            .name,
                                                                      ),
                                                                    );
                                                                  },
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'gridViewOnPageLoadAnimation3']!);
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 24.0))
                                                    .addToStart(
                                                        SizedBox(height: 24.0))
                                                    .addToEnd(
                                                        SizedBox(height: 24.0)),
                                              ),
                                            ),
                                            StickyHeader(
                                              overlapHeaders: false,
                                              header: Container(
                                                width: double.infinity,
                                                height: 44.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ng3f0im0' /* Hot Items */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'Products',
                                                            queryParameters: {
                                                              'pageTitle':
                                                                  serializeParam(
                                                                'Hot Products',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          height: 44.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'q2qulga1' /* See All */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ).animateOnPageLoad(animationsMap[
                                                      'rowOnPageLoadAnimation4']!),
                                                ),
                                              ),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowChoiceChips(
                                                                  options: FFAppState()
                                                                      .Categories
                                                                      .map((label) =>
                                                                          ChipData(
                                                                              label))
                                                                      .toList(),
                                                                  onChanged:
                                                                      (val) async {
                                                                    safeSetState(() =>
                                                                        _model.choiceChipsValue2 =
                                                                            val?.firstOrNull);
                                                                    _model.categori =
                                                                        _model
                                                                            .choiceChipsValue2!;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  selectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    iconSize:
                                                                        18.0,
                                                                    elevation:
                                                                        0.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    borderWidth:
                                                                        2.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            55.0),
                                                                  ),
                                                                  unselectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    iconSize:
                                                                        18.0,
                                                                    elevation:
                                                                        0.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    borderWidth:
                                                                        2.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            55.0),
                                                                  ),
                                                                  chipSpacing:
                                                                      12.0,
                                                                  rowSpacing:
                                                                      12.0,
                                                                  multiselect:
                                                                      false,
                                                                  initialized:
                                                                      _model.choiceChipsValue2 !=
                                                                          null,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  controller: _model
                                                                          .choiceChipsValueController2 ??=
                                                                      FormFieldController<
                                                                          List<
                                                                              String>>(
                                                                    [
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'pwhldtcf' /* All */,
                                                                      )
                                                                    ],
                                                                  ),
                                                                  wrapped:
                                                                      false,
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'choiceChipsOnPageLoadAnimation2']!),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    FutureBuilder<
                                                        List<ProductRecord>>(
                                                      future:
                                                          queryProductRecordOnce(
                                                        queryBuilder: (productRecord) =>
                                                            productRecord.orderBy(
                                                                'product_information.sold',
                                                                descending:
                                                                    true),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 44.0,
                                                              height: 44.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<ProductRecord>
                                                            containerProductRecordList =
                                                            snapshot.data!;

                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final product = containerProductRecordList
                                                                    .where((e) =>
                                                                        (_model.categori ==
                                                                            'All') ||
                                                                        (e.category ==
                                                                            _model.categori))
                                                                    .toList();
                                                                if (product
                                                                    .isEmpty) {
                                                                  return EmptyWidget(
                                                                    body:
                                                                        'No item in the categry',
                                                                    animation:
                                                                        'https://lottie.host/fc043dd1-5f46-45d5-860f-d5eff262bc9c/pILPeWn1HL.json',
                                                                    customAction:
                                                                        () async {},
                                                                  );
                                                                }

                                                                return GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        2,
                                                                    crossAxisSpacing:
                                                                        10.0,
                                                                    mainAxisSpacing:
                                                                        10.0,
                                                                    childAspectRatio:
                                                                        0.56,
                                                                  ),
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      product
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          productIndex) {
                                                                    final productItem =
                                                                        product[
                                                                            productIndex];
                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'Detail',
                                                                          queryParameters:
                                                                              {
                                                                            'product':
                                                                                serializeParam(
                                                                              productItem,
                                                                              ParamType.Document,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            'product':
                                                                                productItem,
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          ProductItemWidget(
                                                                        key: Key(
                                                                            'Keytyl_${productIndex}_of_${product.length}'),
                                                                        price: productItem
                                                                            .productInformation
                                                                            .price,
                                                                        rate: productItem
                                                                            .productInformation
                                                                            .rate,
                                                                        totalSold: productItem
                                                                            .productInformation
                                                                            .sold,
                                                                        image: productItem
                                                                            .productInformation
                                                                            .productCover,
                                                                        itemName: productItem
                                                                            .productInformation
                                                                            .name,
                                                                      ),
                                                                    );
                                                                  },
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'gridViewOnPageLoadAnimation4']!);
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    desktop: false,
                                                  ))
                                                    FutureBuilder<
                                                        List<ProductRecord>>(
                                                      future:
                                                          queryProductRecordOnce(
                                                        queryBuilder: (productRecord) =>
                                                            productRecord.orderBy(
                                                                'product_information.sold',
                                                                descending:
                                                                    true),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 44.0,
                                                              height: 44.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<ProductRecord>
                                                            containerProductRecordList =
                                                            snapshot.data!;

                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final product = containerProductRecordList
                                                                    .where((e) =>
                                                                        (_model.categori ==
                                                                            'All') ||
                                                                        (e.category ==
                                                                            _model.categori))
                                                                    .toList();
                                                                if (product
                                                                    .isEmpty) {
                                                                  return EmptyWidget(
                                                                    body:
                                                                        'No item in the categry',
                                                                    customAction:
                                                                        () async {},
                                                                  );
                                                                }

                                                                return GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        3,
                                                                    crossAxisSpacing:
                                                                        10.0,
                                                                    mainAxisSpacing:
                                                                        10.0,
                                                                    childAspectRatio:
                                                                        0.85,
                                                                  ),
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      product
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          productIndex) {
                                                                    final productItem =
                                                                        product[
                                                                            productIndex];
                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'Detail',
                                                                          queryParameters:
                                                                              {
                                                                            'product':
                                                                                serializeParam(
                                                                              productItem,
                                                                              ParamType.Document,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            'product':
                                                                                productItem,
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          ProductItemWidget(
                                                                        key: Key(
                                                                            'Keygm3_${productIndex}_of_${product.length}'),
                                                                        price: productItem
                                                                            .productInformation
                                                                            .price,
                                                                        rate: productItem
                                                                            .productInformation
                                                                            .rate,
                                                                        totalSold: productItem
                                                                            .productInformation
                                                                            .sold,
                                                                        image: productItem
                                                                            .productInformation
                                                                            .productCover,
                                                                        itemName: productItem
                                                                            .productInformation
                                                                            .name,
                                                                      ),
                                                                    );
                                                                  },
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'gridViewOnPageLoadAnimation5']!);
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                  ))
                                                    FutureBuilder<
                                                        List<ProductRecord>>(
                                                      future:
                                                          queryProductRecordOnce(
                                                        queryBuilder: (productRecord) =>
                                                            productRecord.orderBy(
                                                                'product_information.sold',
                                                                descending:
                                                                    true),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 44.0,
                                                              height: 44.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<ProductRecord>
                                                            containerProductRecordList =
                                                            snapshot.data!;

                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final product = containerProductRecordList
                                                                    .where((e) =>
                                                                        (_model.categori ==
                                                                            'All') ||
                                                                        (e.category ==
                                                                            _model.categori))
                                                                    .toList();
                                                                if (product
                                                                    .isEmpty) {
                                                                  return EmptyWidget(
                                                                    body:
                                                                        'No item in the categry',
                                                                    customAction:
                                                                        () async {},
                                                                  );
                                                                }

                                                                return GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        5,
                                                                    crossAxisSpacing:
                                                                        10.0,
                                                                    mainAxisSpacing:
                                                                        10.0,
                                                                    childAspectRatio:
                                                                        0.7,
                                                                  ),
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      product
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          productIndex) {
                                                                    final productItem =
                                                                        product[
                                                                            productIndex];
                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'Detail',
                                                                          queryParameters:
                                                                              {
                                                                            'product':
                                                                                serializeParam(
                                                                              productItem,
                                                                              ParamType.Document,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            'product':
                                                                                productItem,
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          ProductItemWidget(
                                                                        key: Key(
                                                                            'Keyo2p_${productIndex}_of_${product.length}'),
                                                                        price: productItem
                                                                            .productInformation
                                                                            .price,
                                                                        rate: productItem
                                                                            .productInformation
                                                                            .rate,
                                                                        totalSold: productItem
                                                                            .productInformation
                                                                            .sold,
                                                                        image: productItem
                                                                            .productInformation
                                                                            .productCover,
                                                                        itemName: productItem
                                                                            .productInformation
                                                                            .name,
                                                                      ),
                                                                    );
                                                                  },
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'gridViewOnPageLoadAnimation6']!);
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 24.0))
                                                    .addToStart(
                                                        SizedBox(height: 24.0))
                                                    .addToEnd(
                                                        SizedBox(height: 24.0)),
                                              ),
                                            ),
                                          ].addToEnd(SizedBox(height: 24.0)),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 80.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context
                                                  .pushNamed('CustomerSupport');
                                            },
                                            child: Container(
                                              width: 54.0,
                                              height: 54.0,
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 1.0),
                                                    child: Container(
                                                      width: 54.0,
                                                      height: 54.0,
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 15.0,
                                                            color: Color(
                                                                0x724B39EF),
                                                            offset: Offset(
                                                              0.0,
                                                              8.0,
                                                            ),
                                                          )
                                                        ],
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                            Color(0xFF231693)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1.0),
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        FFIcons.kchatDefault,
                                                        color: Colors.white,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 10.0,
                                                        height: 10.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'stackOnPageLoadAnimation']!),
                                        ),
                                      ),
                                      if (false)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 70.0, 0.0, 0.0),
                                          child: Stack(
                                            children: [
                                              if ((_model.searchFocusNode
                                                      ?.hasFocus ??
                                                  false))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 15.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 300.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 22.0,
                                                          color:
                                                              Color(0x19000000),
                                                          offset: Offset(
                                                            0.0,
                                                            8.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              11.0),
                                                    ),
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 5.0, 20.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 48.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tfBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 125.0,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .searchTextController,
                                                            focusNode: _model
                                                                .searchFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.searchTextController',
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                              () =>
                                                                  safeSetState(
                                                                      () {}),
                                                            ),
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: false,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Urbanist',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'xtinlnl2' /* Search */,
                                                              ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              prefixIcon: Icon(
                                                                FFIcons
                                                                    .ksearchDefault,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 18.0,
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .searchTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 10.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          FFIcons.kfilter,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 18.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                    ],
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
