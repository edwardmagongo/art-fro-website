import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_widget.dart';
import '/components/header/header_widget.dart';
import '/components/order_item/order_item_widget.dart';
import '/components/shipping_order/shipping_order_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/promo_add/promo_add_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'check_out_widget.dart' show CheckOutWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckOutModel extends FlutterFlowModel<CheckOutWidget> {
  ///  Local state fields for this page.

  PromoCodesRecord? promoCodeAdded;

  double? promoPercent = 0.0;

  double? tax = 1.2;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for ShippingOrder component.
  late ShippingOrderModel shippingOrderModel;
  // Model for empty component.
  late EmptyModel emptyModel;
  // Stores action output result for [Bottom Sheet - PromoAdd] action in IconButton widget.
  PromoCodesRecord? promoCode;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  OrderRecord? updatedOrder;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  OrderRecord? updatedOrderFinal;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    shippingOrderModel = createModel(context, () => ShippingOrderModel());
    emptyModel = createModel(context, () => EmptyModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    shippingOrderModel.dispose();
    emptyModel.dispose();
  }
}
