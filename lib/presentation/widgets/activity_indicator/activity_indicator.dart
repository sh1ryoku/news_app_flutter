import 'package:flutter/material.dart';

/// Если не задан [backgroundColor], то фон по умолчанию будет
/// [UiKitColor.light].withOpacity(0.40)
class ActivityIndicator extends StatelessWidget {
  const ActivityIndicator({
    Key? key,
    this.isEnableTouches = true,
    this.isBackgroundShowing = true,
  }) : super(key: key);

  final bool isBackgroundShowing;
  final bool isEnableTouches;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isEnableTouches,
      child: Container(
        color: isBackgroundShowing ? Colors.blue : null,
        child: const Center(
          child: CircularProgressIndicator(color: Colors.blue),
        ),
      ),
    );
  }
}
