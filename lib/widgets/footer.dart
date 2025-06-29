import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Contáctanos: pedidos@pizzart.com | +591 77198606',
            style: AppTextStyles.whiteBody.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(
                icon: FontAwesomeIcons.facebookF,
                url: 'https://facebook.com/',
              ),
              const SizedBox(width: 28),
              _SocialIcon(
                icon: FontAwesomeIcons.instagram,
                url: 'https://instagram.com/',
              ),
              const SizedBox(width: 28),
              _SocialIcon(
                icon: FontAwesomeIcons.tiktok,
                url: 'https://tiktok.com/',
              ),
            ],
          ),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 28,
            children: [
              _FooterLink(
                text: 'Política de privacidad',
                onTap: () {
                  //Navegar a política de privacidad
                },
              ),
              _FooterLink(
                text: 'Aviso legal',
                onTap: () {
                  //Navegar a aviso legal
                },
              ),
            ],
          ),
          const SizedBox(height: 28),
          Text(
            '© 2025 PizzArt. Todos los derechos reservados.',
            style: AppTextStyles.whiteBody.copyWith(
              fontSize: 12,
              color: Colors.grey[400],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;

  const _SocialIcon({required this.icon, required this.url});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovering = false;

  void _launchUrl() async {
    final Uri uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // Manejar error
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _launchUrl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _hovering ? AppColors.accent : Colors.transparent,
            shape: BoxShape.circle,
            boxShadow: _hovering
                ? [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: AppColors.accent.withOpacity(0.6),
                      blurRadius: 12,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : [],
          ),
          child: FaIcon(
            widget.icon,
            color: _hovering ? Colors.white : AppColors.textLight,
            size: 28,
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _FooterLink({required this.text, required this.onTap});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.text,
          style: AppTextStyles.whiteBody.copyWith(
            decoration: TextDecoration.underline,
            fontWeight: _hovering ? FontWeight.w700 : FontWeight.w500,
            color: _hovering ? AppColors.accent : Colors.white70,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
