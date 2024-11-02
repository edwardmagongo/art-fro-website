import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_widget.dart';
import '/components/product_item/product_item_widget.dart';
import '/components/side_nav_content_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'wishlist_widget.dart' show WishlistWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WishlistModel extends FlutterFlowModel<WishlistWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for side_nav component.
  late SideNavModel sideNavModel;
  // Model for Side_nav_content component.
  late SideNavContentModel sideNavContentModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    sideNavContentModel = createModel(context, () => SideNavContentModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    sideNavContentModel.dispose();
  }
}
