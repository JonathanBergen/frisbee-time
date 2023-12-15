import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'terms_and_conditions_modal_model.dart';
export 'terms_and_conditions_modal_model.dart';

class TermsAndConditionsModalWidget extends StatefulWidget {
  const TermsAndConditionsModalWidget({Key? key}) : super(key: key);

  @override
  _TermsAndConditionsModalWidgetState createState() =>
      _TermsAndConditionsModalWidgetState();
}

class _TermsAndConditionsModalWidgetState
    extends State<TermsAndConditionsModalWidget> {
  late TermsAndConditionsModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsAndConditionsModalModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(12.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, -1.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
          child: FlutterFlowPdfViewer(
            assetPath: 'assets/pdfs/Terms_of_Service_for_FrisbeeTime_App-4.pdf',
            width: double.infinity,
            height: double.infinity,
            horizontalScroll: false,
          ),
        ),
      ),
    );
  }
}
