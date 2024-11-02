import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/na_bar_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nav_bar_widget.dart' show NavBarWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavBarModel extends FlutterFlowModel<NavBarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for NaBarItem component.
  late NaBarItemModel naBarItemModel1;
  // Model for NaBarItem component.
  late NaBarItemModel naBarItemModel2;
  // Model for orders.
  late NaBarItemModel ordersModel;
  // Model for donations.
  late NaBarItemModel donationsModel;
  // Model for profil.
  late NaBarItemModel profilModel;

  @override
  void initState(BuildContext context) {
    naBarItemModel1 = createModel(context, () => NaBarItemModel());
    naBarItemModel2 = createModel(context, () => NaBarItemModel());
    ordersModel = createModel(context, () => NaBarItemModel());
    donationsModel = createModel(context, () => NaBarItemModel());
    profilModel = createModel(context, () => NaBarItemModel());
  }

  @override
  void dispose() {
    naBarItemModel1.dispose();
    naBarItemModel2.dispose();
    ordersModel.dispose();
    donationsModel.dispose();
    profilModel.dispose();
  }
}
