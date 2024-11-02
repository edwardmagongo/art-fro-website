import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/header/header_widget.dart';
import '/components/order_ongoing_item/order_ongoing_item_widget.dart';
import '/components/receipt_status/receipt_status_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'e_receipt_widget.dart' show EReceiptWidget;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EReceiptModel extends FlutterFlowModel<EReceiptWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for ReceiptStatus component.
  late ReceiptStatusModel receiptStatusModel1;
  // Model for ReceiptStatus component.
  late ReceiptStatusModel receiptStatusModel2;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    receiptStatusModel1 = createModel(context, () => ReceiptStatusModel());
    receiptStatusModel2 = createModel(context, () => ReceiptStatusModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    receiptStatusModel1.dispose();
    receiptStatusModel2.dispose();
  }
}
