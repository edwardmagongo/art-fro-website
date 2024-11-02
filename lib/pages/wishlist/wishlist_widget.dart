import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_widget.dart';
import '/components/product_item/product_item_widget.dart';
import '/components/side_nav_content_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'wishlist_model.dart';
export 'wishlist_model.dart';

class WishlistWidget extends StatefulWidget {
  const WishlistWidget({super.key});

  @override
  State<WishlistWidget> createState() => _WishlistWidgetState();
}

class _WishlistWidgetState extends State<WishlistWidget> {
  late WishlistModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WishlistModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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

        final wishlistUsersRecord = snapshot.data!;

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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: wrapWithModel(
                          model: _model.sideNavModel,
                          updateCallback: () => safeSetState(() {}),
                          child: SideNavWidget(),
                        ),
                      ),
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final product = wishlistUsersRecord
                                          .productsLiked
                                          .toList();
                                      if (product.isEmpty) {
                                        return EmptyWidget(
                                          body: 'Your favourites list is empty',
                                          customAction: () async {},
                                        );
                                      }

                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          childAspectRatio: 0.58,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: product.length,
                                        itemBuilder: (context, productIndex) {
                                          final productItem =
                                              product[productIndex];
                                          return FutureBuilder<ProductRecord>(
                                            future:
                                                ProductRecord.getDocumentOnce(
                                                    productItem),
                                            builder: (context, snapshot) {
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

                                              final productItemProductRecord =
                                                  snapshot.data!;

                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'Detail',
                                                    queryParameters: {
                                                      'product': serializeParam(
                                                        productItemProductRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'product':
                                                          productItemProductRecord,
                                                    },
                                                  );
                                                },
                                                child: ProductItemWidget(
                                                  key: Key(
                                                      'Keyc6j_${productIndex}_of_${product.length}'),
                                                  price:
                                                      productItemProductRecord
                                                          .productInformation
                                                          .price,
                                                  rate: productItemProductRecord
                                                      .productInformation.rate,
                                                  totalSold:
                                                      productItemProductRecord
                                                          .productInformation
                                                          .sold,
                                                  image:
                                                      productItemProductRecord
                                                          .productInformation
                                                          .productCover,
                                                  itemName:
                                                      productItemProductRecord
                                                          .productInformation
                                                          .name,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(height: 16.0))
                                  .addToEnd(SizedBox(height: 24.0)),
                            ),
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        desktop: false,
                      ))
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final product = wishlistUsersRecord
                                          .productsLiked
                                          .toList();
                                      if (product.isEmpty) {
                                        return EmptyWidget(
                                          body: 'Your wish list is empty',
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
                                          final productItem =
                                              product[productIndex];
                                          return FutureBuilder<ProductRecord>(
                                            future:
                                                ProductRecord.getDocumentOnce(
                                                    productItem),
                                            builder: (context, snapshot) {
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

                                              final productItemProductRecord =
                                                  snapshot.data!;

                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'Detail',
                                                    queryParameters: {
                                                      'product': serializeParam(
                                                        productItemProductRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'product':
                                                          productItemProductRecord,
                                                    },
                                                  );
                                                },
                                                child: ProductItemWidget(
                                                  key: Key(
                                                      'Keynfc_${productIndex}_of_${product.length}'),
                                                  price:
                                                      productItemProductRecord
                                                          .productInformation
                                                          .price,
                                                  rate: productItemProductRecord
                                                      .productInformation.rate,
                                                  totalSold:
                                                      productItemProductRecord
                                                          .productInformation
                                                          .sold,
                                                  image:
                                                      productItemProductRecord
                                                          .productInformation
                                                          .productCover,
                                                  itemName:
                                                      productItemProductRecord
                                                          .productInformation
                                                          .name,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(height: 16.0))
                                  .addToEnd(SizedBox(height: 24.0)),
                            ),
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                      ))
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final product = wishlistUsersRecord
                                          .productsLiked
                                          .toList();
                                      if (product.isEmpty) {
                                        return EmptyWidget(
                                          body: 'Your wish list is empty',
                                          customAction: () async {},
                                        );
                                      }

                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          crossAxisSpacing: 10.0,
                                          childAspectRatio: 0.95,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: product.length,
                                        itemBuilder: (context, productIndex) {
                                          final productItem =
                                              product[productIndex];
                                          return FutureBuilder<ProductRecord>(
                                            future:
                                                ProductRecord.getDocumentOnce(
                                                    productItem),
                                            builder: (context, snapshot) {
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

                                              final productItemProductRecord =
                                                  snapshot.data!;

                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'Detail',
                                                    queryParameters: {
                                                      'product': serializeParam(
                                                        productItemProductRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'product':
                                                          productItemProductRecord,
                                                    },
                                                  );
                                                },
                                                child: ProductItemWidget(
                                                  key: Key(
                                                      'Keymj4_${productIndex}_of_${product.length}'),
                                                  price:
                                                      productItemProductRecord
                                                          .productInformation
                                                          .price,
                                                  rate: productItemProductRecord
                                                      .productInformation.rate,
                                                  totalSold:
                                                      productItemProductRecord
                                                          .productInformation
                                                          .sold,
                                                  image:
                                                      productItemProductRecord
                                                          .productInformation
                                                          .productCover,
                                                  itemName:
                                                      productItemProductRecord
                                                          .productInformation
                                                          .name,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(height: 16.0))
                                  .addToEnd(SizedBox(height: 24.0)),
                            ),
                          ),
                        ),
                    ],
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
