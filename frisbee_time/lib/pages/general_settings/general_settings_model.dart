import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/corner_back_button/corner_back_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/permissions_util.dart';
import 'general_settings_widget.dart' show GeneralSettingsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GeneralSettingsModel extends FlutterFlowModel<GeneralSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // Model for CornerBackButton component.
  late CornerBackButtonModel cornerBackButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cornerBackButtonModel = createModel(context, () => CornerBackButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    cornerBackButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
