import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:olek_udemy_portfolio/content.dart';
import 'package:olek_udemy_portfolio/theme.dart';

/// Navigation entry of the desktop app bar. Either navigates to [route] or
/// runs [onTap] (used for in-page section scrolling).
class TabsWeb extends StatefulWidget {
  const TabsWeb({required this.title, this.route, this.onTap, super.key});

  final String title;
  final String? route;
  final VoidCallback? onTap;

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool _hovering = false;

  void _handleTap() {
    if (widget.onTap != null) {
      widget.onTap!();
    } else if (widget.route != null) {
      Navigator.of(context).pushNamed(widget.route!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: _handleTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _hovering ? scheme.primary.withValues(alpha: 0.12) : Colors.transparent,
          ),
          child: Text(
            widget.title,
            style: GoogleFonts.oswald(
              fontSize: 18,
              color: _hovering ? scheme.primary : scheme.onSurface,
              fontWeight: _hovering ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

/// Navigation entry of the mobile drawer.
class TabsMobile extends StatelessWidget {
  const TabsMobile({required this.text, this.route, this.onTap, super.key});

  final String text;
  final String? route;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 50,
      child: FilledButton(
        onPressed: () {
          if (onTap != null) {
            onTap!();
          } else if (route != null) {
            Navigator.of(context).pushNamed(route!);
          }
        },
        child: Text(text),
      ),
    );
  }
}

class SansBold extends StatelessWidget {
  const SansBold(this.text, this.size, {this.color, this.align, super.key});

  final String text;
  final double size;
  final Color? color;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.openSans(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color ?? Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}

class Sans extends StatelessWidget {
  const Sans(this.text, this.size, {this.color, this.align, super.key});

  final String text;
  final double size;
  final Color? color;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.openSans(
        fontSize: size,
        color: color ?? Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}

/// Labelled text field used by every contact form.
class TextForm extends StatelessWidget {
  const TextForm({
    required this.heading,
    required this.hintText,
    required this.width,
    this.maxLines,
    this.controller,
    this.validator,
    this.keyboardType,
    super.key,
  });

  final String heading;
  final String hintText;
  final double width;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Sans(heading, 17),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            maxLines: maxLines ?? 1,
            inputFormatters: [LengthLimitingTextInputFormatter(1000)],
            decoration: InputDecoration(hintText: hintText),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.title, {this.subtitle, this.center = true, super.key});

  final String title;
  final String? subtitle;
  final bool center;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        SansBold(title, 32, align: center ? TextAlign.center : TextAlign.start),
        const SizedBox(height: 8),
        Container(
          height: 4,
          width: 56,
          decoration: BoxDecoration(
            color: scheme.primary,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          SizedBox(
            width: 620,
            child: Sans(
              subtitle!,
              16,
              align: center ? TextAlign.center : TextAlign.start,
              color: scheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}

class SkillChip extends StatelessWidget {
  const SkillChip(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: scheme.primaryContainer.withValues(alpha: 0.4),
        border: Border.all(color: scheme.primary.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: GoogleFonts.openSans(fontSize: 14, color: scheme.onSurface),
      ),
    );
  }
}

/// Card that lifts on hover and slowly floats up and down.
class AnimatedCard extends StatefulWidget {
  const AnimatedCard({
    required this.imagePath,
    required this.text,
    this.description,
    this.fit,
    this.reverse = false,
    this.height,
    this.width,
    super.key,
  });

  final String imagePath;
  final String text;
  final String? description;
  final BoxFit? fit;
  final bool reverse;
  final double? height;
  final double? width;

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  late final Animation<Offset> _animation = Tween<Offset>(
    begin: widget.reverse ? const Offset(0, 0.04) : Offset.zero,
    end: widget.reverse ? Offset.zero : const Offset(0, 0.04),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  bool _hovering = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SlideTransition(
      position: _animation,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovering = true),
        onExit: (_) => setState(() => _hovering = false),
        child: AnimatedScale(
          scale: _hovering ? 1.03 : 1,
          duration: const Duration(milliseconds: 200),
          child: Container(
            width: (widget.width ?? 240) + 40,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: scheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _hovering ? scheme.primary : scheme.outlineVariant,
              ),
              boxShadow: [
                BoxShadow(
                  color: scheme.primary.withValues(alpha: _hovering ? 0.25 : 0.08),
                  blurRadius: _hovering ? 28 : 14,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    widget.imagePath,
                    height: widget.height ?? 160,
                    width: widget.width ?? 240,
                    fit: widget.fit ?? BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 14),
                SansBold(widget.text, 17),
                if (widget.description != null) ...[
                  const SizedBox(height: 8),
                  SizedBox(
                    width: widget.width ?? 240,
                    child: Sans(
                      widget.description!,
                      14,
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Project tile with hover elevation that opens the repository when tapped.
class ProjectCard extends StatefulWidget {
  const ProjectCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.tags,
    this.url,
    this.width = 300,
    super.key,
  });

  final String title;
  final String description;
  final String imagePath;
  final List<String> tags;
  final String? url;
  final double width;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return MouseRegion(
      cursor: widget.url == null ? MouseCursor.defer : SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.url == null
            ? null
            : () => launchUrl(
                Uri.parse(widget.url!),
                mode: LaunchMode.externalApplication,
              ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.width,
          transform: Matrix4.translationValues(0, _hovering ? -6 : 0, 0),
          decoration: BoxDecoration(
            color: scheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _hovering ? scheme.primary : scheme.outlineVariant,
            ),
            boxShadow: [
              BoxShadow(
                color: scheme.shadow.withValues(alpha: _hovering ? 0.22 : 0.08),
                blurRadius: _hovering ? 24 : 12,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                widget.imagePath,
                height: 150,
                width: widget.width,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SansBold(widget.title, 18),
                    const SizedBox(height: 8),
                    Sans(widget.description, 14, color: scheme.onSurfaceVariant),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final tag in widget.tags) SkillChip(tag),
                      ],
                    ),
                    if (widget.url != null) ...[
                      const SizedBox(height: 12),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.open_in_new, size: 16, color: scheme.primary),
                          const SizedBox(width: 6),
                          Sans('View on GitHub', 14, color: scheme.primary),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Row of social links rendered from the bundled SVG icons.
class SocialLinks extends StatelessWidget {
  const SocialLinks({
    required this.instagramUrl,
    required this.githubUrl,
    this.size = 30,
    super.key,
  });

  final String instagramUrl;
  final String githubUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;
    Widget link(String asset, String url, String tooltip) {
      return IconButton(
        tooltip: tooltip,
        onPressed: () =>
            launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
        icon: SvgPicture.asset(
          asset,
          width: size,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        link('assets/instagram.svg', instagramUrl, 'Instagram'),
        const SizedBox(width: 8),
        link('assets/github.svg', githubUrl, 'GitHub'),
      ],
    );
  }
}

/// Contact detail line that opens mail, phone or maps when tapped.
class ContactLine extends StatelessWidget {
  const ContactLine({
    required this.icon,
    required this.text,
    required this.uri,
    this.size = 17,
    super.key,
  });

  final IconData icon;
  final String text;
  final Uri uri;
  final double size;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => launchUrl(uri),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: size + 3, color: scheme.primary),
            const SizedBox(width: 12),
            Flexible(child: Sans(text, size)),
          ],
        ),
      ),
    );
  }
}

/// Drawer with the page navigation, shared by the mobile sub pages.
class AppDrawerMobile extends StatelessWidget {
  const AppDrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 48),
        children: [
          Center(
            child: CircleAvatar(
              radius: 64,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(Profile.avatar),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(child: SansBold(Profile.name, 22)),
          Center(child: Sans(Profile.role, 15)),
          const SizedBox(height: 24),
          const Center(child: TabsMobile(text: 'Home', route: '/')),
          const SizedBox(height: 12),
          const Center(child: TabsMobile(text: 'About', route: '/about')),
          const SizedBox(height: 12),
          const Center(child: TabsMobile(text: 'Contact', route: '/contact')),
          const SizedBox(height: 16),
          const Center(child: ThemeToggleButton()),
          const SizedBox(height: 8),
          const SocialLinks(
            instagramUrl: Profile.instagram,
            githubUrl: Profile.github,
          ),
        ],
      ),
    );
  }
}

/// Floating button that appears once the page is scrolled down.
class ScrollToTopButton extends StatelessWidget {
  const ScrollToTopButton({required this.controller, super.key});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final visible = controller.hasClients && controller.offset > 300;
        return AnimatedOpacity(
          opacity: visible ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          child: IgnorePointer(
            ignoring: !visible,
            child: FloatingActionButton(
              tooltip: 'Back to top',
              onPressed: () => controller.animateTo(
                0,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOutCubic,
              ),
              child: const Icon(Icons.arrow_upward),
            ),
          ),
        );
      },
    );
  }
}
