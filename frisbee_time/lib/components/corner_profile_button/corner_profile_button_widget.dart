import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'corner_profile_button_model.dart';
export 'corner_profile_button_model.dart';

class CornerProfileButtonWidget extends StatefulWidget {
  const CornerProfileButtonWidget({Key? key}) : super(key: key);

  @override
  _CornerProfileButtonWidgetState createState() =>
      _CornerProfileButtonWidgetState();
}

class _CornerProfileButtonWidgetState extends State<CornerProfileButtonWidget> {
  late CornerProfileButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CornerProfileButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(-1.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 25.0, 0.0, 0.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.pushNamed('GeneralSettings');
          },
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 2.0),
                )
              ],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.account_circle_outlined,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 35.0,
            ),
          ),
        ),
      ),
    );
  }
}
