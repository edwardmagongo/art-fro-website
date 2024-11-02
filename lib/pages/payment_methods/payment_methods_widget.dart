import '/components/header/header_widget.dart';
import '/components/payment_method_item/payment_method_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_methods_model.dart';
export 'payment_methods_model.dart';

class PaymentMethodsWidget extends StatefulWidget {
  const PaymentMethodsWidget({super.key});

  @override
  State<PaymentMethodsWidget> createState() => _PaymentMethodsWidgetState();
}

class _PaymentMethodsWidgetState extends State<PaymentMethodsWidget> {
  late PaymentMethodsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentMethodsModel());

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
                    'bev5ue3s' /* Payment Methods */,
                  ),
                  showBackButton: true,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().PaymentMethod = 'M-Pesa';
                                  FFAppState().update(() {});
                                },
                                child: wrapWithModel(
                                  model: _model.paymentMethodItemModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: PaymentMethodItemWidget(
                                    title: 'M-Pesa',
                                    icon: Icon(
                                      FFIcons.kmoneyDefault,
                                    ),
                                    photo:
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/art-fro-scentric-studios-p9iy2z/assets/jc4kzhs75e5t/M-Pesa_Icon.png',
                                    isDefault:
                                        FFAppState().PaymentMethod == 'M-Pesa',
                                    showIcon: false,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().PaymentMethod = 'Cash';
                                  FFAppState().update(() {});
                                },
                                child: wrapWithModel(
                                  model: _model.paymentMethodItemModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: PaymentMethodItemWidget(
                                    title: FFLocalizations.of(context)
                                        .getVariableText(
                                      enText: 'Cash',
                                      esText: ' Dinero',
                                      frText: ' Espèces',
                                      arText: 'نقدي',
                                      swText: ' Pesa',
                                    ),
                                    icon: Icon(
                                      FFIcons.kmoneyDefault,
                                    ),
                                    photo:
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e-soko-540n2b/assets/5nwwhtpbr2hv/Money_Icon.png',
                                    isDefault:
                                        FFAppState().PaymentMethod == 'Cash',
                                    showIcon: false,
                                  ),
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
      ),
    );
  }
}
