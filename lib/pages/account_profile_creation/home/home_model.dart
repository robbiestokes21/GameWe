import '/components/post_widget.dart';
import '/componets/bottom_nav/bottom_nav_widget.dart';
import '/componets/top_nav/top_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for topNav component.
  late TopNavModel topNavModel;
  // Model for post component.
  late PostModel postModel;
  // Model for bottomNav component.
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    topNavModel = createModel(context, () => TopNavModel());
    postModel = createModel(context, () => PostModel());
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    topNavModel.dispose();
    postModel.dispose();
    bottomNavModel.dispose();
  }
}
