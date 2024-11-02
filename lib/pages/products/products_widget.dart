import '/backend/backend.dart';
import '/components/empty_widget.dart';
import '/components/header/header_widget.dart';
import '/components/product_item/product_item_widget.dart';
import '/components/special_offer_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'products_model.dart';
export 'products_model.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({
    super.key,
    String? pageTitle,
    this.specialOffer,
    bool? showMostPopular,
    bool? showSpecialOffer,
    String? showActiveCategory,
  })  : this.pageTitle = pageTitle ?? 'Most Popular',
        this.showMostPopular = showMostPopular ?? false,
        this.showSpecialOffer = showSpecialOffer ?? false,
        this.showActiveCategory = showActiveCategory ?? 'All';

  final String pageTitle;
  final SpecialOfferRecord? specialOffer;
  final bool showMostPopular;
  final bool showSpecialOffer;
  final String showActiveCategory;

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget>
    with TickerProviderStateMixin {
  late ProductsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.categori = widget!.showActiveCategory;
      safeSetState(() {});
    });

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
      'choiceChipsOnPageLoadAnimation': AnimationInfo(
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
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                wrapWithModel(
                  model: _model.headerModel,
                  updateCallback: () => safeSetState(() {}),
                  child: HeaderWidget(
                    title: 'Artwork currently available',
                    showBackButton: true,
                  ),
                ),
                if (widget!.showSpecialOffer && (widget!.specialOffer != null))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14.0),
                      child: Container(
                        width: double.infinity,
                        height: 150.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: wrapWithModel(
                          model: _model.specialOfferCardModel,
                          updateCallback: () => safeSetState(() {}),
                          child: SpecialOfferCardWidget(
                            title: widget!.specialOffer!.title,
                            description: widget!.specialOffer!.description,
                            image: widget!.specialOffer!.image,
                          ),
                        ).animateOnPageLoad(animationsMap[
                            'specialOfferCardOnPageLoadAnimation']!),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowChoiceChips(
                                  options: FFAppState()
                                      .Categories
                                      .map((label) => ChipData(label))
                                      .toList(),
                                  onChanged: (val) async {
                                    safeSetState(() => _model.choiceChipsValue =
                                        val?.firstOrNull);
                                    _model.categori = _model.choiceChipsValue!;
                                    safeSetState(() {});
                                  },
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    iconSize: 18.0,
                                    elevation: 0.0,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderWidth: 2.0,
                                    borderRadius: BorderRadius.circular(55.0),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    iconSize: 18.0,
                                    elevation: 0.0,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderWidth: 2.0,
                                    borderRadius: BorderRadius.circular(55.0),
                                  ),
                                  chipSpacing: 12.0,
                                  rowSpacing: 12.0,
                                  multiselect: false,
                                  initialized: _model.choiceChipsValue != null,
                                  alignment: WrapAlignment.start,
                                  controller:
                                      _model.choiceChipsValueController ??=
                                          FormFieldController<List<String>>(
                                    [widget!.showActiveCategory],
                                  ),
                                  wrapped: false,
                                ).animateOnPageLoad(animationsMap[
                                    'choiceChipsOnPageLoadAnimation']!),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  FutureBuilder<List<ProductRecord>>(
                    future: queryProductRecordOnce(),
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
                      List<ProductRecord> containerProductRecordList =
                          snapshot.data!;

                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final product = containerProductRecordList
                                  .where((e) => valueOrDefault<bool>(
                                        () {
                                          if (!widget!.showMostPopular &&
                                              !widget!.showSpecialOffer) {
                                            return ((_model.categori ==
                                                    'All') ||
                                                (e.category ==
                                                    _model.categori));
                                          } else if (widget!.showMostPopular) {
                                            return (((_model.categori ==
                                                        'All') ||
                                                    (e.category ==
                                                        _model.categori)) &&
                                                e.popular);
                                          } else if (widget!.showSpecialOffer &&
                                              (widget!.specialOffer != null)) {
                                            return (e.specialOffer &&
                                                (e.specialOfferRef ==
                                                    widget!.specialOffer
                                                        ?.reference) &&
                                                ((_model.categori == 'All') ||
                                                    (e.category ==
                                                        _model.categori)));
                                          } else if (widget!.showSpecialOffer) {
                                            return (((_model.categori ==
                                                        'All') ||
                                                    (e.category ==
                                                        _model.categori)) &&
                                                e.specialOffer);
                                          } else {
                                            return true;
                                          }
                                        }(),
                                        true,
                                      ))
                                  .toList();
                              if (product.isEmpty) {
                                return EmptyWidget(
                                  title: 'No Artwork',
                                  body: 'There is no artwork in this category',
                                  animation:
                                      'https://lottie.host/fc043dd1-5f46-45d5-860f-d5eff262bc9c/pILPeWn1HL.json',
                                  customAction: () async {},
                                );
                              }

                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  childAspectRatio: 0.58,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: product.length,
                                itemBuilder: (context, productIndex) {
                                  final productItem = product[productIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'Detail',
                                        queryParameters: {
                                          'product': serializeParam(
                                            productItem,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'product': productItem,
                                        },
                                      );
                                    },
                                    child: ProductItemWidget(
                                      key: Key(
                                          'Key9je_${productIndex}_of_${product.length}'),
                                      price:
                                          productItem.productInformation.price,
                                      rate: productItem.productInformation.rate,
                                      totalSold:
                                          productItem.productInformation.sold,
                                      image: productItem
                                          .productInformation.productCover,
                                      itemName:
                                          productItem.productInformation.name,
                                    ),
                                  );
                                },
                              ).animateOnPageLoad(animationsMap[
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
                  FutureBuilder<List<ProductRecord>>(
                    future: queryProductRecordOnce(),
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
                      List<ProductRecord> containerProductRecordList =
                          snapshot.data!;

                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final product = containerProductRecordList
                                  .where((e) => valueOrDefault<bool>(
                                        () {
                                          if (!widget!.showMostPopular &&
                                              !widget!.showSpecialOffer) {
                                            return ((_model.categori ==
                                                    'All') ||
                                                (e.category ==
                                                    _model.categori));
                                          } else if (widget!.showMostPopular) {
                                            return (((_model.categori ==
                                                        'All') ||
                                                    (e.category ==
                                                        _model.categori)) &&
                                                e.popular);
                                          } else if (widget!.showSpecialOffer &&
                                              (widget!.specialOffer != null)) {
                                            return (e.specialOffer &&
                                                (e.specialOfferRef ==
                                                    widget!.specialOffer
                                                        ?.reference) &&
                                                ((_model.categori == 'All') ||
                                                    (e.category ==
                                                        _model.categori)));
                                          } else if (widget!.showSpecialOffer) {
                                            return (((_model.categori ==
                                                        'All') ||
                                                    (e.category ==
                                                        _model.categori)) &&
                                                e.specialOffer);
                                          } else {
                                            return true;
                                          }
                                        }(),
                                        true,
                                      ))
                                  .toList();
                              if (product.isEmpty) {
                                return EmptyWidget(
                                  title: 'No Artwork!',
                                  body: 'There is no artwork in this category',
                                  customAction: () async {},
                                );
                              }

                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10.0,
                                  childAspectRatio: 0.85,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: product.length,
                                itemBuilder: (context, productIndex) {
                                  final productItem = product[productIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'Detail',
                                        queryParameters: {
                                          'product': serializeParam(
                                            productItem,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'product': productItem,
                                        },
                                      );
                                    },
                                    child: ProductItemWidget(
                                      key: Key(
                                          'Keyx61_${productIndex}_of_${product.length}'),
                                      price:
                                          productItem.productInformation.price,
                                      rate: productItem.productInformation.rate,
                                      totalSold:
                                          productItem.productInformation.sold,
                                      image: productItem
                                          .productInformation.productCover,
                                      itemName:
                                          productItem.productInformation.name,
                                    ),
                                  );
                                },
                              ).animateOnPageLoad(animationsMap[
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
                  FutureBuilder<List<ProductRecord>>(
                    future: queryProductRecordOnce(),
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
                      List<ProductRecord> containerProductRecordList =
                          snapshot.data!;

                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final product = containerProductRecordList
                                  .where((e) => valueOrDefault<bool>(
                                        () {
                                          if (!widget!.showMostPopular &&
                                              !widget!.showSpecialOffer) {
                                            return ((_model.categori ==
                                                    'All') ||
                                                (e.category ==
                                                    _model.categori));
                                          } else if (widget!.showMostPopular) {
                                            return (((_model.categori ==
                                                        'All') ||
                                                    (e.category ==
                                                        _model.categori)) &&
                                                e.popular);
                                          } else if (widget!.showSpecialOffer &&
                                              (widget!.specialOffer != null)) {
                                            return (e.specialOffer &&
                                                (e.specialOfferRef ==
                                                    widget!.specialOffer
                                                        ?.reference) &&
                                                ((_model.categori == 'All') ||
                                                    (e.category ==
                                                        _model.categori)));
                                          } else if (widget!.showSpecialOffer) {
                                            return (((_model.categori ==
                                                        'All') ||
                                                    (e.category ==
                                                        _model.categori)) &&
                                                e.specialOffer);
                                          } else {
                                            return true;
                                          }
                                        }(),
                                        true,
                                      ))
                                  .toList();
                              if (product.isEmpty) {
                                return EmptyWidget(
                                  title: 'No Artwork!',
                                  body: 'There is no artwork in this category',
                                  customAction: () async {},
                                );
                              }

                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  crossAxisSpacing: 10.0,
                                  childAspectRatio: 0.95,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: product.length,
                                itemBuilder: (context, productIndex) {
                                  final productItem = product[productIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'Detail',
                                        queryParameters: {
                                          'product': serializeParam(
                                            productItem,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'product': productItem,
                                        },
                                      );
                                    },
                                    child: ProductItemWidget(
                                      key: Key(
                                          'Keyzc0_${productIndex}_of_${product.length}'),
                                      price:
                                          productItem.productInformation.price,
                                      rate: productItem.productInformation.rate,
                                      totalSold:
                                          productItem.productInformation.sold,
                                      image: productItem
                                          .productInformation.productCover,
                                      itemName:
                                          productItem.productInformation.name,
                                    ),
                                  );
                                },
                              ).animateOnPageLoad(animationsMap[
                                  'gridViewOnPageLoadAnimation3']!);
                            },
                          ),
                        ),
                      );
                    },
                  ),
              ].addToEnd(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
