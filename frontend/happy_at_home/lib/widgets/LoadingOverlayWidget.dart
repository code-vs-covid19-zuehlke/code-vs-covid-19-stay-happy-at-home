import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoadingOverlayWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  LoadingOverlayWidget({this.isLoading, this.child});

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      progressIndicator: SpinKitCircle(
        color: Colors.white,
      ),
      color: Colors.blue,
      isLoading: isLoading,
      child: child,
    );
  }
}
