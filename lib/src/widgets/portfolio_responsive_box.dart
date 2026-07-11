import 'package:flutter/widgets.dart';

/// A widget that computes its child's width using linear interpolation
/// over a defined viewport width range.
///
/// The child width is anchored to two viewport breakpoints, and the
/// resulting width is clamped outside that range.
class PortfolioResponsiveBox extends StatelessWidget {
  /// Lower viewport width bound used as the start of the interpolation domain.
  final double viewportStartWidth;

  /// Upper viewport width bound used as the end of the interpolation domain.
  final double viewportEndWidth;

  /// The child's width when the viewport's width is [viewportStartWidth];
  final double widthAtViewportStart;

  /// The child's width when the viewport's width is [viewportEndWidth];
  final double widthAtViewportEnd;

  /// The widget below this widget in the tree.
  final Widget? child;

  const PortfolioResponsiveBox({
    super.key,
    this.viewportStartWidth = 600,
    this.viewportEndWidth = 1920,
    this.widthAtViewportStart = 600,
    this.widthAtViewportEnd = 960,
    this.child,
  });

  double _interpolate(double x) {
    final a = (widthAtViewportEnd - widthAtViewportStart) / (viewportEndWidth - viewportStartWidth);
    final b = widthAtViewportStart - a * viewportStartWidth;
    return (a * x + b).clamp(widthAtViewportStart, widthAtViewportEnd);
  }

  @override
  Widget build(BuildContext context) {
    final width = _interpolate(MediaQuery.sizeOf(context).width);

    return SizedBox(
      width: width,
      child: child,
    );
  }
}
