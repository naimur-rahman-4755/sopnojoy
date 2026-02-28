import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialBrandButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final Color? color; // optional color

  const SocialBrandButton({
    super.key,
    required this.icon,
    required this.url,
    this.color, // optional
  });

  @override
  State<SocialBrandButton> createState() => _SocialBrandButtonState();
}

class _SocialBrandButtonState extends State<SocialBrandButton> {
  bool _hovered = false;

  Future<void> _launch() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: _launch,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _hovered
                ? (widget.color ?? Colors.white).withOpacity(0.2)
                : (widget.color ?? Colors.white).withOpacity(0.1),
          ),
          alignment: Alignment.center,
          child: FaIcon(
            widget.icon,
            size: 18,
            color: widget.color ?? Colors.white, // use optional color
          ),
        ),
      ),
    );
  }
}