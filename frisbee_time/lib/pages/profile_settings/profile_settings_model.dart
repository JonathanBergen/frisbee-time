import '/auth/firebase_auth/auth_util.dart';
import '/components/change_email_modal/change_email_modal_widget.dart';
import '/components/change_username_modal/change_username_modal_widget.dart';
import '/components/corner_back_button/corner_back_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'profile_settings_widget.dart' show ProfileSettingsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileSettingsModel extends FlutterFlowModel<ProfileSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
