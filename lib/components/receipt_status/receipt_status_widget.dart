import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'receipt_status_model.dart';
export 'receipt_status_model.dart';

class ReceiptStatusWidget extends StatefulWidget {
  const ReceiptStatusWidget({
    super.key,
    this.color,
    required this.text,
  });

  final Color? color;
  final String? text;

  @override
  State<ReceiptStatusWidget> createState() => _ReceiptStatusWidgetState();
}

class _ReceiptStatusWidgetState extends State<ReceiptStatusWidget> {
  late ReceiptStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReceiptStatusModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget!.color,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 10.0, 6.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              valueOrDefault<String>(
                widget!.text,
                '0719228831',
              ),
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
