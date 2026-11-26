import 'dart:math';

import 'package:material_ui/material_ui.dart';

class PortfolioBrightnessSwitch extends StatefulWidget {
  final void Function()? onPressed;

  const PortfolioBrightnessSwitch({
    super.key,
    this.onPressed,
  });

  @override
  State<PortfolioBrightnessSwitch> createState() => _PortfolioBrightnessSwitchState();
}

class _PortfolioBrightnessSwitchState extends State<PortfolioBrightnessSwitch> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  Brightness? old;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animationController.addListener(() => setState(() {}));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final brightness = Theme.of(context).brightness;

    if (old == null) {
      if (brightness == Brightness.dark) {
        animationController.value = 0.0;
      } else {
        animationController.value = 1.0;
      }
    } else if (old != brightness) {
      if (brightness == Brightness.dark) {
        animationController.reverse(from: 1.0);
      } else {
        animationController.forward(from: 0.0);
      }
    }

    old = brightness;
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final darkIcon = IconButton(
      onPressed: widget.onPressed,
      style: IconButton.styleFrom(
        foregroundColor: const Color(0xFFA8C7FA),
      ),
      icon: const Icon(
        Icons.dark_mode,
        color: Color(0xFFA8C7FA),
      ),
    );

    final lightIcon = IconButton(
      onPressed: widget.onPressed,
      style: IconButton.styleFrom(
        foregroundColor: const Color(0xFFFFD600),
      ),
      icon: const Icon(
        Icons.light_mode,
        color: Color(0xFFFFD600),
      ),
    );

    return Transform.rotate(
      angle: animationController.value * 2.0 * pi * 2.0,
      child: Transform.scale(
        scale: 2.0 * (animationController.value - 0.5).abs(),
        child: animationController.value < 0.5 ? darkIcon : lightIcon,
      ),
    );
  }
}
