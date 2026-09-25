import 'package:flutter/material.dart';

import 'package:olek_udemy_portfolio/components.dart';
import 'package:olek_udemy_portfolio/contact_form.dart';
import 'package:olek_udemy_portfolio/content.dart';
import 'package:olek_udemy_portfolio/theme.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _worksKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
      alignment: 0.05,
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final horizontalPadding = size.width > 1200 ? 120.0 : 48.0;
    final showTabs = size.width > 1100;

    return Scaffold(
      drawer: _SideDrawer(onNavigate: _scrollTo, sections: _sections),
      floatingActionButton: ScrollToTopButton(controller: _scrollController),
      appBar: AppBar(
        title: SansBold(Profile.name, 20),
        actions: [
          if (showTabs)
            for (final section in _sections.entries)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: TabsWeb(
                  title: section.key,
                  onTap: () => _scrollTo(section.value),
                ),
              ),
          const SizedBox(width: 8),
          const ThemeToggleButton(),
          const SizedBox(width: 16),
        ],
      ),
      body: ListView(
        controller: _scrollController,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 40),
        children: [
          _Hero(
            key: _homeKey,
            onContact: () => _scrollTo(_contactKey),
            onWorks: () => _scrollTo(_worksKey),
          ),
          const SizedBox(height: 100),
          _About(key: _aboutKey),
          const SizedBox(height: 100),
          _Services(key: _servicesKey),
          const SizedBox(height: 100),
          _Works(key: _worksKey),
          const SizedBox(height: 100),
          _Contact(key: _contactKey, maxWidth: size.width - horizontalPadding * 2),
          const SizedBox(height: 60),
          Divider(color: scheme.outlineVariant),
          const SizedBox(height: 20),
          Center(
            child: Sans(
              '© ${DateTime.now().year} ${Profile.name} · Built with Flutter',
              14,
              color: scheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Map<String, GlobalKey> get _sections => <String, GlobalKey>{
        'Home': _homeKey,
        'About': _aboutKey,
        'Services': _servicesKey,
        'Works': _worksKey,
        'Contact': _contactKey,
      };
}

class _SideDrawer extends StatelessWidget {
  const _SideDrawer({required this.onNavigate, required this.sections});

  final void Function(GlobalKey key) onNavigate;
  final Map<String, GlobalKey> sections;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 72,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const CircleAvatar(
              radius: 68,
              backgroundImage: AssetImage(Profile.avatar),
            ),
          ),
          const SizedBox(height: 16),
          SansBold(Profile.name, 26),
          Sans(Profile.role, 16),
          const SizedBox(height: 24),
          for (final section in sections.entries) ...[
            TabsMobile(
              text: section.key,
              onTap: () {
                Navigator.of(context).pop();
                onNavigate(section.value);
              },
            ),
            const SizedBox(height: 12),
          ],
          const SizedBox(height: 12),
          const SocialLinks(
            instagramUrl: Profile.instagram,
            githubUrl: Profile.github,
          ),
        ],
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero({required this.onContact, required this.onWorks, super.key});

  final VoidCallback onContact;
  final VoidCallback onWorks;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 60,
      runSpacing: 40,
      children: [
        SizedBox(
          width: 520,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: scheme.primaryContainer,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Sans("Hello, I'm", 16, color: scheme.onPrimaryContainer),
              ),
              const SizedBox(height: 16),
              SansBold(Profile.name, 56),
              Sans(Profile.role, 30, color: scheme.primary),
              const SizedBox(height: 16),
              Sans(Profile.tagline, 17, color: scheme.onSurfaceVariant),
              const SizedBox(height: 24),
              ContactLine(
                icon: Icons.email_outlined,
                text: Profile.email,
                uri: Uri(scheme: 'mailto', path: Profile.email),
              ),
              ContactLine(
                icon: Icons.call_outlined,
                text: Profile.phone,
                uri: Uri(scheme: 'tel', path: Profile.phone.replaceAll(' ', '')),
              ),
              ContactLine(
                icon: Icons.location_pin,
                text: Profile.location,
                uri: Uri.parse(
                  'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(Profile.location)}',
                ),
              ),
              const SizedBox(height: 28),
              Wrap(
                spacing: 16,
                runSpacing: 12,
                children: [
                  FilledButton.icon(
                    onPressed: onContact,
                    icon: const Icon(Icons.chat_bubble_outline),
                    label: const Text('Hire me'),
                  ),
                  OutlinedButton.icon(
                    onPressed: onWorks,
                    icon: const Icon(Icons.work_outline),
                    label: const Text('See my work'),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: scheme.primary.withValues(alpha: 0.35),
                blurRadius: 60,
                spreadRadius: 4,
              ),
            ],
          ),
          child: CircleAvatar(
            backgroundColor: scheme.primary,
            radius: 154,
            child: const CircleAvatar(
              radius: 148,
              backgroundImage: AssetImage(Profile.avatar),
            ),
          ),
        ),
      ],
    );
  }
}

class _About extends StatelessWidget {
  const _About({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        const SectionTitle('About me'),
        const SizedBox(height: 40),
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 60,
          runSpacing: 32,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/web.jpg',
                height: 320,
                width: 420,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 520,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Sans(
                    'I specialize in Flutter, which lets one codebase run on Android, iOS, '
                    'web, Windows, macOS and Linux.',
                    17,
                  ),
                  const SizedBox(height: 12),
                  Sans(
                    'Whether you need an app for your business or a personal project, I make '
                    'it not only nice looking and functional, but also safe and maintainable.',
                    17,
                    color: scheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (final skill in Profile.skills) SkillChip(skill),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Services extends StatelessWidget {
  const _Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(
          'What I do',
          subtitle: 'From the first wireframe to the deployed app on your domain or store.',
        ),
        const SizedBox(height: 48),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 32,
          runSpacing: 32,
          children: [
            for (final service in services)
              AnimatedCard(
                imagePath: service.imagePath,
                text: service.title,
                description: service.description,
                reverse: services.indexOf(service).isEven,
              ),
          ],
        ),
      ],
    );
  }
}

class _Works extends StatelessWidget {
  const _Works({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(
          'Selected works',
          subtitle: 'A few projects I built while learning and working with Flutter and Dart.',
        ),
        const SizedBox(height: 48),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 28,
          runSpacing: 28,
          children: [
            for (final project in projects)
              ProjectCard(
                title: project.title,
                description: project.description,
                imagePath: project.imagePath,
                tags: project.tags,
                url: project.url,
              ),
          ],
        ),
      ],
    );
  }
}

class _Contact extends StatelessWidget {
  const _Contact({required this.maxWidth, super.key});

  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final fieldWidth = maxWidth > 900 ? 380.0 : maxWidth.clamp(240.0, 520.0);
    return Column(
      children: [
        const SectionTitle(
          'Contact me',
          subtitle: 'Tell me about your project and I will get back to you within a day.',
        ),
        const SizedBox(height: 40),
        ContactForm(fieldWidth: fieldWidth, twoColumns: maxWidth > 900),
        const SizedBox(height: 32),
        const SocialLinks(
          instagramUrl: Profile.instagram,
          githubUrl: Profile.github,
        ),
      ],
    );
  }
}
