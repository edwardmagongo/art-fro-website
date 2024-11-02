import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/empty_widget.dart';
import '/components/side_nav_content_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import '/flutter_flow/request_manager.dart';

import 'customer_support_widget.dart' show CustomerSupportWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CustomerSupportModel extends FlutterFlowModel<CustomerSupportWidget> {
  ///  Local state fields for this page.

  bool hasAttachment = false;

  String? imageAttachment = '';

  String? audioAttachment = '';

  String? videoAttachment = '';

  bool attachMenu = false;

  bool uplaoding = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for CustomerServiceColumn widget.
  ScrollController? customerServiceColumn;
  // State field(s) for message widget.
  FocusNode? messageFocusNode;
  TextEditingController? messageTextController;
  String? Function(BuildContext, String?)? messageTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in send widget.
  SupportMesagesRecord? messageCreated;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // Model for side_nav component.
  late SideNavModel sideNavModel;
  // Model for Side_nav_content component.
  late SideNavContentModel sideNavContentModel;

  /// Query cache managers for this widget.

  final _supportMessagesUserManager =
      StreamRequestManager<List<SupportMesagesRecord>>();
  Stream<List<SupportMesagesRecord>> supportMessagesUser({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<SupportMesagesRecord>> Function() requestFn,
  }) =>
      _supportMessagesUserManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSupportMessagesUserCache() => _supportMessagesUserManager.clear();
  void clearSupportMessagesUserCacheKey(String? uniqueKey) =>
      _supportMessagesUserManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    customerServiceColumn = ScrollController();
    sideNavModel = createModel(context, () => SideNavModel());
    sideNavContentModel = createModel(context, () => SideNavContentModel());
  }

  @override
  void dispose() {
    customerServiceColumn?.dispose();
    messageFocusNode?.dispose();
    messageTextController?.dispose();

    sideNavModel.dispose();
    sideNavContentModel.dispose();

    /// Dispose query cache managers for this widget.

    clearSupportMessagesUserCache();
  }
}
