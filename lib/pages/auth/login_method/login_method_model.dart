import '/auth/firebase_auth/auth_util.dart';
import '/components/divider_text/divider_text_widget.dart';
import '/components/signinwith_google/signinwith_google_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_method_widget.dart' show LoginMethodWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginMethodModel extends FlutterFlowModel<LoginMethodWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SigninwithGoogle component.
  late SigninwithGoogleModel signinwithGoogleModel;
  // Model for DividerText.
  late DividerTextModel dividerTextModel;

  @override
  void initState(BuildContext context) {
    signinwithGoogleModel = createModel(context, () => SigninwithGoogleModel());
    dividerTextModel = createModel(context, () => DividerTextModel());
  }

  @override
  void dispose() {
    signinwithGoogleModel.dispose();
    dividerTextModel.dispose();
  }
}
