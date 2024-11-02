import '/components/header/header_widget.dart';
import '/components/payment_method_item/payment_method_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'payment_methods_widget.dart' show PaymentMethodsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentMethodsModel extends FlutterFlowModel<PaymentMethodsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for PaymentMethodItem component.
  late PaymentMethodItemModel paymentMethodItemModel1;
  // Model for PaymentMethodItem component.
  late PaymentMethodItemModel paymentMethodItemModel2;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    paymentMethodItemModel1 =
        createModel(context, () => PaymentMethodItemModel());
    paymentMethodItemModel2 =
        createModel(context, () => PaymentMethodItemModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    paymentMethodItemModel1.dispose();
    paymentMethodItemModel2.dispose();
  }
}
