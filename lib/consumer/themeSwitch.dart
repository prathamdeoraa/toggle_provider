import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_provider/provider/opacity_provider.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OpacityProvider>(
      builder: (context, provider, child) {
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Positioned.fill(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            color: isDark
                ? Colors.black.withOpacity(provider.opacity)
                : Colors.white.withOpacity(provider.opacity / 5),
          ),
        );
      },
    );
  }
}
