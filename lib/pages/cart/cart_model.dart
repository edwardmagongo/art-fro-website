import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_widget.dart';
import '/components/order_item/order_item_widget.dart';
import '/components/side_nav_content_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cart_widget.dart' show CartWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Side_nav_content component.
  late SideNavContentModel sideNavContentModel;
  // Model for side_nav component.
  late SideNavModel sideNavModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrderRecord? orderCreated;

  @override
  void initState(BuildContext context) {
    sideNavContentModel = createModel(context, () => SideNavContentModel());
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavContentModel.dispose();
    sideNavModel.dispose();
  }
}
