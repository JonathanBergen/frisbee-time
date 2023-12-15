import '/backend/api_requests/api_calls.dart';
import '/components/corner_profile_button/corner_profile_button_widget.dart';
import '/components/game_button/game_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CornerProfileButton component.
  late CornerProfileButtonModel cornerProfileButtonModel;
  // Model for GameButton component.
  late GameButtonModel gameButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cornerProfileButtonModel =
        createModel(context, () => CornerProfileButtonModel());
    gameButtonModel = createModel(context, () => GameButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    cornerProfileButtonModel.dispose();
    gameButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
