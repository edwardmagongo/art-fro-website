import '/auth/firebase_auth/auth_util.dart';
import '/components/divider_widget.dart';
import '/components/header/header_widget.dart';
import '/components/signinwith_google/signinwith_google_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'signup_widget.dart' show SignupWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignupModel extends FlutterFlowModel<SignupWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for email_tf widget.
  FocusNode? emailTfFocusNode1;
  TextEditingController? emailTfTextController1;
  String? Function(BuildContext, String?)? emailTfTextController1Validator;
  String? _emailTfTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ysut8ogx' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'gpa0y73q' /* Give a valid e-mail address */,
      );
    }
    return null;
  }

  // State field(s) for password_tf widget.
  FocusNode? passwordTfFocusNode1;
  TextEditingController? passwordTfTextController1;
  late bool passwordTfVisibility1;
  String? Function(BuildContext, String?)? passwordTfTextController1Validator;
  String? _passwordTfTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yha59gtw' /* Field is required */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'yoj6raru' /* Password should be at least 6 ... */,
      );
    }

    return null;
  }

  // State field(s) for repassword_tf widget.
  FocusNode? repasswordTfFocusNode1;
  TextEditingController? repasswordTfTextController1;
  late bool repasswordTfVisibility1;
  String? Function(BuildContext, String?)? repasswordTfTextController1Validator;
  String? _repasswordTfTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6nugwj54' /* Field is required */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'hqo402f2' /* Password should be at least 6 ... */,
      );
    }

    return null;
  }

  // Model for Divider component.
  late DividerModel dividerModel1;
  // Model for SigninwithGoogle component.
  late SigninwithGoogleModel signinwithGoogleModel1;
  // State field(s) for email_tf widget.
  FocusNode? emailTfFocusNode2;
  TextEditingController? emailTfTextController2;
  String? Function(BuildContext, String?)? emailTfTextController2Validator;
  String? _emailTfTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'm5la4p6i' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for password_tf widget.
  FocusNode? passwordTfFocusNode2;
  TextEditingController? passwordTfTextController2;
  late bool passwordTfVisibility2;
  String? Function(BuildContext, String?)? passwordTfTextController2Validator;
  String? _passwordTfTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd8rqqv1s' /* Field is required */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'dlo9aczs' /* Password should be at least 6 ... */,
      );
    }

    return null;
  }

  // State field(s) for repassword_tf widget.
  FocusNode? repasswordTfFocusNode2;
  TextEditingController? repasswordTfTextController2;
  late bool repasswordTfVisibility2;
  String? Function(BuildContext, String?)? repasswordTfTextController2Validator;
  String? _repasswordTfTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'h3kjvuql' /* Field is required */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'nxd396r2' /* Password should be at least 6 ... */,
      );
    }

    return null;
  }

  // Model for Divider component.
  late DividerModel dividerModel2;
  // Model for SigninwithGoogle component.
  late SigninwithGoogleModel signinwithGoogleModel2;
  // Model for Header component.
  late HeaderModel headerModel;

  @override
  void initState(BuildContext context) {
    emailTfTextController1Validator = _emailTfTextController1Validator;
    passwordTfVisibility1 = false;
    passwordTfTextController1Validator = _passwordTfTextController1Validator;
    repasswordTfVisibility1 = false;
    repasswordTfTextController1Validator =
        _repasswordTfTextController1Validator;
    dividerModel1 = createModel(context, () => DividerModel());
    signinwithGoogleModel1 =
        createModel(context, () => SigninwithGoogleModel());
    emailTfTextController2Validator = _emailTfTextController2Validator;
    passwordTfVisibility2 = false;
    passwordTfTextController2Validator = _passwordTfTextController2Validator;
    repasswordTfVisibility2 = false;
    repasswordTfTextController2Validator =
        _repasswordTfTextController2Validator;
    dividerModel2 = createModel(context, () => DividerModel());
    signinwithGoogleModel2 =
        createModel(context, () => SigninwithGoogleModel());
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    emailTfFocusNode1?.dispose();
    emailTfTextController1?.dispose();

    passwordTfFocusNode1?.dispose();
    passwordTfTextController1?.dispose();

    repasswordTfFocusNode1?.dispose();
    repasswordTfTextController1?.dispose();

    dividerModel1.dispose();
    signinwithGoogleModel1.dispose();
    emailTfFocusNode2?.dispose();
    emailTfTextController2?.dispose();

    passwordTfFocusNode2?.dispose();
    passwordTfTextController2?.dispose();

    repasswordTfFocusNode2?.dispose();
    repasswordTfTextController2?.dispose();

    dividerModel2.dispose();
    signinwithGoogleModel2.dispose();
    headerModel.dispose();
  }
}
