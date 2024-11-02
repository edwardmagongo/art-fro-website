import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_widget.dart';
import '/components/order_ongoing_item/order_ongoing_item_widget.dart';
import '/components/side_nav_content_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'order_history_widget.dart' show OrderHistoryWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderHistoryModel extends FlutterFlowModel<OrderHistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Side_nav_content component.
  late SideNavContentModel sideNavContentModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for side_nav component.
  late SideNavModel sideNavModel;

  @override
  void initState(BuildContext context) {
    sideNavContentModel = createModel(context, () => SideNavContentModel());
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavContentModel.dispose();
    tabBarController?.dispose();
    sideNavModel.dispose();
  }
}
