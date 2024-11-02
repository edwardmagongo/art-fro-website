import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/colors_widget.dart';
import '/components/empty_widget.dart';
import '/components/review/review_widget.dart';
import '/components/sizes_widget.dart';
import '/components/special_offer_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/info_confirm_modal/info_confirm_modal_widget.dart';
import '/modals/review_give/review_give_widget.dart';
import 'dart:math';
import 'detail_widget.dart' show DetailWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailModel extends FlutterFlowModel<DetailWidget> {
  ///  Local state fields for this page.

  bool liked = false;

  bool letUserGiveReview = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for SpecialOfferCard component.
  late SpecialOfferCardModel specialOfferCardModel;
  // Model for Sizes component.
  late SizesModel sizesModel;
  // Model for Colors component.
  late ColorsModel colorsModel;
  // State field(s) for CountController widget.
  int? countControllerValue;

  @override
  void initState(BuildContext context) {
    specialOfferCardModel = createModel(context, () => SpecialOfferCardModel());
    sizesModel = createModel(context, () => SizesModel());
    colorsModel = createModel(context, () => ColorsModel());
  }

  @override
  void dispose() {
    specialOfferCardModel.dispose();
    sizesModel.dispose();
    colorsModel.dispose();
  }
}
