import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'authcallback_model.dart';
export 'authcallback_model.dart';

class AuthcallbackWidget extends StatefulWidget {
  const AuthcallbackWidget({
    super.key,
    required this.code,
  });

  final String? code;

  @override
  State<AuthcallbackWidget> createState() => _AuthcallbackWidgetState();
}

class _AuthcallbackWidgetState extends State<AuthcallbackWidget> {
  late AuthcallbackModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthcallbackModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().code = widget.code!;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'your code: ${widget.code}',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
      _model.apiResultcqv = await GetBattleNetTokenCall.call(
        code: widget.code,
      );

      if ((_model.apiResultcqv?.jsonBody ?? '')) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              (_model.apiResultcqv?.jsonBody ?? '').toString(),
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
        FFAppState().token = getJsonField(
          (_model.apiResultcqv?.jsonBody ?? ''),
          r'''$.access_token''',
        ).toString().toString();
        setState(() {});
        _model.getUser = await GetBattleNetCall.call(
          accessToken: FFAppState().token,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.getUser?.jsonBody ?? ''),
                r'''$.battletag''',
              ).toString().toString(),
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
        if (valueOrDefault(currentUserDocument?.battlenetGamerTag, '') ==
                null ||
            valueOrDefault(currentUserDocument?.battlenetGamerTag, '') == '') {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Adding Battlenet....',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
          FFAppState().battlenetTag = getJsonField(
            (_model.getUser?.jsonBody ?? ''),
            r'''$.battletag''',
          ).toString().toString();
          setState(() {});
          unawaited(
            () async {
              await currentUserReference!.update(createUsersRecordData(
                battlenetGamerTag: getJsonField(
                  (_model.getUser?.jsonBody ?? ''),
                  r'''$.battletag''',
                ).toString().toString(),
              ));
            }(),
          );
          await Future.delayed(const Duration(milliseconds: 45000));
        } else {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'BattleNet already added...',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
          await actions.openApp();
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'authcallback',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFAppState().authCode,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
