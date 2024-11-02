import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_widget.dart';
import '/components/header/header_widget.dart';
import '/components/order_ongoing_item/order_ongoing_item_widget.dart';
import '/components/order_status_details/order_status_details_widget.dart';
import '/components/track_show/track_show_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:styled_divider/styled_divider.dart';
import 'track_order_widget.dart' show TrackOrderWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TrackOrderModel extends FlutterFlowModel<TrackOrderWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for TrackShow component.
  late TrackShowModel trackShowModel1;
  // Model for TrackShow component.
  late TrackShowModel trackShowModel2;
  // Model for TrackShow component.
  late TrackShowModel trackShowModel3;
  // Model for TrackShow component.
  late TrackShowModel trackShowModel4;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    trackShowModel1 = createModel(context, () => TrackShowModel());
    trackShowModel2 = createModel(context, () => TrackShowModel());
    trackShowModel3 = createModel(context, () => TrackShowModel());
    trackShowModel4 = createModel(context, () => TrackShowModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    trackShowModel1.dispose();
    trackShowModel2.dispose();
    trackShowModel3.dispose();
    trackShowModel4.dispose();
  }
}
