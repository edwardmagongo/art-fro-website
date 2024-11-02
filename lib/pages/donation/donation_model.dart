import '/components/side_nav_content_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'donation_widget.dart' show DonationWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DonationModel extends FlutterFlowModel<DonationWidget> {
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
