import '/components/side_nav_content_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/logout_confirm_modal/logout_confirm_modal_widget.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for side_nav component.
  late SideNavModel sideNavModel;
  // State field(s) for Switch widget.
  bool? switchValue;
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
